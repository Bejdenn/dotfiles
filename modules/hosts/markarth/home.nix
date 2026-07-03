{self, ...}: {
  flake.homeModules.markarthModule.imports = [
    self.homeModules.solitudeModule
  ];
}
