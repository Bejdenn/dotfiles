_: {
  flake.nixosModules.gnome = {
    pkgs,
    lib,
    ...
  }: {
    services = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    qt = {
      enable = true;
      platformTheme = "gnome";
      style = "adwaita-dark";
    };

    environment.systemPackages = with pkgs.gnomeExtensions; [
      alphabetical-app-grid
      appindicator
      blur-my-shell
      night-theme-switcher
      tophat
    ];
  };
}
