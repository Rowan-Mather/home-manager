{ inputs, pkgs, ... }: 

{
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/rowan/.config/home-manager/assets/keys.txt";
    secrets = {
      atuin-key = {};
    };
  };
}
