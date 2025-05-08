{
  lib,
  config,
  pkgs,
  ...
}: {
  # Obsidian configuration

  options = {
    obsidian.enable =
      lib.mkEnableOption "Whether to enable obsidian";
  };

  config = lib.mkIf config.obsidian.enable {
    home.packages = with pkgs; [
      obsidian
    ];
  };
}
