{
  self,
  inputs,
  ...
}: {
  flake.homeModules.base.imports = with self.homeModules; [
    git
    neovim
    shell
    ssh
  ];
}
