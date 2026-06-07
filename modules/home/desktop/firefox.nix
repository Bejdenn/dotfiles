{
  self,
  inputs,
  ...
}: {
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

        profiles.default.search = {
          force = true;
          default = "ddg";
          privateDefault = "ddg";
        };
      }
      // lib.optionalAttrs (pkgs.stdenv.isDarwin) {package = null;};
  };
}
