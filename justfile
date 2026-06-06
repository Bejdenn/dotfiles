hostname := `hostname`

default: switch

update:
    nix flake update

upgrade: update switch

[macos]
switch:
    sudo darwin-rebuild switch --flake ".#{{ hostname }}"

[linux]
switch:
    sudo nixos-rebuild switch --flake ".#{{ hostname }}"

gc:
    nix-collect-garbage -d
    nix-collect-garbage --delete-older-than 7d
    nix-store --gc
