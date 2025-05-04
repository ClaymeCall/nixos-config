{
  lib,
  config,
  ...
}: {
  options.wallpaper = lib.mkOption {
    default = null;
    type = with lib.types; nullOr str;
    description = "Relative path to the wallpaper image to be linked at ~/.background-image";
  };

  config = lib.mkIf (config.wallpaper != null) {
    home.file.".background-image".source = ./. + "/${config.wallpaper}";
  };
}
