{
  lib,
  config,
  pkgs,
  ...
}: {
  # Guitarix configuration

  options = {
    guitarix.enable =
      lib.mkEnableOption "Whether to enable Guitarix";
  };

  config = lib.mkIf config.guitarix.enable {
    home.packages = with pkgs; [
      guitarix
    ];
  };
}
