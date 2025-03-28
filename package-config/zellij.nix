{ config, pkgs, ... }:

{
  programs.zellij.enable = true;
  programs.zellij.enableBashIntegration = true;
  # example zellij config: https://github.com/DieracDelta/flakes/blob/6820e64acf5e4db863dcf8840e798b746ee7a150/home/home.nix#L38
}