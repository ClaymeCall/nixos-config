{
  lib,
  config,
  pkgs,
  ...
}: {
  ############################
  # Hyprland Suite Submodule #
  ############################

  imports = [
    ../programs/hyprland/hyprland.nix
    ../programs/wofi/wofi.nix
    ../programs/wofi/wofi-emoji.nix
  ];

  options = {
    hyprland-suite.enable =
      lib.mkEnableOption "Enables a full hyprland suite";
  };

  config = lib.mkIf config.hyprland-suite.enable {
    hyprland.enable = true;
    wofi.enable = true;
    wofi-emoji.enable = true;
  };
}
