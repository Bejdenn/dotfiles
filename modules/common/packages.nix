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
        neovim
        pandoc
        ripgrep
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
        texliveMedium
        uv
      ];
  };
}
