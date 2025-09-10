{ config, pkgs, ... }:

{
  programs.zellij.enable = true;
  xdg.configFile."zellij/config.kdl".source = ./config.kdl;
  xdg.configFile."zellij/layouts/default.kdl".source = ./default.kdl;

  # zellij log file: cat /tmp/zellij-*/zellij-log/zellij.log
  # note that I have currently disabled the plugins in the config.kdl
  # this makes zellij a lot less pretty but they were causing problems

  # the yucky error https://github.com/zellij-org/zellij/issues/3877
  # example zellij config: https://github.com/DieracDelta/flakes/blob/6820e64acf5e4db863dcf8840e798b746ee7a150/home/home.nix#L38
  # something https://haseebmajid.dev/posts/2024-07-26-how-i-configured-zellij-status-bar/
  # > https://gitlab.com/hmajid2301/nixicle/-/blob/e7f96144fbb45a99173d21079f3bfbfd20eb7c91/modules/home/cli/multiplexers/zellij/default.nix
  # xdg.configFile."zellij/config.kdl".source = ./config.kdl;
  # xdg.configFile."zellij/layouts/default.kdl".text = ''
  #   layout {
  #       swap_tiled_layout name="vertical" {
  #           tab max_panes=5 {
  #               pane split_direction="vertical" {
  #                   pane
  #                   pane { children; }
  #               }
  #           }
  #           tab max_panes=8 {
  #               pane split_direction="vertical" {
  #                   pane { children; }
  #                   pane { pane; pane; pane; pane; }
  #               }
  #           }
  #           tab max_panes=12 {
  #               pane split_direction="vertical" {
  #                   pane { children; }
  #                   pane { pane; pane; pane; pane; }
  #                   pane { pane; pane; pane; pane; }
  #               }
  #           }
  #       }

  #       swap_tiled_layout name="horizontal" {
  #           tab max_panes=5 {
  #               pane
  #               pane
  #           }
  #           tab max_panes=8 {
  #               pane {
  #                   pane split_direction="vertical" { children; }
  #                   pane split_direction="vertical" { pane; pane; pane; pane; }
  #               }
  #           }
  #           tab max_panes=12 {
  #               pane {
  #                   pane split_direction="vertical" { children; }
  #                   pane split_direction="vertical" { pane; pane; pane; pane; }
  #                   pane split_direction="vertical" { pane; pane; pane; pane; }
  #               }
  #           }
  #       }

  #       swap_tiled_layout name="stacked" {
  #           tab min_panes=5 {
  #               pane split_direction="vertical" {
  #                   pane
  #                   pane stacked=true { children; }
  #               }
  #           }
  #       }

  #       swap_floating_layout name="staggered" {
  #           floating_panes
  #       }

  #       swap_floating_layout name="enlarged" {
  #           floating_panes max_panes=10 {
  #               pane { x "5%"; y 1; width "90%"; height "90%"; }
  #               pane { x "5%"; y 2; width "90%"; height "90%"; }
  #               pane { x "5%"; y 3; width "90%"; height "90%"; }
  #               pane { x "5%"; y 4; width "90%"; height "90%"; }
  #               pane { x "5%"; y 5; width "90%"; height "90%"; }
  #               pane { x "5%"; y 6; width "90%"; height "90%"; }
  #               pane { x "5%"; y 7; width "90%"; height "90%"; }
  #               pane { x "5%"; y 8; width "90%"; height "90%"; }
  #               pane { x "5%"; y 9; width "90%"; height "90%"; }
  #               pane focus=true { x 10; y 10; width "90%"; height "90%"; }
  #           }
  #       }

  #       swap_floating_layout name="spread" {
  #           floating_panes max_panes=1 {
  #               pane {y "50%"; x "50%"; }
  #           }
  #           floating_panes max_panes=2 {
  #               pane { x "1%"; y "25%"; width "45%"; }
  #               pane { x "50%"; y "25%"; width "45%"; }
  #           }
  #           floating_panes max_panes=3 {
  #               pane focus=true { y "55%"; width "45%"; height "45%"; }
  #               pane { x "1%"; y "1%"; width "45%"; }
  #               pane { x "50%"; y "1%"; width "45%"; }
  #           }
  #           floating_panes max_panes=4 {
  #               pane { x "1%"; y "55%"; width "45%"; height "45%"; }
  #               pane focus=true { x "50%"; y "55%"; width "45%"; height "45%"; }
  #               pane { x "1%"; y "1%"; width "45%"; height "45%"; }
  #               pane { x "50%"; y "1%"; width "45%"; height "45%"; }
  #           }
  #       }

        
  #       }
  #   }
  # '';

  # programs.zellij = {
  #   enable = false;
  #   # package = zellij-wrapped;
  #   # settings = {
  #   #   default_mode = "normal";
  #   #   default_shell = "fish";
  #   #   simplified_ui = true;
  #   #   pane_frames = false;
  #   #   theme = "catppuccin-mocha";
  #   #   copy_on_select = true;
  #   # };
  # };
}
