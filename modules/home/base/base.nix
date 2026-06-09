{
  self,
  inputs,
  ...
}: {
  flake.homeModules.base.imports = with self.homeModules; [
    git
    shell
    ssh
  ];
}
