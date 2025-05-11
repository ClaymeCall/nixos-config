{
  lib,
  config,
  pkgs,
  ...
}: {
  # Hyprpicker configuration
  options = {
    hyprpicker.enable =
      lib.mkEnableOption "Whether to enable Hyprpicker";
  };

  config = lib.mkIf config.hyprpicker.enable {
    home.packages = with pkgs; [
      hyprpicker
    ];
  };
}
