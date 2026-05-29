{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.username = "dennisbejze";

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "*" = {
        IdentityAgent = "~/.1password/agent.sock";
      };
      "mac-mini" = {
        ForwardAgent = "yes";
      };
    };
  };

  # Install firefox.
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

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        show-battery-percentage = true;
      };

      "org/gnome/desktop/calendar".show-weekdate = true;

      "org/gnome/desktop/datetime".automatic-timezone = true;

      "org/gnome/system/location".enabled = true;

      "org/gnome/shell".favorite-apps = [
        "1password.desktop"
        "com.mitchellh.ghostty.desktop"
        "nvim.desktop"
        "spotify.desktop"
        "obsidian.desktop"
        "org.gnome.Nautilus.desktop"
        "org.gnome.Settings.desktop"
        "fastmail.desktop"
        "firefox.desktop"
      ];

      "org/gnome/shell" = {
        enabled-extensions = [
          pkgs.gnomeExtensions.alphabetical-app-grid.extensionUuid
          pkgs.gnomeExtensions.appindicator.extensionUuid
          pkgs.gnomeExtensions.blur-my-shell.extensionUuid
          pkgs.gnomeExtensions.night-theme-switcher.extensionUuid
          pkgs.gnomeExtensions.space-bar.extensionUuid
          pkgs.gnomeExtensions.tophat.extensionUuid
        ];
      };

      "org/gnome/desktop/interface" = {
        accent-color = "blue";
      };

      "org/gnome/nautilus/preferences" = {
        default-folder-viewer = "list-view";
      };

      "org/gnome/nautilus/list-view".default-zoom-level = "small";

      "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
        blur = false;
      };

      "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
        blur = false;
      };

      "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
        blur = false;
      };

      "org/gnome/shell/extensions/blur-my-shell/window-list" = {
        blur = false;
      };

      "org/gnome/shell/extensions/blur-my-shell/panel" = {
        blur = false;
      };

      "org/gnome/shell/extensions/blur-my-shell/overview" = {
        blur = true;
        pipeline = "pipeline_default";
      };

      "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
        blur = true;
        brightness = 0.6;
        sigma = 30;
        static-blur = true;
        style-dash-to-dock = 0;
      };

      "org/gnome/shell/extensions/space-bar/behavior" = {
        smart-workspace-names = false;
      };

      "org/gnome/shell/extensions/space-bar/shortcuts" = {
        enable-activate-workspace-shortcuts = false;
        enable-move-to-workspace-shortcuts = true;
        open-menu = [ ];
      };

      "org/gnome/shell/extensions/tophat" = {
        show-icons = true;
        show-cpu = true;
        show-mem = true;
        show-disk = false;
        network-usage-unit = "bits";
      };

      "org/gnome/shell/extensions/alphabetical-app-grid" = {
        folder-order-position = "end";
      };

      "org/gnome/desktop/wm/keybindings" = {
        toggle-fullscreen = [ "F11" ];
        switch-to-workspace-1 = [ "<Super>1" ];
        switch-to-workspace-2 = [ "<Super>2" ];
        switch-to-workspace-3 = [ "<Super>3" ];
        switch-to-workspace-4 = [ "<Super>4" ];
        switch-to-workspace-5 = [ "<Super>5" ];
        switch-input-source = [ ]; # corresponds to "@as []"
      };

      "org/gnome/shell/keybindings" = {
        switch-to-application-1 = [ "<Alt>1" ];
        switch-to-application-2 = [ "<Alt>2" ];
        switch-to-application-3 = [ "<Alt>3" ];
        switch-to-application-4 = [ "<Alt>4" ];
        switch-to-application-5 = [ "<Alt>5" ];
        switch-to-application-6 = [ "<Alt>6" ];
      };

      "org/gnome/mutter" = {
        dynamic-workspaces = false;
      };

      "org/gnome/desktop/wm/preferences" = {
        num-workspaces = 5;
      };

      "org/gnome/desktop/wm/keybindings" = {
        close = [ "<Super>w" ];
      };

      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/"
        ];
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        name = "1Password Quick Access";
        command = "1password --quick-access";
        binding = "<Shift><Control>space";
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        name = "Open Terminal";
        command = "ghostty";
        binding = "<Super>Return";
      };

      "org/gnome/shell/extensions/nightthemeswitcher/color-scheme" = {
        day = "prefer-light";
        night = "prefer-dark";
      };
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

  xdg.desktopEntries.nvim = {
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

  programs.ghostty = {
    enable = true;
    settings = {
      theme = "light:TokyoNight Day,dark:TokyoNight Moon";
    };
  };

  programs.git = {
    enable = true;
    extraConfig = {
      gpg = {
        format = "ssh";
      };
      "gpg \"ssh\"" = {
        program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      };
      commit = {
        gpgSign = true;
      };
      user = {
        signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM3aqi63NirsDm9k+epbHFyoshmBN9D+AxylQ2u7PmRF";
        name = "Dennis Bejze";
        email = "53354166+Bejdenn@users.noreply.github.com";
      };
      pull.rebase = true;
    };
  };

  systemd.user.services.tailscale-systray = {
    Unit = {
      Description = "TailScale System Tray";
      Documentation = "https://tailscale.com/kb/1597/linux-systray";
      Requires = [ "dbus.service" ];
      After = [ "dbus.service" ];
      PartOf = [ "default.target" ];
    };

    Service = {
      Type = "simple";
      ExecStart = "/etc/profiles/per-user/dennisbejze/bin/tailscale systray";
    };

    Install = {
      WantedBy = [ "default.target" ];
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
}
