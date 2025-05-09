{
  lib,
  config,
  ...
}: {
  # Wofi launcher configuration

  options = {
    wofi.enable =
      lib.mkEnableOption "Whether to enable Wofi";
  };

  config = lib.mkIf config.wofi.enable {
    programs.wofi = {
      enable = true;

      # Appearance
      style = "${config.home.homeDirectory}/.config/wofi/theme.rasi";
    };

    home.file."${config.home.homeDirectory}/.config/wofi/theme.rasi" = {
      source = ./theme.rasi;
    };
  };
}
