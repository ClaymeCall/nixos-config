{
  lib,
  config,
  pkgs,
  ...
}: {
  # Miru Anime Streaming configuration

  options = {
    miru.enable =
      lib.mkEnableOption "Whether to enable Miru";
  };

  config = lib.mkIf config.miru.enable {
    home.packages = with pkgs; [
      miru
    ];
  };
}
