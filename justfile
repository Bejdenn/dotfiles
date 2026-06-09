hostname := `hostname`

default: switch

clone repo target:
    if [ ! -d {{ target }} ]; then git clone https://github.com/{{ repo }}.git {{ target }}; fi

init: (clone "Bejdenn/nvim" "~/.config/nvim") switch

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
