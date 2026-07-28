_: {
  flake.homeModules.ghostty = {
    pkgs,
    lib,
    ...
  }: {
    programs.ghostty =
      {
        enable = true;
        enableZshIntegration = true;
        settings =
          {
            theme = "light:Catppuccin Latte,dark:Catppuccin Mocha";
            font-size = 13;
            window-padding-x = 8;
            window-padding-y = 8;
          }
          // lib.optionalAttrs pkgs.stdenv.isDarwin {
            macos-option-as-alt = "left";
          };
      }
      // lib.optionalAttrs pkgs.stdenv.isDarwin {package = null;};
  };
}
