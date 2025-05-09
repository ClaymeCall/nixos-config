{
  lib,
  config,
  pkgs,
  ...
}: {
  # OpenSCAD configuration

  options = {
    openscad.enable =
      lib.mkEnableOption "Whether to enable OpenSCAD";
  };

  config = lib.mkIf config.openscad.enable {
    home.packages = with pkgs; [
      openscad-unstable
    ];
  };
}
