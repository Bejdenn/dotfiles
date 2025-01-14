from pprint import pprint
from threading import Thread
from time import sleep
from typing import List

from i3ipc import Connection, Event

FRAME_T = 0.01  # time taken between each frame of fade

# transparency values
CON_AC = 1  # active window
CON_INAC = 0.5  # inactive window


# fade durations
FADE_TIME = 0.2


class Fader:
    def __init__(self):
        self.fader_running = False
        self.fade_queue = []
        self.fade_data = {}

        ipc = Connection()
        ipc.on(Event.WORKSPACE_FOCUS, self.on_workspace_focus)

        ipc.main()

    def add_fade(self, win, start, target, duration):
        if not duration:
            if win.id in self.fade_queue:
                self.fade_queue.remove(win.id)
                del self.fade_data[win.id]
            change_opacity(win, target)
            return

        if win.id in self.fade_queue:
            f = self.fade_data[win.id]
            change = (FRAME_T / duration) * (target - f["opacity"])
            f["change"] = change
            f["target"] = target
            return

        change_opacity(win, start)
        change = (FRAME_T / duration) * (target - start)
        fade_data = {"opacity": start, "change": change, "target": target, "win": win}
        self.fade_queue.append(win.id)
        self.fade_data[win.id] = fade_data

    def start_fader(self):
        if not self.fader_running:
            self.fader_running = True
            Thread(target=self.fader).start()

    def fader(self):
        while self.fade_queue:
            for win_id in self.fade_queue.copy():
                try:
                    f = self.fade_data[win_id]
                except KeyError:
                    continue
                f["opacity"] += f["change"]

                finished = False
                if f["change"] > 0:
                    if f["opacity"] >= f["target"]:
                        finished = True
                elif f["opacity"] <= f["target"]:
                    finished = True

                if finished:
                    change_opacity(f["win"], f["target"])
                    try:
                        self.fade_queue.remove(win_id)
                        del self.fade_data[win_id]
                    except (KeyError, ValueError):
                        continue
                else:
                    change_opacity(f["win"], f["opacity"])

            sleep(FRAME_T)
        self.fader_running = False

    def on_workspace_focus(self, _, e):
        if not e.change == "focus":
            return

        for node in get_windows(e.old.nodes):
            self.add_fade(node, CON_AC, CON_INAC, FADE_TIME)

        for node in get_windows(e.current.nodes):
            self.add_fade(node, CON_INAC, CON_AC, FADE_TIME)

        self.start_fader()


def get_windows(nodes) -> List:
    if len(nodes) == 0:
        return []

    ret = []
    for node in nodes:
        if hasattr(node, "app_id"):
            ret.append(node)
        ret.extend(get_windows(node.nodes))

    return ret


def change_opacity(win, trans):
    win.command("opacity " + str(trans))


if __name__ == "__main__":
    Fader()
