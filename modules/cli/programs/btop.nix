{
  lib,
  config,
  pkgs,
  ...
}: {
  # Resource monitor configuration
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "TTY";
      theme_background = false;
      vim_keys = true;
    };
  };
}
