{
  lib,
  config,
  pkgs,
  ...
}: {
  # Syncthing configuration

  options = {
    syncthing.enable =
      lib.mkEnableOption "Whether to enable Syncthing";
  };

  config = lib.mkIf config.syncthing.enable {
    home.packages = with pkgs; [
      syncthing
    ];
  };
}
