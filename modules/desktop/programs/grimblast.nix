{
  lib,
  config,
  pkgs,
  ...
}: {
  # Grimblast configuration
  options = {
    grimblast.enable =
      lib.mkEnableOption "Whether to enable Grimblast";
  };

  config = lib.mkIf config.grimblast.enable {
    home.packages = with pkgs; [
      grimblast
    ];
  };
}
