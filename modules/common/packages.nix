{
  self,
  inputs,
  ...
}: {
  flake.modules.common = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      age
      bat
      btop
      cargo
      eza
      fastfetch
      fd
      fzf
      gcc
      go
      imagemagick
      jq
      jqp
      just
      lazygit
      neovim
      nodejs
      opam
      pandoc
      ripgrep
      rustc
      starship
      tealdeer
      texliveMedium
      unzip
      uv
      wget
    ];
  };
}
