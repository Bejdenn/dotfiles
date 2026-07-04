_: {
  flake.homeModules.xdg = {
    pkgs,
    lib,
    ...
  }: {
    xdg = {
      enable = true;
      terminal-exec = {
        enable = pkgs.stdenv.isLinux;
        settings = {
          default = [
            "ghostty.desktop"
          ];
        };
      };
      desktopEntries = lib.optionalAttrs pkgs.stdenv.isLinux {
        nvim = {
          name = "Neovim";
          genericName = "Text Editor";
          comment = "Edit text files";
          exec = "nvim %F";
          terminal = true;
          type = "Application";
          icon = "nvim";
          categories = [
            "Utility"
            "TextEditor"
            "Development"
          ];
          startupNotify = false;
          mimeType = [
            "text/english"
            "text/plain"
            "text/x-makefile"
            "text/x-c++hdr"
            "text/x-c++src"
            "text/x-chdr"
            "text/x-csrc"
            "text/x-java"
            "text/x-moc"
            "text/x-pascal"
            "text/x-tcl"
            "text/x-tex"
            "application/x-shellscript"
            "text/x-c"
            "text/x-c++"
          ];
        };
      };
    };
  };
}
