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

  imports = [
    ../../modules/cli/cli_env.nix
    ../../modules/desktop/desktop_env.nix
  ];

  home.packages = with pkgs; [
    # Desktop stuff
    rofimoji # Emoji selector for rofi
    keepassxc # Password manager
    mullvad-vpn # Mullvad VPN client

    # File transfer
    localsend # Airdrop alternative
    syncthing # P2P sync over internet

    # Productivity
    tutanota-desktop # Mail client
    obsidian # Note taking app
    libreoffice-fresh # Office suite

    # Text editor
    nvf # Neovim config via nvf

    # Maker software
    orca-slicer # Slicer for 3d printer gcode
    openscad-unstable # Code CAD software
    freecad # GUI CAD software

    # Music production
    ardour # DAW
    guitarix # Guitar amp simulation

    # Entertainment
    miru # Anime torrent streaming app
    legcord # Pricavy friendly Discord client
    spotube # FOSS spotify alternative
  ];
}
