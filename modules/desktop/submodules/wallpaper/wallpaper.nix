{
  lib,
  config,
  ...
}: {
  # Wallpaper selector config
  options.wallpaper.file = lib.mkOption {
    default = null;
    type = with lib.types; nullOr str;
    description = "Name of the wallpaper image file to be linked at ~/.background-image";
  };

  config = lib.mkIf (config.wallpaper.file != null) {
    home.file.".background-image".source = ./. + "/${config.wallpaper.file}";
  };
}
