{
  self,
  inputs,
  ...
}: {
  flake.darwinConfigurations.windhelm = inputs.nix-darwin.lib.darwinSystem {
    modules = [
      self.modules.common
      self.darwinModules.windhelmModule
    ];
  };

  flake.darwinModules.windhelmModule = {pkgs, ...}: {
    imports = [
      inputs.home-manager.darwinModules.default
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
      }
    ];

    users.users.dennisbejze.home = "/Users/dennisbejze";

    system = {
      primaryUser = "dennisbejze";

      defaults.dock = {
        orientation = "left";
        minimize-to-application = true;
        persistent-apps = [
          {app = "/System/Applications/Apps.app";}
          {app = "/Applications/Firefox.app";}
          {app = "/System/Applications/Messages.app";}
          {app = "/Applications/Fastmail.app";}
          {app = "/System/Applications/Calendar.app";}
          {app = "/System/Applications/Maps.app";}
          {app = "/System/Applications/Photos.app";}
          {app = "/System/Applications/Reminders.app";}
          {app = "/Applications/Spotify.app";}
          {app = "/Applications/Obsidian.app";}
          {app = "/Applications/Ghostty.app";}
          {app = "/System/Applications/App Store.app";}
          {app = "/System/Applications/System Settings.app";}
        ];
      };
    };

    environment.systemPackages = with pkgs; [
      cook-cli
      czkawka
      exiftool
      fdupes
      lazydocker
      mas
      unixtools.watch
    ];

    homebrew = {
      enable = true;
      onActivation = {
        cleanup = "zap";
        # FIXME: Remove when https://github.com/nix-darwin/nix-darwin/issues/1787 is fixed
        extraFlags = [
          "--force-cleanup"
        ];
      };
      casks = [
        "1password"
        "1password-cli"
        "anki"
        "appcleaner"
        "connectmenow"
        "discord"
        "fastmail"
        "firefox"
        "ghostty"
        "gimp"
        "handbrake-app"
        "hp-easy-start"
        "jellyfin"
        "localsend"
        "logi-options+"
        "makemkv"
        "musicbrainz-picard"
        "naps2"
        "obs"
        "obsidian"
        "ollama-app"
        "rectangle"
        "rustdesk"
        "sanesidebuttons"
        "signal"
        "skim"
        "spotify"
        "steam"
        "synology-drive"
        "tailscale-app"
        "upscayl"
        "xld"
        "zotero"
      ];
    };

    home-manager.users.dennisbejze = self.homeModules.windhelmModule;

    # Necessary for using flakes on this system.
    nix.settings.experimental-features = "nix-command flakes";

    # Set Git commit hash for darwin-version.
    system.configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 6;

    # The platform the configuration will be used on.
    nixpkgs.hostPlatform = "aarch64-darwin";
  };
}
