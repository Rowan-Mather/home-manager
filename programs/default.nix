{ config, pkgs, ... }:

{
  imports = [
    ./atuin.nix
    ./bash.nix
  ];
}
