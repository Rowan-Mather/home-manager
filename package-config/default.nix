{ config, pkgs, ... }:

{
  imports = [
    ./atuin.nix
    ./bash.nix
    ./zellij.nix
  ];
}
