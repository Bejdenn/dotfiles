{self, ...}: {
  flake.homeModules.base.imports = with self.homeModules; [
    dev
    git
    neovim
    shell
    ssh
  ];
}
