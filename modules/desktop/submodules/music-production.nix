{
  lib,
  config,
  ...
}:
##############################
# Music production Submodule #
##############################
with lib; let
  cfg = config.music-production;
in {
  options.music-production = {
    enable =
      mkEnableOption "Enables various music production tools";

    DAW = mkOption {
      type = types.bool;
      default = false;
      description = "Enable DAW software (e.g. Ardour)";
    };

    guitar-amp = mkOption {
      type = types.bool;
      default = false;
      description = "Enable guitar amp simulations";
    };
  };

  config = {
    # Provide defaults when `enable = true` and user doesn't override
    music-production = mkIf cfg.enable {
      DAW = mkDefault true;
      guitar-amp = mkDefault true;
    };

    # Map purpose-driven toggles to actual programs
    ardour.enable = cfg.DAW;
    guitarix.enable = cfg.guitar-amp;
  };

  imports = [
    ../programs/ardour.nix
    ../programs/guitarix.nix
  ];
}
