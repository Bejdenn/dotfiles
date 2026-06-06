{
  self,
  inputs,
  ...
}: {
  flake.homeModules.ghostty = {
    pkgs,
    lib,
    ...
  }: {
    programs.ghostty = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        theme = "light:Catppuccin Latte,dark:Catppuccin Mocha";
        font-size = 13;
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
  };
}
