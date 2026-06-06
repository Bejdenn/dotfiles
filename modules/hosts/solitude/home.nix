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
    ];

    programs.firefox = {
      enable = true;

      configPath = "${config.xdg.configHome}/mozilla/firefox";

      policies = {
        OfferToSaveLogins = false;
      };

      profiles.default.search = {
        force = true;
        default = "ddg";
        privateDefault = "ddg";
      };
    };

    xdg.terminal-exec = {
      enable = true;
      settings = {
        default = [
          "ghostty.desktop"
        ];
      };
    };

    xdg.desktopEntries = {
      nvim = {
        name = "Neovim";
        genericName = "Text Editor";
        comment = "Edit text files";
        exec = "nvim %F";
        terminal = true;
        type = "Application";
        icon = "nvim";
        categories = [
          "Utility"
          "TextEditor"
          "Development"
        ];
        startupNotify = false;
        mimeType = [
          "text/english"
          "text/plain"
          "text/x-makefile"
          "text/x-c++hdr"
          "text/x-c++src"
          "text/x-chdr"
          "text/x-csrc"
          "text/x-java"
          "text/x-moc"
          "text/x-pascal"
          "text/x-tcl"
          "text/x-tex"
          "application/x-shellscript"
          "text/x-c"
          "text/x-c++"
        ];
      };
    };

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
