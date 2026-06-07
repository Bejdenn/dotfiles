{
  self,
  inputs,
  ...
}: {
  flake.homeModules.solitudeModule = {
    pkgs,
    lib,
    config,
    ...
  }: {
    imports = [
      {
        home.username = "dennisbejze";
        home.homeDirectory = "/home/dennisbejze";
      }

      self.homeModules.base
      self.homeModules.desktop
      self.homeModules.gnome
      self.homeModules.xdg
    ];

    systemd.user.services.tailscale-systray = {
      Unit = {
        Description = "TailScale System Tray";
        Documentation = "https://tailscale.com/kb/1597/linux-systray";
        Requires = ["dbus.service"];
        After = ["dbus.service"];
        PartOf = ["default.target"];
      };

      Service = {
        Type = "simple";
        ExecStart = "/etc/profiles/per-user/dennisbejze/bin/tailscale systray";
      };

      Install = {
        WantedBy = ["default.target"];
      };
    };

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "25.11";

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
  };
}
