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
    ./wallpaper/wallpaper.nix
    ./programs/rofi/rofi.nix
    ./programs/picom.nix
    ./programs/i3.nix
  ];

  # Wallpaper configuration
  wallpaper = "pompeii.png";
}
