hostname := `hostname`

update:
    nix flake update

upgrade: update switch

[macos]
[default]
switch:
    sudo darwin-rebuild switch --flake ".#{{ hostname }}"

[linux]
[default]
switch:
    sudo nixos-rebuild switch --flake ".#{{ hostname }}"

gc:
    nix-collect-garbage -d
    nix-collect-garbage --delete-older-than 7d
    nix-store --gc
