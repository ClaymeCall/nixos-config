{
  lib,
  config,
  pkgs,
  ...
}: {
  # Rofi launcher configuration

  programs.rofi = {
    enable = true;

    # Appearance
    theme = "${config.home.homeDirectory}/.config/rofi/theme.rasi";
  };

  home.file."${config.home.homeDirectory}/.config/rofi/theme.rasi" = {
    source = ./theme.rasi;
  };
}
