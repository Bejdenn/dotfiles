{self, ...}: {
  flake.nixosModules.desktop = {
    pkgs,
    lib,
    ...
  }: {
    imports = with self.nixosModules; [
      docker
      gnome
      printing
    ];

    networking = {
      networkmanager.enable = true;
      firewall.allowedTCPPorts = [];
      firewall.allowedUDPPorts = [];
    };
    nix = {
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
    };

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
        ];
      };
      localsend.enable = true;
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

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

      systemPackages = with pkgs; [
        _1password-cli
        _1password-gui
        antigravity-cli
        discord
        ghostty
        libreoffice
        mission-center
        obsidian
        ollama
        spotify
        tailscale
        firefox
        git
        gnumake
        libnotify
        man
        wl-clipboard
        signal-desktop
        github-copilot-cli
      ];
    };

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
