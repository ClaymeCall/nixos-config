{
  lib,
  config,
  ...
}:
###########################
# File Transfer Submodule #
###########################
with lib; let
  cfg = config.file-transfer;
in {
  options.file-transfer = {
    enable =
      mkEnableOption "Enables file transfer utilities";

    local = mkOption {
      type = types.bool;
      default = false;
      description = "Enable local file send tool (e.g. LocalSend)";
    };

    sync = mkOption {
      type = types.bool;
      default = false;
      description = "Enable syncing tool (e.g. Syncthing)";
    };
  };

  config = {
    # Provide defaults when `enable = true` and user doesn't override
    file-transfer = mkIf cfg.enable {
      local = mkDefault true;
      sync = mkDefault true;
    };

    # Map purpose-driven toggles to actual programs
    localsend.enable = cfg.local;
    syncthing.enable = cfg.sync;
  };

  imports = [
    ../programs/localsend.nix # Airdrop alternative
    ../programs/syncthing.nix # P2P sync over internet
  ];
}
