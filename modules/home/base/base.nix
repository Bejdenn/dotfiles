{
  self,
  inputs,
  ...
}: {
  flake.homeModules.base = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      self.homeModules.git
      self.homeModules.shell
      self.homeModules.ssh
    ];
  };
}
