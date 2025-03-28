{ config, pkgs, ... }:

{
  programs.zellij.enable = true;
  programs.zellij.enableBashIntegration = true;
  programs.zellij.attachExistingSession = true;
  programs.zellij.exitShellOnExit = true;
  programs.zellij.settings = builtins.readFile ./zellij-extra;
}