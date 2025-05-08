{
  lib,
  config,
  ...
}: {
  # Web browser configuration
  options = {
    firefox.enable =
      lib.mkEnableOption "Enables Firefox";
  };

  config = lib.mkIf config.firefox.enable {
    programs.firefox = {
      enable = true;
    };
  };
}
