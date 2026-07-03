{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.solitude = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.common

      self.nixosModules.desktop
      self.nixosModules.solitudeModule
    ];
  };

  flake.nixosModules.solitudeModule = {pkgs, ...}: {
    imports = [
      ./_hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      {
        home-manager.useGlobalPkgs = true;
      }
    ];

    networking.hostName = "solitude";

    home-manager.users.dennisbejze = self.homeModules.solitudeModule;
  };
}
