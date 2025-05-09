{
  lib,
  config,
  pkgs,
  ...
}: {
  # Tutanota Desktop client configuration

  options = {
    tutanota.enable =
      lib.mkEnableOption "Whether to enable tutanota-desktop";
  };

  config = lib.mkIf config.tutanota.enable {
    home.packages = with pkgs; [
      tutanota-desktop
    ];
  };
}
