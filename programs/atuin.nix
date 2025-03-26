# Saves your shell history, optionally to a shared server: https://atuin.sh/
{ config, pkgs, ... }:

{
  programs.atuin = {
    enable = true;
    settings = {
      sync_frequency = "15m";
      dialect = "uk";
      key_path = "${../assets/atuin-key}";
      #sync_address = "https://api.atuin.sh";
    };
  };
}
