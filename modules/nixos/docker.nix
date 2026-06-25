_: {
  flake.nixosModules.docker = {
    pkgs,
    lib,
    ...
  }: {
    virtualisation.docker = {
      enable = false;

      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };

    boot.kernel.sysctl = {
      "net.ipv4.ip_forward" = 1;
    };
  };
}
