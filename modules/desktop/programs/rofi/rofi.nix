{
  lib,
  config,
  ...
}: {
  # Rofi launcher configuration
  options = {
    rofi.enable =
      lib.mkEnableOption "Enables rofi";
  };

  config = lib.mkIf config.rofi.enable {
    programs.rofi = {
      enable = true;

      # Appearance
      theme = "${config.home.homeDirectory}/.config/rofi/theme.rasi";
    };

    home.file."${config.home.homeDirectory}/.config/rofi/theme.rasi" = {
      source = ./theme.rasi;
    };
  };
}
