{
  self,
  inputs,
  ...
}: {
  flake.homeModules.git = {
    pkgs,
    lib,
    ...
  }: {
    programs.git = {
      enable = true;
      settings = {
        gpg = {
          format = "ssh";
        };
        "gpg \"ssh\"" = {
          program =
            if pkgs.stdenv.isLinux
            then "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}"
            else "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
        };
        commit = {
          gpgSign = true;
        };
        user = {
          signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM3aqi63NirsDm9k+epbHFyoshmBN9D+AxylQ2u7PmRF";
          name = "Dennis Bejze";
          email = "53354166+Bejdenn@users.noreply.github.com";
        };
        pull.rebase = true;
      };
    };

    programs.lazygit = {
      enable = true;
      settings = {
        git = {
          overrideGpg = true;
        };
      };
    };
  };
}
