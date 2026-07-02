_: {
  flake.nixosModules.printing = {
    pkgs,
    lib,
    ...
  }: {
    services = {
      printing = {
        enable = true;
        drivers = with pkgs; [
          brgenml1cupswrapper
          brgenml1lpr
          brlaser
          cnijfilter2
          gutenprint
        ];
      };
      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
    };
  };
}
