hostname := `hostname`

default: switch

update:
    nix flake update

upgrade: update switch

check-dirty:
    @(( $(git rev-list --count @{u}..HEAD) )) && gum log -lwarn "There are $(git rev-list --count @{u}..HEAD) unpushed commits, push them so all hosts stay up‑to‑date."

[macos]
switch: check-dirty
    sudo darwin-rebuild switch --flake ".#{{ hostname }}"

[linux]
switch: check-dirty
    sudo nixos-rebuild switch --flake ".#{{ hostname }}"

gc:
    nix-collect-garbage -d
    nix-collect-garbage --delete-older-than 7d
    nix-store --gc
