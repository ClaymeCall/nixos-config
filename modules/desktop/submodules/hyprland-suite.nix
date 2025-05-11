{
  lib,
  config,
  ...
}: {
  ############################
  # Hyprland Suite Submodule #
  ############################

  imports = [
    ../programs/hyprland/hyprland.nix
    ../programs/rofi/rofi.nix
    ../programs/rofi/rofimoji.nix
    ../programs/grimblast.nix
    ../programs/hyprpicker.nix
    ../programs/swaylock.nix
    ../programs/swaybg.nix
    ../programs/waybar.nix
    ../programs/wl-clipboard.nix
    ../programs/nwg-look.nix
  ];

  options = {
    hyprland-suite.enable =
      lib.mkEnableOption "Enables a full hyprland suite";
  };

  config = lib.mkIf config.hyprland-suite.enable {
    hyprland.enable = true; # WM & Compositor
    wl-clipboard.enable = true; # Clipboard utility for Wayland
    # App launcher menu
    rofi = {
      enable = true;
      wayland-mode = true;
    };
    rofimoji.enable = true; # Emoji selector
    grimblast.enable = true; # Screenshot tool
    hyprpicker.enable = true; # Color picker tool
    swaylock.enable = true; # Screenlock tool
    swaybg.enable = true; # Wallpaper setter
    waybar.enable = true; # Status bar
    nwg-look.enable = true; # GTK3 settings editor
  };
}
