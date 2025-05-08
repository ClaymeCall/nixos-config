{
  lib,
  config,
  ...
}: {
  # Picom configuration

  options = {
    picom.enable =
      lib.mkEnableOption "Whether to enable Picom compositor";
  };

  config = lib.mkIf config.picom.enable {
    services.picom = {
      enable = true;
      vSync = true;

      fade = true;
      fadeSteps = [0.03 0.03];
      fadeDelta = 2;

      inactiveOpacity = 0.9;
      menuOpacity = 1;
    };
  };
}
