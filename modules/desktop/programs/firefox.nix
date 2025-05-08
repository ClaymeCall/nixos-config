{
  lib,
  config,
  ...
}: {
  # Firefox Web browser configuration
  options = {
    firefox.enable =
      lib.mkEnableOption "Whether to enable Firefox";
  };

  config = lib.mkIf config.firefox.enable {
    programs.firefox = {
      enable = true;
    };
  };
}
