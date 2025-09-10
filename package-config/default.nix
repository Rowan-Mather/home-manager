{ config, pkgs, ... }:

{
  imports = [
    ./atuin.nix
    ./bash
    ./direnv.nix
    ./zellij
    ./vscode.nix
  ];
}
