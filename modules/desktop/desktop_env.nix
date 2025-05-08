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
    ./programs/rofi/rofimoji.nix
    ./programs/picom.nix
    ./programs/i3.nix
  ];

  # Wallpaper configuration
  wallpaper.file = "pompeii.png";

  rofi.enable = true;
  rofimoji.enable = true;
  i3.enable = true;
  picom.enable = true;
}
