{
  self,
  inputs,
  ...
}: {
  flake.homeModules.gnome = {
    pkgs,
    lib,
    ...
  }: {
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
          toggle-fullscreen = ["F11"];
          switch-to-workspace-1 = ["<Super>1"];
          switch-to-workspace-2 = ["<Super>2"];
          switch-to-workspace-3 = ["<Super>3"];
          switch-to-workspace-4 = ["<Super>4"];
          switch-to-workspace-5 = ["<Super>5"];
          switch-input-source = []; # corresponds to "@as []"
        };

        "org/gnome/shell/keybindings" = {
          switch-to-application-1 = ["<Alt>1"];
          switch-to-application-2 = ["<Alt>2"];
          switch-to-application-3 = ["<Alt>3"];
          switch-to-application-4 = ["<Alt>4"];
          switch-to-application-5 = ["<Alt>5"];
          switch-to-application-6 = ["<Alt>6"];
        };

        "org/gnome/mutter" = {
          dynamic-workspaces = false;
        };

        "org/gnome/desktop/wm/preferences" = {
          num-workspaces = 5;
        };

        "org/gnome/desktop/wm/keybindings" = {
          close = ["<Super>w"];
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

        "org/gnome/settings-daemon/plugins/color" = {
          night-light-enabled = true;
          night-light-enabled-automatic = true;
          night-light-temperature = "uint32 2700";
        };

        "org/gnome/shell/extensions/nightthemeswitcher/color-scheme" = {
          day = "prefer-light";
          night = "prefer-dark";
        };
      };
    };
  };
}
