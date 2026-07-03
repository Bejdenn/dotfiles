{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.markarth = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.common

      self.nixosModules.docker
      self.nixosModules.printing
      self.nixosModules.markarthModule
    ];
  };

  flake.nixosModules.markarthModule = {pkgs, ...}: {
    imports = [
      # Include the results of the hardware scan.
      ./_hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      {
        home-manager.useGlobalPkgs = true;
      }
    ];

    networking = {
      hostName = "markarth";
      networkmanager.enable = true;
      firewall.allowedTCPPorts = [];
      firewall.allowedUDPPorts = [];
    };

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    # Set your time zone.
    time.timeZone = "Europe/Berlin";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };

    # Enable the X11 windowing system.
    services = {
      xserver = {
        enable = true;
        excludePackages = with pkgs; [
          xterm
        ];
        xkb = {
          layout = "us";
        };
      };

      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;

      pulseaudio.enable = false;
      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
      };

      tailscale.enable = true;
    };

    # Configure console keymap
    console.keyMap = "us";

    security.rtkit.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.dennisbejze = {
      isNormalUser = true;
      description = "Dennis Bejze";
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      shell = pkgs.zsh;
    };

    programs = {
      zsh.enable = true;
      _1password.enable = true;
      _1password-gui = {
        enable = true;
        polkitPolicyOwners = ["dennisbejze"];
      };
      nix-ld = {
        enable = true;
        libraries = with pkgs; [
          icu
          stdenv.cc.cc
        ];
      };
    };

    home-manager.users.dennisbejze = self.homeModules.markarthModule;

    environment = {
      # HACK: The eza plugin in zsh cannot reliably apply the aliases
      # if the default ones are not cleared
      shellAliases = {
        l = null;
        ll = null;
        ls = null;
      };
      localBinInPath = true;
      sessionVariables = {
        TERMINAL = "ghostty";
        MANPAGER = "nvim +Man!";
        UV_PYTHON_DOWNLOADS = "never";
        PATH = ["/home/dennisbejze/.cargo/bin"];
      };
    };

    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    qt = {
      enable = true;
      platformTheme = "gnome";
      style = "adwaita-dark";
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
      _1password-cli
      _1password-gui
      antigravity-cli
      discord
      fastmail-desktop
      ghostty
      libreoffice
      mission-center
      obsidian
      ollama
      spotify
      tailscale
      firefox
      git
      gnomeExtensions.alphabetical-app-grid
      gnomeExtensions.appindicator
      gnomeExtensions.blur-my-shell
      gnomeExtensions.night-theme-switcher
      gnomeExtensions.tophat
      gnumake
      libnotify
      man
      wl-clipboard
      localsend
      signal-desktop
      github-copilot-cli
    ];

    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.11"; # Did you read the comment?
  };
}
