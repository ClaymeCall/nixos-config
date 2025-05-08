{
  lib,
  config,
  pkgs,
  ...
}: {
  # Tutanota Desktop client configuration

  options = {
    tutanota-desktop.enable =
      lib.mkEnableOption "Whether to enable tutanota-desktop";
  };

  config = lib.mkIf config.tutanota-desktop.enable {
    home.packages = with pkgs; [
      tutanota-desktop
    ];
  };
}
