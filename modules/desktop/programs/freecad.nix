{
  lib,
  config,
  pkgs,
  ...
}: {
  # FreeCAD configuration

  options = {
    freecad.enable =
      lib.mkEnableOption "Whether to enable FreeCAD";
  };

  config = lib.mkIf config.freecad.enable {
    home.packages = with pkgs; [
      freecad
    ];
  };
}
