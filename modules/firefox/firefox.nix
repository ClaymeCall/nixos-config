{
  lib,
  config,
  pkgs,
  ...
}: {
  # Web browser configuration
  programs.firefox = {
    enable = true;
  };
}
