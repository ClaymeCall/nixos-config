{ config, pkgs, ... }:

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
}
