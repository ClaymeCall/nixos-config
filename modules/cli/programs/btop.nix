{
  lib,
  config,
  pkgs,
  ...
}: {
  # BTOP Resource monitor configuration

  options = {
    btop.enable =
      lib.mkEnableOption "Whether to enable btop";
  };

  config = lib.mkIf config.btop.enable {
    programs.btop = {
      enable = true;
      settings = {
        color_theme = "TTY";
        theme_background = false;
        vim_keys = true;
      };
    };
  };
}
