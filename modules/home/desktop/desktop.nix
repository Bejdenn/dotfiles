{self, ...}: {
  flake.homeModules.desktop.imports = with self.homeModules; [
    firefox
    ghostty
    obsidian
    xdg
  ];
}
