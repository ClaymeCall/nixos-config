{
  lib,
  config,
  pkgs,
  ...
}: {
  # i3 WM configuration

  options = {
    i3.enable =
      lib.mkEnableOption "Whether to enable i3 WM";
  };

  config = lib.mkIf config.i3.enable {
    xsession.windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
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
  };
}
