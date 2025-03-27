{ config, pkgs, ... }:

{
  programs.bash.enable = true;
  programs.bash.enableCompletion = true;
  programs.bash.historyControl = [ "ignoreboth" ];
  programs.bash.bashrcExtra =
    ''
    # My little recursive name search
    finder() {
      find . -iname "*$1*" -print
    }

    # For atuin (& ble.sh)
    source "${pkgs.blesh}/share/blesh/ble.sh"
    eval "$(atuin init bash)"

    # Ble.sh config
    export BLE_OPT_READLINE=none # idk if this is overkill but it does remove the warning
    ble-bind -f 'C-m' 'accept-line' # so I can just hit return in multiline mode
    '';

  # direnv
  programs.direnv.enable = true;
  programs.direnv.enableBashIntegration = true;
  #programs.direnv.silent = true;
}
