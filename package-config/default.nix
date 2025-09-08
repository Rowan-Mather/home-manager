{ config, pkgs, ... }:

{
  imports = [
    ./atuin.nix
    ./bash.nix
    ./direnv.nix
    ./zellij.nix
    ./vscode.nix
  ];
}
