{ config, pkgs, inputs, ... }:

{
  # https://home-manager.dev/manual/25.11/options.xhtml

  home.packages = with pkgs; [
    # Misc.
    aspell # Spell-checker
    aspellDicts.en
    aspellDicts.en-computers
    hello
    mkpasswd # Copy & paste
    qemu
    ripgrep
    sops
    lazygit
    nodejs
    element-desktop
    
    # Bash & Terminal
    bash-completion
    shellcheck # Linter
    nix-bash-completions
    blesh # Bash Line Editor, improves atuin
    xclip

    # Haskell
    haskellPackages.cabal-install
    haskellPackages.hspec
    haskell.compiler.ghc98
    haskellPackages.cabal2nix
    haskellPackages.lzma
    haskellPackages.lzma-static

    # Nix
    nixd # Language server
    inputs.nixfmt.packages.${pkgs.system}.default # nixfmt 1.0.0

    # Postgres (for hydra dev)
    postgresql_16_jit
    
    # Python
    python312Packages.grip
    python312Packages.ptpython

    #Rust
    cargo
    crate2nix

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  programs = {
    atuin = {
      # Saves your shell history, optionally to a shared server: https://atuin.sh/
      enable = true;
      settings = {
        sync_frequency = "15m";
        dialect = "uk";
        key_path = "${config.sops.secrets.atuin-key.path}";
        #sync_address = "https://api.atuin.sh";
      };
    };

    bash = {
      enable = true;
      enableCompletion = true;
      historyControl = [ "ignoreboth" ];
      bashrcExtra = ''
        # For atuin (& ble.sh) — only in truly interactive shells,
        # so this doesn't fire during non-interactive SSH/nix-copy sessions.
        if [[ $- == *i* ]]; then
          source "${pkgs.blesh}/share/blesh/ble.sh" --noattach
          if command -v atuin >/dev/null 2>&1; then
            eval "$(atuin init bash)"
          fi
          export BLE_OPT_READLINE=none
          if [[ ''${BLE_VERSION-} ]]; then
            ble-bind -f 'C-m' 'accept-line'
            ble-attach
          fi
        fi
      '' + builtins.readFile ./bashrc-extra.bash;
    };

    direnv = {
      enable = true;
      enableBashIntegration = true;
      # silent = true;
    };

    # llm generated config to mimic zellij key bindings and mouse usage
    # note: hold shift to get normal select for copying
    tmux = {
      enable = true;
      newSession = true;
      extraConfig = ''
        # This removes the standard tmux detach behaviour and kills all sessions
        # on exit/detach. Obviously this is not generally sensible, but better
        # for me :)
        set -g destroy-unattached on
        ${builtins.readFile ./tmux-config}
      '';
    };

    # vscode
    # Configured manually for now but I like these keybindings because they
    # allow you to use fake-zellij-tmux in the vscode terminal. Migrate to
    # declarative style in future :)
    /*
    {
        "key": "ctrl+`",
        "command": "workbench.action.terminal.focus"
    },
    {
        "key": "ctrl+`",
        "command": "workbench.action.focusActiveEditorGroup",
        "when": "terminalFocus"
    },
    { "key": "ctrl+p", "command": "workbench.action.terminal.sendSequence", "args": { "text": "\u0010" }, "when": "terminalFocus" },
    { "key": "ctrl+t", "command": "workbench.action.terminal.sendSequence", "args": { "text": "\u0014" }, "when": "terminalFocus" },
    { "key": "ctrl+n", "command": "workbench.action.terminal.sendSequence", "args": { "text": "\u000e" }, "when": "terminalFocus" },
    { "key": "ctrl+h", "command": "workbench.action.terminal.sendSequence", "args": { "text": "\u0008" }, "when": "terminalFocus" },
    { "key": "ctrl+o", "command": "workbench.action.terminal.sendSequence", "args": { "text": "\u000f" }, "when": "terminalFocus" },
    { "key": "ctrl+s", "command": "workbench.action.terminal.sendSequence", "args": { "text": "\u0013" }, "when": "terminalFocus" },
    { "key": "ctrl+q", "command": "workbench.action.terminal.sendSequence", "args": { "text": "\u0011" }, "when": "terminalFocus" }
    */

    zellij = {
      enable = true;
      enableBashIntegration = false;
      # package = ...;
      extraConfig = builtins.readFile ./zellij_config.kdl;
    };

  };
  
}
