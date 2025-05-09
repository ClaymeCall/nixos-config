{
  lib,
  config,
  ...
}:
##########################
# Office tools Submodule #
##########################
with lib; let
  cfg = config.office-tools;
in {
  options.office-tools = {
    enable =
      mkEnableOption "Enables various office & productivity tools";

    email = mkOption {
      type = types.bool;
      default = false;
      description = "Enable email client (e.g. Tuta)";
    };

    notes = mkOption {
      type = types.bool;
      default = false;
      description = "Enable note-taking app (e.g. Obsidian)";
    };

    office = mkOption {
      type = types.bool;
      default = false;
      description = "Enable office suite (e.g. LibreOffice)";
    };
  };

  config = {
    # Provide defaults when `enable = true` and user doesn't override
    office-tools = mkIf cfg.enable {
      email = mkDefault true;
      notes = mkDefault true;
      office = mkDefault true;
    };

    # Map purpose-driven toggles to actual programs
    tutanota.enable = cfg.email;
    obsidian.enable = cfg.notes;
    libreoffice.enable = cfg.office;
  };

  imports = [
    ../programs/tutanota.nix # Mail client
    ../programs/obsidian.nix # Note taking app
    ../programs/libreoffice.nix # Office suite
  ];
}
