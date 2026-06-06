{
  self,
  inputs,
  ...
}: {
  flake.homeModules.desktop = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      self.homeModules.ghostty
    ];
  };
}
