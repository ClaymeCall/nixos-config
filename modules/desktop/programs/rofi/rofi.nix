{
  lib,
  config,
  pkgs,
  ...
}: {
  # Rofi launcher configuration
  options.rofi = {
    enable = lib.mkEnableOption "Whether to enable rofi";

    wayland-mode = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable Wayland compatibility using rofi-wayland package.";
    };
  };

  config = lib.mkIf config.rofi.enable {
    programs.rofi = {
      enable = true;

      # Use rofi-wayland if Wayland mode is enabled
      package = lib.mkIf config.rofi.wayland-mode pkgs.rofi-wayland;

      # Appearance
      theme = "${config.home.homeDirectory}/.config/rofi/theme.rasi";
    };

    home.file.".config/rofi/theme.rasi" = {
      source = ./theme.rasi;
    };
  };
}
