{
  lib,
  config,
  pkgs,
  ...
}: {
  # Hyprlock configuration
  options = {
    hyprlock.enable =
      lib.mkEnableOption "Whether to enable hyprlock";
  };

  config = lib.mkIf config.hyprlock.enable {
    programs.hyprlock = {
      enable = true;

      /*
      settings = {
        general = {
          disable_loading_bar = false;
          hide_cursor = true;
          grace = 0;
        };

        background = [
          {
            path = "screenshot";
            blur_passes = 4;
            blur_size = 7;
            noise = 0.0117;
            contrast = 0.8916;
            brightness = 0.8172;
            vibrancy = 0.1696;
            vibrancy_darkness = 0.0;
          }
        ];

        image = [
          {
            path = "$HOME/.config/pfp/pfp.png";
            size = 150;
            rounding = -1;
            border_size = 4;
            border_color = "rgba(0, 0, 0, 0)";
            reload_time = -1;
            reload_cmd = "";
            position = "0, 200";
            halign = "center";
            valign = "center";
          }
        ];

        input-field = [
          {
            size = "300, 60";
            outline_thickness = 2;
            rounding = 18;
            dots_size = 0.33;
            dots_spacing = 0.15;
            outer_color = "rgb(220, 138, 120)"; # Rosewater
            inner_color = "rgb(221, 120, 120)"; # Flamingo
            font_color = "rgb(220, 138, 120)"; # Rosewater
            fade_on_empty = false;
            placeholder_text = "<i>Enter Password...</i>";
            check_color = "rgb(243, 139, 168)"; # Red
            fail_color = "rgb(210, 15, 57)"; # Red
            hide_input = false;
            position = "0, -100";
            halign = "center";
            valign = "center";
          }
        ];

        label = [
          {
            text = "こんにちは  $USER 󱠡 <br/>";
            color = "rgb(205, 214, 244)"; # Text
            font_size = 21;
            font_family = "JetBrainsMono Nerd Font";
            position = "0, 60";
            halign = "center";
            valign = "center";
          }

          {
            text = " <br/>";
            color = "rgb(243, 139, 168)"; # Red
            font_size = 42;
            font_family = "JetBrainsMono Nerd Font";
            position = "0, 0";
            halign = "center";
            valign = "bottom";
          }

          {
            text = "cmd[update:0] date \"+ %A %B %d, 󰥔 %H:%M\"";
            color = "rgb(76, 79, 105)"; # Text
            font_family = "VictorMono NF Bold";
            font_size = 20;
            position = "-60, 0";
            halign = "right";
            valign = "bottom";
          }
        ];
      };
      */
    };
  };
}
