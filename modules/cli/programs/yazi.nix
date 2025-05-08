{
  lib,
  config,
  ...
}: {
  # Yazi file manager configuration

  options = {
    yazi.enable =
      lib.mkEnableOption "Whether to enable yazi";
  };

  config = lib.mkIf config.yazi.enable {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
