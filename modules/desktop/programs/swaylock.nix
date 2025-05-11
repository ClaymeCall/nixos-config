{
  lib,
  config,
  pkgs,
  ...
}: {
  # Swaylock configuration
  options = {
    swaylock.enable =
      lib.mkEnableOption "Whether to enable Swaylock";
  };

  config = lib.mkIf config.swaylock.enable {
    home.packages = with pkgs; [
      swaylock
    ];
  };
}
