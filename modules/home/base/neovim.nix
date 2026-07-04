_: {
  flake.homeModules.neovim = {
    config,
    pkgs,
    lib,
    ...
  }: {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      sideloadInitLua = true;
      withRuby = false;
      withPython3 = false;
    };

    programs.lazygit.enable = true;
  };
}
