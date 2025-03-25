{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "rowan";
  home.homeDirectory = "/home/rowan";
  
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  #nix = {
  #  package = pkgs.nix;    # Specify the Nix package
  #  settings = {
  #    sandbox = "relaxed";
  #  };
  #};

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    hello
    direnv
    python312Packages.grip
    python312Packages.ptpython
    aspell
    aspellDicts.en
    aspellDicts.en-computers
    mkpasswd
    python312Packages.huggingface-hub
    csvkit
    podman
    video-trimmer
    qemu
#    tightvnc
    ripgrep
    kittysay
    zellij
    xclip
    #Vim
    #neovim
    vimPlugins.vim-plug
    #Bash
    shellcheck
    pup
    bash-completion
    nix-bash-completions
    blesh
    #Nix
    nixfmt-rfc-style
    nixd
    nix-bundle
    #Rust
    #cargo
    #rustc
    #clippy
    crate2nix
    #Haskell
    stack
    cabal-install
    haskellPackages.hspec
    # Postgres (for hydra dev)
    postgresql_16_jit
    # Perl
    perl


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

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

    ".config/nix/nix.conf".text = ''
      experimental-features = nix-command flakes recursive-nix
      trusted-users = rowan
      allow-new-privileges = true
    '';

  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  # or
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  # or
  #  /etc/profiles/per-user/rowan/etc/profile.d/hm-session-vars.sh
  home.sessionVariables = {
    # EDITOR = "emacs";
    EDITOR = "vim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.bash.enableCompletion = true;
}
