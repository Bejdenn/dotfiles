{
  self,
  inputs,
  ...
}: {
  flake.modules.common = {pkgs, ...}: {
    environment.systemPackages = with pkgs;
      [
        age
        bat
        btop
        crush
        eza
        fastfetch
        fd
        fzf
        gcc
        imagemagick
        jq
        jqp
        just
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
        opam
        rustc
        texliveFull
        uv
      ];
  };
}
