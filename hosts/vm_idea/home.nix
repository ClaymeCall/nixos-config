{ config, lib, pkgs, ... }:

{
  home.username = "clement";
  home.homeDirectory = "/home/clement";
  home.stateVersion = "24.11";

  # Shell configuration
  programs.zsh = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw";
    };
  };

  # Terminal configuration
  programs.kitty = {
    enable = true;

    shellIntegration.enableBashIntegration = true;
    shellIntegration.enableZshIntegration = true;

    themeFile = "Catppuccin-Mocha";

    settings = {
      # Cursor customization
      cursor_shape = "beam";
      cursor_trail = 1;
      cursor_trail_decay = "0.1 0.3";
      cursor_trail_start_threshold = 2;

      background_opacity = 0.9;

    };
  };

  # Git configuration
  programs.git = {
    enable = true;
    userName  = "Clement Callejon";
    userEmail = "clement.callejon@tutanota.com";
  };

  # i3 WM configuration
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = "Mod4";
      terminal = "kitty";

      # Keybinds
  keybindings = let
    modifier = config.xsession.windowManager.i3.config.modifier;
  in lib.mkOptionDefault {
    "${modifier}+Return" = "exec i3-sensible-terminal";
    "${modifier}+Shift+q" = "kill";
    "${modifier}+d" = "exec ${pkgs.dmenu}/bin/dmenu_run";
  };
      # Appearance
      window = {
        titlebar = false;
        hideEdgeBorders = "smart";
      };

      focus.mouseWarping = true;

      # Gaps
      gaps = {
        inner = 10;
        outer = 5;
      };
      fonts = {
        names = [ "JetBrains Mono" ];
        style = "Bold Semi-Condensed";
        size = 11.0;
      };
    };
  };
}
