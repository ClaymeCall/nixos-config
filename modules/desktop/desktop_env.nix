{...}: {
  #######################
  # Desktop Environment #
  #######################
  imports = [
    ./submodules/wallpaper/wallpaper.nix
    ./submodules/i3-suite.nix
    ./submodules/hyprland-suite.nix
    ./submodules/office-tools.nix
    ./submodules/maker-software.nix
    ./submodules/music-production.nix
    ./submodules/file-transfer.nix
    ./submodules/entertainment.nix
  ];

  # Enable media controls
  services.playerctld.enable = true;

  # Wallpaper configuration
  wallpaper.file = "pompeii.png";

  # Window manager/Desktop environment
  hyprland-suite.enable = true;

  # Office & productivity tools
  office-tools.enable = true;

  # Maker Software
  maker-software.enable = true;

  # Music production software
  music-production.enable = true;

  # File transfer software
  file-transfer.enable = true;

  # Entertainment software
  entertainment.enable = true;
}
