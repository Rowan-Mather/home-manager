{ config, pkgs, ... }:

{
  programs.bash.enable = true;
  programs.bash.enableCompletion = true;
  programs.bash.historyControl = [ "ignoreboth" ];
  programs.bash.bashrcExtra =
    ''
    # For atuin (& ble.sh)
    source "${pkgs.blesh}/share/blesh/ble.sh"
    eval "$(atuin init bash)"

    # Ble.sh config
    export BLE_OPT_READLINE=none # idk if this is overkill but it does remove the warning
    ble-bind -f 'C-m' 'accept-line' # so I can just hit return in multiline mode
    '' + builtins.readFile ./bashrc-extra.bash;

}
