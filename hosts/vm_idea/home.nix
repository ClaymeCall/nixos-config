{
  self,
  config,
  lib,
  pkgs,
  ...
}: let
  nvf = self.outputs.packages."x86_64-linux".nvf;
in {
  home.username = "clement";
  home.homeDirectory = "/home/clement";
  home.stateVersion = "24.11";

  # Let Home-Manager install and manage itself
  programs.home-manager.enable = true;

  imports = [
    ../../homeManagerModules/wallpaper/wallpaper.nix
  ];

  home.packages = with pkgs; [
    # Desktop stuff
    rofimoji # Emoji selector for rofi
    keepassxc # Password manager
    btop # CLI resource monitor

    # File transfer
    localsend # Airdrop alternative
    syncthing # P2P sync over internet

    # Productivity
    tutanota-desktop # Mail client
    obsidian # Note taking app
    libreoffice-fresh # Office suite

    # Text editor
    nvf # Neovim config via nvf

    # Maker software
    orca-slicer # Slicer for 3d printer gcode
    openscad-unstable # Code CAD software
    freecad # GUI CAD software

    # Music production
    ardour # DAW
    guitarix # Guitar amp simulation

    # Entertainment
    miru # Anime torrent streaming app
    spotube # FOSS spotify alternative
  ];

  # Git configuration
  programs.git = {
    enable = true;
    userName = "Clement Callejon";
    userEmail = "clement.callejon@tutanota.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  ###################
  # CLI Environment #
  ###################

  # Terminal configuration
  programs.ghostty = {
    enable = true;

    settings = {
      # Font customization
      font-family = "JetBrains Mono Nerd Font";
      font-size = 13;

      # Color theme
      theme = "catppuccin-mocha";

      # Cursor customization
      cursor-style = "bar";
      cursor-opacity = 0.7;

      # Transparency customization
      background-opacity = 0.8;
      background-blur = true;

      # Clipbard settings
      clipboard-read = "ask";
      clipboard-write = "allow";

      # Other
      window-decoration = "none";
      desktop-notifications = true;
      resize-overlay = "never";
      link-url = true;
    };
  };

  # File Manager configuration
  programs.yazi.enable = true;

  # Resource monitor configuration
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "TTY";
      theme_background = false;
      vim_keys = true;
    };
  };

  #######################
  # Desktop Environment #
  #######################

  # Wallpaper configuration
  wallpaper = "wheat.png";

  # Picom configuration
  services.picom = {
    enable = true;
    vSync = true;

    fade = true;
    fadeSteps = [0.03 0.03];
    fadeDelta = 2;

    inactiveOpacity = 0.7;
  };

  # Rofi launcher configuration
  programs.rofi = {
    enable = true;

    # Appearance
    location = "center";
    font = "JetBrains Mono Nerd Font";
  };

  # i3 WM configuration
  xsession.windowManager.i3 = {
    enable = true;
    #package = pkgs.i3-gaps;
    config = {
      modifier = "Mod4";
      terminal = "ghostty";
      menu = "rofi -show drun";

      # Keybinds
      keybindings = let
        modifier = config.xsession.windowManager.i3.config.modifier;
        terminal = config.xsession.windowManager.i3.config.terminal;
        menu = config.xsession.windowManager.i3.config.menu;

        left = "h";
        down = "j";
        up = "k";
        right = "l";
      in
        lib.mkOptionDefault {
          # Control keybinds
          "${modifier}+Return" = "exec ${terminal}";
          "${modifier}+a" = "kill";
          "${modifier}+d" = "exec ${menu}";
          "${modifier}+semicolon" = "exec rofimoji";
          "${modifier}+Shift+x" = "exec systemctl suspend";
          "${modifier}+r" = "mode resize";

          # Focus keybinds
          "${modifier}+${left}" = "focus left";
          "${modifier}+${down}" = "focus down";
          "${modifier}+${up}" = "focus up";
          "${modifier}+${right}" = "focus right";

          # Window swap keybinds
          "${modifier}+Shift+${left}" = "move left";
          "${modifier}+Shift+${down}" = "move down";
          "${modifier}+Shift+${up}" = "move up";
          "${modifier}+Shift+${right}" = "move right";
        };
      # Modes
      modes = {
        resize = {
          h = "resize shrink width 10 px or 10 ppt";
          j = "resize shrink height 10 px or 10 ppt";
          k = "resize grow height 10 px or 10 ppt";
          l = "resize grow width 10 px or 10 ppt";

          Escape = "mode default";
          Return = "mode default";
        };
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
        names = ["JetBrains Mono Nerd Font"];
        style = "Bold Semi-Condensed";
        size = 11.0;
      };
    };
  };

  ###########
  # Browser #
  ###########

  # Web browser configuration
  programs.firefox = {
    enable = true;
  };
}
