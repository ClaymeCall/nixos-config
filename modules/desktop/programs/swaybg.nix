{
  lib,
  config,
  pkgs,
  ...
}: {
  # Swaybg configuration
  options = {
    swaybg.enable =
      lib.mkEnableOption "Whether to enable Swaybg";
  };

  config = lib.mkIf config.swaybg.enable {
    home.packages = with pkgs; [
      swaybg
    ];
  };
}
