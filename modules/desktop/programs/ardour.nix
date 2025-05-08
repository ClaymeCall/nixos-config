{
  lib,
  config,
  pkgs,
  ...
}: {
  # Ardour configuration

  options = {
    ardour.enable =
      lib.mkEnableOption "Whether to enable Ardour";
  };

  config = lib.mkIf config.ardour.enable {
    home.packages = with pkgs; [
      ardour
    ];
  };
}
