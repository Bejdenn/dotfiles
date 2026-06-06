{
  self,
  inputs,
  ...
}: {
  flake.homeModules.ssh = {
    pkgs,
    lib,
    ...
  }: {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings = {
        "*" = {
          IdentityAgent = "~/.1password/agent.sock";
        };
        "mac-mini" = {
          ForwardAgent = "yes";
        };
      };
    };
  };
}
