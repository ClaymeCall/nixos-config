{
  lib,
  config,
  pkgs,
  ...
}: {
  # Wofi emoji configuration

  options = {
    wofi-emoji.enable =
      lib.mkEnableOption "Whether to enable wofi-emoji";
  };

  config = lib.mkIf config.wofi-emoji.enable {
    home.packages = with pkgs; [
      wofi-emoji
    ];
  };
}
