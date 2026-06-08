{
  self,
  inputs,
  ...
}: {
  flake.homeModules.neovim = {
    config,
    pkgs,
    lib,
    ...
  }: {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
    };

    home.file."${config.xdg.configHome}/nvim" = {
      recursive = true;
      source = ./nvim;
    };

    home.file."${config.xdg.configHome}/nvim/lazy/lazy-lock.json" = {
      enable = false;
    };
  };
}
