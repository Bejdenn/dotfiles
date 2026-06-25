_: {
  flake.homeModules.firefox = {
    config,
    pkgs,
    lib,
    ...
  }: {
    programs.firefox =
      {
        enable = true;

        configPath = "${config.xdg.configHome}/mozilla/firefox";

        policies = {
          OfferToSaveLogins = false;
        };

        profiles.default = {
          settings = {
            "browser.uiCustomization.horizontalTabstrip" = ["firefox-view-button" "tabbrowser-tabs" "new-tab-button" "alltabs-button"];
            "sidebar.main.tools" = "syncedtabs,history,bookmarks";
            "sidebar.verticalTabs" = true;
            "sidebar.visibility" = "expand-on-hover";
          };
          search = {
            force = true;
            default = "ddg";
            privateDefault = "ddg";
          };
        };
      }
      // lib.optionalAttrs pkgs.stdenv.isDarwin {package = null;};
  };
}
