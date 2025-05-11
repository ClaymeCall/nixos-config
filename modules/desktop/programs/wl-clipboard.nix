{
  lib,
  config,
  pkgs,
  ...
}: {
  # Wl-clipboard configuration

  options = {
    wl-clipboard.enable =
      lib.mkEnableOption "Whether to enable Wl-clipboard";
  };

  config = lib.mkIf config.wl-clipboard.enable {
    home.packages = with pkgs; [
      wl-clipboard
    ];
  };
}
