{
  self,
  inputs,
  ...
}: {
  flake.homeModules.desktop.imports = with self.homeModules; [
    ghostty
    xdg
  ];
}
