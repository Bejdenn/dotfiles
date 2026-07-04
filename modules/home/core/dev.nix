_: {
  flake.homeModules.dev = {
    config,
    pkgs,
    lib,
    ...
  }: {
    programs.opam.enable = true;
  };
}
