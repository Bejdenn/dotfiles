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
        gcc
        imagemagick
        jq
        jqp
        just
        lazydocker
        lazygit
        lazysql
        neovim
        pandoc
        ripgrep
        sqlite
        starship
        tealdeer
        unzip
        wget
      ]
      ++ [
        cargo
        go
        nodejs
        pnpm
        rustc
        texliveFull
        uv
      ];
  };
}
