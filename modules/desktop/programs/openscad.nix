{
  lib,
  config,
  pkgs,
  ...
}: {
  # OpenSCAD configuration

  options = {
    openscad-unstable.enable =
      lib.mkEnableOption "Whether to enable OpenSCAD";
  };

  config = lib.mkIf config.openscad-unstable.enable {
    home.packages = with pkgs; [
      openscad-unstable
    ];
  };
}
