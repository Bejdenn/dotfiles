{
  self,
  inputs,
  ...
}: {
  flake.homeModules.dennisbejzeModule = {
    pkgs,
    lib,
    config,
    ...
  }: {
    home.username = "dennisbejze";
    home.homeDirectory = "/home/dennisbejze";

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

    programs.ghostty = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        theme = "light:Catppuccin Latte,dark:Catppuccin Mocha";
        font-size = 13;
      };
    };

    programs.git = {
      enable = true;
      settings = {
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

    programs.lazygit = {
      enable = true;
      settings = {
        git = {
          overrideGpg = true;
        };
      };
    };

    programs.zsh = {
      enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "eza"
          "git"
        ];
      };
    };

    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      settings = {
        "$schema" = "https://starship.rs/config-schema.json";
        aws = {
          format = "\\[[$symbol($profile)(\\($region\\))(\\[$duration\\])]($style)\\]";
        };
        azure = {
          format = "\\[[$symbol($subscription)]($style)\\]";
        };
        battery = {
          format = "\\[[$symbol$percentage]($style)\\]";
        };
        buf = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        bun = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        c = {
          format = "\\[[$symbol($version(-$name))]($style)\\]";
        };
        cmake = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        cmd_duration = {
          format = "\\[[⏱ $duration]($style)\\]";
        };
        cobol = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        conda = {
          format = "\\[[$symbol$environment]($style)\\]";
        };
        container = {
          format = "\\[[$symbol \\[$name\\]]($style)\\]";
        };
        cpp = {
          format = "\\[[$symbol($version(-$name))]($style)\\]";
        };
        crystal = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        daml = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        dart = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        deno = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        direnv = {
          format = "\\[[$symbol$loaded/$allowed]($style)\\]";
        };
        docker_context = {
          format = "\\[[$symbol$context]($style)\\]";
        };
        dotnet = {
          format = "\\[[$symbol($version)(🎯 $tfm)]($style)\\]";
        };
        elixir = {
          format = "\\[[$symbol($version \\(OTP $otp_version\\))]($style)\\]";
        };
        elm = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        erlang = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        fennel = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        fortran = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        fossil_branch = {
          format = "\\[[$symbol$branch]($style)\\]";
        };
        fossil_metrics = {
          format = "\\[[+$added]($added_style)\\]\\[[-$deleted]($deleted_style)\\]";
        };
        gcloud = {
          format = "\\[[$symbol$account(@$domain)(\\($region\\))]($style)\\]";
        };
        git_branch = {
          format = "\\[[$symbol$branch]($style)\\]";
        };
        git_commit = {
          format = "\\[[\\($hash$tag\\)]($style)\\]";
        };
        git_metrics = {
          format = "\\[[+$added]($added_style)\\]\\[[-$deleted]($deleted_style)\\]";
        };
        git_state = {
          format = "\\[[$state ($progress_current/$progress_total)]($style)\\]";
        };
        git_status = {
          format = "([\\[$all_status$ahead_behind\\]]($style))";
        };
        gleam = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        golang = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        gradle = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        guix_shell = {
          format = "\\[[$symbol]($style)\\]";
        };
        haskell = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        haxe = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        helm = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        hg_branch = {
          format = "\\[[$symbol$branch]($style)\\]";
        };
        hostname = {
          format = "\\[[$ssh_symbol($hostname)]($style)\\] ";
        };
        java = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        jobs = {
          format = "\\[[$symbol$number]($style)\\]";
        };
        julia = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        kotlin = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        kubernetes = {
          format = "\\[[$symbol$context( \\($namespace\\))]($style)\\]";
        };
        localip = {
          format = "\\[[$localipv4]($style)\\]";
        };
        lua = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        maven = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        memory_usage = {
          format = "\\[$symbol[$ram( | $swap)]($style)\\]";
        };
        meson = {
          format = "\\[[$symbol$project]($style)\\]";
        };
        mise = {
          format = "\\[[$symbol$health]($style)\\]";
        };
        mojo = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        nats = {
          format = "\\[[$symbol$name]($style)\\]";
        };
        netns = {
          format = "\\[[$symbol \\[$name\\]]($style)\\]";
        };
        nim = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        nix_shell = {
          format = "\\[[$symbol$state( \\($name\\))]($style)\\]";
        };
        nodejs = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        ocaml = {
          format = "\\[[$symbol($version)(\\($switch_indicator$switch_name\\))]($style)\\]";
        };
        odin = {
          format = "\\[[$symbol($version )]($style)\\]";
        };
        opa = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        openstack = {
          format = "\\[[$symbol$cloud(\\($project\\))]($style)\\]";
        };
        os = {
          format = "\\[[$symbol]($style)\\]";
        };
        package = {
          format = "\\[[$symbol$version]($style)\\]";
        };
        perl = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        php = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        pijul_channel = {
          format = "\\[[$symbol$channel]($style)\\]";
        };
        pixi = {
          format = "\\[[$symbol$version( $environment)]($style)\\]";
        };
        pulumi = {
          format = "\\[[$symbol$stack]($style)\\]";
        };
        purescript = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        python = {
          format = "\\[[\${symbol}\${pyenv_prefix}(\${version})(\\($virtualenv\\))]($style)\\]";
        };
        quarto = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        raku = {
          format = "\\[[$symbol($version-$vm_version)]($style)\\]";
        };
        red = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        rlang = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        ruby = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        rust = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        scala = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        shell = {
          format = "\\[[$indicator]($style)\\]";
        };
        singularity = {
          format = "\\[[$symbol\\[$env\\]]($style)\\]";
        };
        solidity = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        spack = {
          format = "\\[[$symbol$environment]($style)\\]";
        };
        status = {
          format = "\\[[$symbol$status]($style)\\]";
        };
        sudo = {
          format = "\\[[as $symbol]($style)\\]";
        };
        swift = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        terraform = {
          format = "\\[[$symbol$workspace]($style)\\]";
        };
        time = {
          format = "\\[[$time]($style)\\]";
        };
        typst = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        username = {
          format = "\\[[$user]($style)\\]";
        };
        vagrant = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        vcsh = {
          format = "\\[vcsh [$symbol$repo]($style)\\]";
        };
        vlang = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        xmake = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
        zig = {
          format = "\\[[$symbol($version)]($style)\\]";
        };
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
