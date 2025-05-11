{
  lib,
  config,
  pkgs,
  ...
}: let
  terminal = config.home.sessionVariables.TERMINAL;
  menu = config.home.sessionVariables.MENU;
  emoji_selector = config.home.sessionVariables.EMOJI_SELECTOR;
  colorPicker = config.home.sessionVariables.COLOR_PICKER;
  screenshot = config.home.sessionVariables.SCREENSHOT;
  lockscreen = config.home.sessionVariables.LOCKSCREEN;
  status_bar = config.home.sessionVariables.STATUS_BAR;
in {
  # Hyprland configuration

  options = {
    hyprland.enable =
      lib.mkEnableOption "Whether to enable Hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      #xwayland.enable = true;

      settings = {
        general = {
          gaps_in = 2;
          gaps_out = 7;
          border_size = 1;
          "col.active_border" = "rgba(ffffff88)";
          "col.inactive_border" = "rgba(ff0f0f0f)";
        };

        #env = ["XCURSOR_SIZE, 24"];

        # Monitor config
        monitor = "Virtual-1, 1920x1200@60, 0x0, 1";

        decoration = {
          rounding = 5;
          blur = {
            enabled = false;
            size = 5;
            passes = 3;
          };
          dim_inactive = true;

          active_opacity = 1;
          inactive_opacity = 1;
          fullscreen_opacity = 1;

          shadow = {
            enabled = false;
          };
        };

        animations = {
          enabled = false;
        };

        input = {
          kb_layout = "fr";
          kb_variant = "azerty";
          follow_mouse = 1;
          natural_scroll = false;
          touchpad = {
            disable_while_typing = true;
          };
          sensitivity = 1.0;
        };

        bind = [
          # Launch terminal
          "SUPER, RETURN, exec, ${terminal}"

          # Fullscreen active window
          "SUPER, F, fullscreen, 0"

          # Toggle float mode on active window
          "SUPER_SHIFT, F, togglefloating"

          # Close active window
          "SUPER, A, killactive"

          # Go to workspace (code:xx is french layout)
          "SUPER, code:10, workspace, 1"
          "SUPER, code:11, workspace, 2"
          "SUPER, code:12, workspace, 3"
          "SUPER, code:13, workspace, 4"
          "SUPER, code:14, workspace, 5"
          "SUPER, code:15, workspace, 6"
          "SUPER, code:16, workspace, 7"
          "SUPER, code:17, workspace, 8"
          "SUPER, code:18, workspace, 9"
          "SUPER, code:19, workspace, 10"

          # Change focus
          "SUPER, H, movefocus, l"
          "SUPER, J, movefocus, d"
          "SUPER, K, movefocus, u"
          "SUPER, L, movefocus, r"

          # Swap windows in workspace
          "SUPER_SHIFT, H, movewindow, l"
          "SUPER_SHIFT, J, movewindow, d"
          "SUPER_SHIFT, K, movewindow, u"
          "SUPER_SHIFT, L, movewindow, r"

          # Send window to workspace (code:xx is french layout)
          "SUPER_SHIFT, code:10, movetoworkspacesilent, 1"
          "SUPER_SHIFT, code:11, movetoworkspacesilent, 2"
          "SUPER_SHIFT, code:12,movetoworkspacesilent, 3"
          "SUPER_SHIFT, code:13, movetoworkspacesilent, 4"
          "SUPER_SHIFT, code:14, movetoworkspacesilent, 5"
          "SUPER_SHIFT, code:15, movetoworkspacesilent, 6"
          "SUPER_SHIFT, code:16, movetoworkspacesilent, 7"
          "SUPER_SHIFT, code:17, movetoworkspacesilent, 8"
          "SUPER_SHIFT, code:18, movetoworkspacesilent, 9"
          "SUPER_SHIFT, code:19, movetoworkspacesilent, 10"

          # App launcher
          "SUPER, D, exec, ${menu}"

          # Emoji selector
          "SUPER, semicolon, exec, ${emoji_selector}"

          # Launch color picker
          "SUPER, C, exec, ${colorPicker}"

          # Screenshot
          "SUPER, S, exec, ${screenshot}"

          # Lock screen
          "SUPER_SHIFT, X, exec, ${lockscreen}"

          # Reload renderer
          "SUPER_SHIFT, R, forcerendererreload"

          # Exit Hyprland
          "SUPER_SHIFT, E, exit"
        ];

        # Laptop multimedia keys for volume and LCD brightness
        bindel = [
          ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
          ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
        ];

        # Requires playerctl
        bindl = [
          ", XF86AudioNext, exec, playerctl next"
          ", XF86AudioPause, exec, playerctl play-pause"
          ", XF86AudioPlay, exec, playerctl play-pause"
          ", XF86AudioPrev, exec, playerctl previous"
        ];

        windowrule = [
          "size 1231 950,title:^(Open Folder)$"
          "float,title:^(Open Folder)$"

          "size 1231 950,title:^(Open File)$"
          "float,title:^(Open File)$"
        ];

        exec-once = [
          # Set wallpaper
          "swaybg -i ${config.home.homeDirectory}/.background-image --mode fill"

          # Set cursor
          "hyprctl setcursor Bibata-cursors 24"

          # Start status bar
          "${status_bar}"
        ];

        misc = {
          force_default_wallpaper = 1;
          disable_hyprland_logo = true;
        };
      };
    };
  };
}
