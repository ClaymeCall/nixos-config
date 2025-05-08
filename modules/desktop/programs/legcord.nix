{
  lib,
  config,
  pkgs,
  ...
}: {
  # Legcord configuration

  options = {
    legcord.enable =
      lib.mkEnableOption "Whether to enable Legcord";
  };

  config = lib.mkIf config.legcord.enable {
    home.packages = with pkgs; [
      legcord
    ];
  };
}
