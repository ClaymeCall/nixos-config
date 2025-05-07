{
  lib,
  config,
  ...
}: {
  # Yazi file manager configuration

  options = {
    yazi.enable =
      lib.mkEnableOption "enables yazi";
  };

  config = lib.mkIf config.yazi.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
