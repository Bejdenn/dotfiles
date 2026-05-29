{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }
  ];

  networking.hostName = "solitude"; # Define your hostname.

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Enable networking
  networking.networkmanager.enable = true;

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
  services.xserver.enable = true;

  services.xserver.excludePackages = with pkgs; [
    xterm
  ];

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
  };

  # Configure console keymap
  console.keyMap = "us";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  environment.shellAliases = {
    ll = null;
  };

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "eza"
        "git"
      ];
      theme = "robbyrussell";
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dennisbejze = {
    isNormalUser = true;
    description = "Dennis Bejze";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      _1password-cli
      _1password-gui
      discord
      fastfetch
      fastmail-desktop
      ghostty
      jq
      jqp
      obsidian
      ollama
      spotify
      tailscale
      texliveMedium
    ];
    shell = pkgs.zsh;
  };

  environment.sessionVariables = rec {
    TERMINAL = "ghostty";
    MANPAGER = "nvim +Man!";
    UV_PYTHON_DOWNLOADS = "never";
    PATH = [ "/home/dennisbejze/.cargo/bin" ];
  };

  environment.localBinInPath = true;

  programs._1password.enable = true;

  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "dennisbejze" ];
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  services.tailscale.enable = true;

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    bat
    btop
    cargo
    eza
    fd
    firefox
    fzf
    gcc
    git
    gnomeExtensions.alphabetical-app-grid
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.night-theme-switcher
    gnomeExtensions.space-bar
    gnomeExtensions.tophat
    gnumake
    go
    lazygit
    libnotify
    man
    neovim
    nodejs
    ocaml
    ripgrep
    rustc
    tealdeer
    unzip
    uv
    wl-clipboard
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  system.autoUpgrade = {
    enable = true;
    flake = "/etc/nixos";
    flags = [
      "--print-build-logs"
      "--commit-lock-file"
    ];
    dates = "09:00";
    randomizedDelaySec = "45min";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
