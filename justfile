hostname := `hostname`

default: switch

update:
    nix flake update

upgrade: update switch

check-dirty:
    @count=$(git rev-list --count @{u}..HEAD) && [ "$count" -gt 0 ] && gum -lwarn "There are $count unpushed commits—push them so all hosts stay up‑to‑date." || true

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
