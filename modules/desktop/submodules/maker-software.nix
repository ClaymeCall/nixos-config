{
  lib,
  config,
  ...
}: {
  ############################
  # Maker Software Submodule #
  ############################

  imports = [
    ../programs/orca-slicer.nix # Slicer for 3D printer gcode
    ../programs/freecad.nix # GUI CAD software
    ../programs/openscad.nix # Code CAD software
  ];

  options = {
    maker-software.enable =
      lib.mkEnableOption "Enables various maker software";
  };

  config = lib.mkIf config.maker-software.enable {
    orca-slicer.enable = true;
    freecad.enable = true;
    openscad.enable = true;
  };
}
