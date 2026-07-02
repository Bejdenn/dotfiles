{
  self,
  inputs,
  ...
}: {
  flake.homeModules.obsidian = {
    pkgs,
    lib,
    ...
  }: let
    # # Define your custom plugin derivation
    # obsidian-dataview = pkgs.stdenv.mkDerivation {
    #   name = "obsidian-dataview";
    #   src = pkgs.fetchzip {
    #     url = "https://github.com/liamcain/obsidian-calendar-plugin/releases/download/1.5.4/calendar-1.5.4.zip";
    #     url = "https://github.com/blacksmithgu/obsidian-dataview/releases/download/0.5.70/"
    #     sha256 = "sha256-ABC123..."; # Replace with actual hash
    #   };
    #   installPhase = ''
    #     mkdir -p $out
    #     cp -r $src/* $out/
    #   '';
    # };
  in {
    programs.obsidian = {
      enable = true;
      cli.enable = true;
      defaultSettings = {
        app = {
          showInlineTitle = true;
          vimMode = true;
        };

        appearance = {
          baseFontSize = 16;
          cssTheme = "Minimal";
          showViewHeader = true;
          theme = "system";
          translucency = "true";
        };

        # communityPlugins = [
        #   {pkg = "dataview";}
        #   {pkg = "obsidian-hider";}
        #   {pkg = "obsidian-minimal-settings";}
        #   {
        #     pkg = "remotely-save";
        #     settings = {
        #       webdav = {
        #         address = "https://nas.rohu-themis.ts.net:5006/obsidian/dennisbejze/";
        #         username = "";
        #         password = "";
        #         authType = "basic";
        #         manualRecursive = false;
        #         depth = "manual_infinity";
        #         remoteBaseDir = "";
        #         customHeaders = "";
        #       };
        #       password = "";
        #       serviceType = "webdav";
        #       currLogLevel = "info";
        #       autoRunEveryMilliseconds = 60000;
        #       initRunAfterMilliseconds = 10000;
        #       syncOnSaveAfterMilliseconds = -1;
        #       agreeToUploadExtraMetadata = true;
        #       concurrency = 20;
        #       syncConfigDir = false;
        #       syncBookmarks = false;
        #       syncUnderscoreItems = false;
        #       lang = "auto";
        #       logToDB = false;
        #       skipSizeLargerThan = -1;
        #       ignorePaths = [];
        #       onlyAllowPaths = [];
        #       enableStatusBarInfo = true;
        #       deleteToWhere = "system";
        #       agreeToUseSyncV3 = true;
        #       conflictAction = "keep_newer";
        #       howToCleanEmptyFolder = "clean_both";
        #       protectModifyPercentage = 50;
        #       syncDirection = "bidirectional";
        #       obfuscateSettingFile = true;
        #       encryptionMethod = "rclone-base64";
        #     };
        #   }
        # ];

        corePlugins = [
          "backlink"
          "bases"
          "bookmarks"
          "canvas"
          "command-palette"
          {
            name = "daily-notes";
            settings = {
              folder = "Daily";
              template = "Templates/Daily Note Template";
            };
          }
          "editor-status"
          "file-explorer"
          "file-recovery"
          "global-search"
          "graph"
          "note-composer"
          "outgoing-link"
          "outline"
          "page-preview"
          "random-note"
          "switcher"
          "tag-pane"
          {
            name = "templates";
            settings = {
              folder = "Templates";
            };
          }
          "word-count"
          {
            name = "zk-prefixer";
            settings = {
              template = "Templates/Journal Template";
              format = "YYYY-MM-DD HHmm";
            };
          }
        ];
      };
      vaults."Obsidian".enable = true;
    };
  };
}
