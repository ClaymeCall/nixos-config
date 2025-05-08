{
  lib,
  config,
  pkgs,
  ...
}: {
  #######################
  # Desktop Environment #
  #######################
  imports = [
    ./submodules/wallpaper/wallpaper.nix
    ./submodules/i3-suite.nix
  ];

  # Wallpaper configuration
  wallpaper.file = "pompeii.png";

  # Window manager
  i3-suite.enable = true;
}
