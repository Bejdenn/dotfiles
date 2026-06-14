{
  self,
  inputs,
  ...
}: {
  flake.homeModules.obsidian = {
    pkgs,
    lib,
    ...
  }: {
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

        communityPlugins = {
          "dataview" = {};
          "obsidian-hider" = {};
          "obsidian-minimal-settings" = {};
          "remotely-save" = {};
        };

        corePlugins = [
          "backlink"
          "bases"
          "bookmarks"
          "canvas"
          "command-palette"
          {
            "daily-notes" = {
              settings = {
                folder = "Daily";
                template = "Templates/Daily Note Template";
              };
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
            "templates" = {
              settings = {
                folder = "Templates";
              };
            };
          }
          "word-count"
          {
            "zk-prefixer" = {
              settings = {
                template = "Templates/Journal Template";
                format = "YYYY-MM-DD HHmm";
              };
            };
          }
        ];
      };
      vaults."Obsidian" = {
      };
    };
  };
}
