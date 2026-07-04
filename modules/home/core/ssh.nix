_: {
  flake.homeModules.ssh = {
    pkgs,
    lib,
    ...
  }: {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings =
        {
          "mac-mini" = {
            ForwardAgent = "yes";
          };
        }
        // (
          if pkgs.stdenv.isDarwin
          then {
            "Match host * exec \"test -z $SSH_TTY\"" = {
              IdentityAgent = "\"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\"";
            };
          }
          else {
            "*" = {
              IdentityAgent = "~/.1password/agent.sock";
            };
          }
        );
    };
  };
}
