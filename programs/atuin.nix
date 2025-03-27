# Saves your shell history, optionally to a shared server: https://atuin.sh/
{ config, pkgs, ... }:

{
  programs.atuin = {
    enable = true;
    settings = {
      sync_frequency = "15m";
      dialect = "uk";
      key_path = "${config.sops.secrets.atuin-key.path}";
      #sync_address = "https://api.atuin.sh";
    };
  };
}
