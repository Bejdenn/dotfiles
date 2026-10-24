_: {
  flake.modules.common = {pkgs, ...}: {
    environment.systemPackages = with pkgs;
      [
        age
        bat
        btop
        eza
        fastfetch
        fd
        fzf
        gum
        imagemagick
        jq
        jqp
        just
        lazysql
        pandoc
        ripgrep
        sqlite
        starship
        tealdeer
        unzip
        wget
      ]
      ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux
      [
        gcc
      ]
      ++ [
        cargo
        go
        nodejs
        pnpm
        python3
        rustc
        texliveFull
        uv
      ];
  };
}
