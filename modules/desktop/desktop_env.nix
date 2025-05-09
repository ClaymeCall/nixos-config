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
    ./submodules/maker-software.nix
  ];

  # Wallpaper configuration
  wallpaper.file = "pompeii.png";

  # Window manager
  i3-suite.enable = true;

  # Maker Software
  maker-software.enable = true;
}
