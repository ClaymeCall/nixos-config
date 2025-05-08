{
  lib,
  config,
  pkgs,
  ...
}: {
  # Spotube configuration

  options = {
    spotube.enable =
      lib.mkEnableOption "Whether to enable Spotube";
  };

  config = lib.mkIf config.spotube.enable {
    home.packages = with pkgs; [
      spotube
    ];
  };
}
