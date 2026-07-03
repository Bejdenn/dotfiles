{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.markarth = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.common

      self.nixosModules.desktop
      self.nixosModules.markarthModule
    ];
  };

  flake.nixosModules.markarthModule = {pkgs, ...}: {
    imports = [
      ./_hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      {
        home-manager.useGlobalPkgs = true;
      }
    ];

    networking.hostName = "markarth";

    home-manager.users.dennisbejze = self.homeModules.markarthModule;
  };
}
