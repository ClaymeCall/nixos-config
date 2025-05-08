{
  lib,
  config,
  pkgs,
  ...
}: {
  # Orca-slicer  configuration

  options = {
    orca-slicer.enable =
      lib.mkEnableOption "Whether to enable Orca-slicer";
  };

  config = lib.mkIf config.orca-slicer.enable {
    home.packages = with pkgs; [
      orca-slicer
    ];
  };
}
