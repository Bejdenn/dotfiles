keybindings = [
    [" + ENTER", "Open Terminal", "(Foot)"],
    [" + D", "Open Application Menu", "(Fuzzel)"],
    [" + P", "Open Activities", "(Fuzzel)"],
    [" + O", "", "Open Browser"],
    [" + N", "", "Open Files"],
    [" + Q", "Close focused app", "(kill)"],
    ["[Shift] + Print-key", "Take screenshot", "(grim)"],
    [" + Shift + E", "Open power menu", "(Fuzzel)"],
    [" + T", "Open keybinding helper", "full list"],
]

for key in keybindings:
    for i in range(3):
        print(f"{key[i]}")
