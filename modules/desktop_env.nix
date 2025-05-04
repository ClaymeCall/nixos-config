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
    ./rofi/rofi.nix
    ./picom/picom.nix
    ./i3/i3.nix
  ];

  # Wallpaper configuration
  wallpaper = "wheat.png";
}
