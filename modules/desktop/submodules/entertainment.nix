{
  lib,
  config,
  ...
}:
###########################
# Entertainment Submodule #
###########################
with lib; let
  cfg = config.entertainment;
in {
  options.entertainment = {
    enable = mkEnableOption "Enable the entertainment module";

    music = mkOption {
      type = types.bool;
      default = false;
      description = "Enable music streaming apps (e.g. Spotube)";
    };

    anime = mkOption {
      type = types.bool;
      default = false;
      description = "Enable anime streaming apps (e.g. Miru)";
    };

    voice-chat = mkOption {
      type = types.bool;
      default = false;
      description = "Enable voice chat apps (e.g. Discord)";
    };
  };

  config = {
    # Provide defaults when `enable = true` and user doesn't override
    entertainment = mkIf cfg.enable {
      music = mkDefault true;
      anime = mkDefault true;
      voice-chat = mkDefault true;
    };

    # Map purpose-driven toggles to actual programs
    miru.enable = cfg.anime;
    spotube.enable = cfg.music;
    legcord.enable = cfg.voice-chat;
  };

  imports = [
    ../programs/miru.nix
    ../programs/spotube.nix
    ../programs/legcord.nix
  ];
}
