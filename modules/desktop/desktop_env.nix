{...}: {
  #######################
  # Desktop Environment #
  #######################
  imports = [
    ./submodules/wallpaper/wallpaper.nix
    ./submodules/i3-suite.nix
    ./submodules/office-tools.nix
    ./submodules/maker-software.nix
    ./submodules/music-production.nix
    ./submodules/entertainment.nix
  ];

  # Wallpaper configuration
  wallpaper.file = "pompeii.png";

  # Window manager
  i3-suite.enable = true;

  # Office & productivity tools
  office-tools.enable = true;

  # Maker Software
  maker-software.enable = true;

  # Music production software
  music-production.enable = true;

  # Entertainment software
  entertainment.enable = true;
}
