#!/usr/bin/env sh

sudo nixos-generate-config
sudo cp /etc/nixos/hardware-configuration.nix .
sudo nixos-rebuild switch --flake .#nixdots
