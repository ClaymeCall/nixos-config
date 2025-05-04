{
  lib,
  config,
  pkgs,
  ...
}: {
  # Picom configuration
  services.picom = {
    enable = true;
    vSync = true;

    fade = true;
    fadeSteps = [0.03 0.03];
    fadeDelta = 2;

    inactiveOpacity = 0.9;
    menuOpacity = 1;
  };
}
