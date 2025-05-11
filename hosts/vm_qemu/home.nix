{
  self,
  config,
  lib,
  pkgs,
  ...
}: let
  nvf = self.outputs.packages."x86_64-linux".nvf;
in {
  home.username = "clement";
  home.homeDirectory = "/home/clement";
  home.stateVersion = "24.11";
  home.keyboard.layout = "fr";

  # Define session variables
  home.sessionVariables = {
    TERMINAL = "ghostty";
    MENU = "rofi -show drun";
    EMOJI_SELECTOR = "rofimoji";
    COLOR_PICKER = "hyprpicker -a";
    SCREENSHOT = "grimblast";
    LOCKSCREEN = "swaylock";
    STATUS_BAR = "waybar";
  };

  # Let Home-Manager install and manage itself
  programs.home-manager.enable = true;

  # Import custom modules
  imports = [
    ../../modules/cli/cli_env.nix
    ../../modules/desktop/desktop_env.nix
  ];

  # Packages not fitting in any module
  home.packages = with pkgs; [
    # Text editor
    nvf # Neovim config via nvf
  ];
}
