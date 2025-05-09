{
  lib,
  config,
  ...
}:
############################
# Maker Software Submodule #
############################
with lib; let
  cfg = config.maker-software;
in {
  options.maker-software = {
    enable =
      mkEnableOption "Enables various maker software";

    CAD = mkOption {
      type = types.bool;
      default = false;
      description = "Enable CAD software (e.g. FreeCAD)";
    };

    slicer = mkOption {
      type = types.bool;
      default = false;
      description = "Enable Slicer software (e.g. Orca Slicer)";
    };
  };

  config = {
    # Provide defaults when `enable = true` and user doesn't override
    maker-software = mkIf cfg.enable {
      CAD = mkDefault true;
      slicer = mkDefault true;
    };

    # Map purpose-driven toggles to actual programs
    freecad.enable = cfg.CAD;
    openscad.enable = cfg.CAD;
    orca-slicer.enable = cfg.slicer;
  };

  imports = [
    ../programs/orca-slicer.nix
    ../programs/freecad.nix
    ../programs/openscad.nix
  ];
}
