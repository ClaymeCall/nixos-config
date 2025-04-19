{ config, lib, pkgs, ... }:

{
  home.username = "clement";
  home.homeDirectory = "/home/clement";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    # Desktop stuff
    rofimoji
    spotube
    keepassxc
    miru
    localsend
    tutanota-desktop
    obsidian
    syncthing
    libreoffice-fresh

    # Maker software
    orca-slicer
    openscad-unstable
    freecad


    # Music production
    ardour
    guitarix
  ];

  # Git configuration
  programs.git = {
    enable = true;
    userName  = "Clement Callejon";
    userEmail = "clement.callejon@tutanota.com";
  };

  ###################
  # CLI Environment #
  ###################

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

    font = {
      package = pkgs.jetbrains-mono;
      name = "JetBrains Mono";
      size = 13;
    };

    settings = {
      # Cursor customization
      cursor_shape = "beam";
      cursor_trail = 1;
      cursor_trail_decay = "0.1 0.3";
      cursor_trail_start_threshold = 2;

      background_opacity = 0.8;
    };

    extraConfig = ''
      enable_audio_bell = no
    '';
  };

  ###############
  # Text Editor #
  ###############
  programs.neovim = {
    enable = true;

  };

  #######################
  # Desktop Environment #
  #######################
  
  # Picom configuration
  services.picom = {
    enable = true;
    vSync = true;

    fade = true;
    fadeSteps = [ 0.03 0.03 ];
    fadeDelta = 2;
    
    inactiveOpacity = 0.7;
  };

  # Rofi launcher configuration
  programs.rofi = {
    enable = true;

    # Appearance
    location = "center";
    font = "JetBrains Mono";
  };

  # i3 WM configuration
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = "Mod4";
      terminal = "kitty";
      menu = "rofi -show drun";

      # Keybinds
      keybindings = let
	  modifier = config.xsession.windowManager.i3.config.modifier;
	  terminal = config.xsession.windowManager.i3.config.terminal;
	  menu = config.xsession.windowManager.i3.config.menu;
      in lib.mkOptionDefault {
        # Control keybinds
	"${modifier}+Return" = "exec ${terminal}";
	"${modifier}+a" = "kill";
	"${modifier}+d" = "exec ${menu}";
	"${modifier}+semicolon" = "exec rofimoji";
	"${modifier}+Shift+x" = "exec systemctl suspend";


	# Focus keybinds
	"${modifier}+h" = "focus left";
	"${modifier}+j" = "focus down";
	"${modifier}+k" = "focus up";
	"${modifier}+l" = "focus right";

	# Window swap keybinds
	"${modifier}+Shift+h" = "move left";
	"${modifier}+Shift+j" = "move down";
	"${modifier}+Shift+k" = "move up";
	"${modifier}+Shift+l" = "move right";

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
