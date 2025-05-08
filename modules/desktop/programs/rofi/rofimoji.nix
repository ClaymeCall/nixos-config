{
  lib,
  config,
  pkgs,
  ...
}: {
  # Rofimoji configuration

  options = {
    rofimoji.enable =
      lib.mkEnableOption "Whether to enable rofimoji";
  };

  config = lib.mkIf config.rofimoji.enable {
    home.packages = with pkgs; [
      rofimoji
    ];
  };
}
