{
  lib,
  config,
  pkgs,
  ...
}: {
  # File Manager configuration
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };
}
