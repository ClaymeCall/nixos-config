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
