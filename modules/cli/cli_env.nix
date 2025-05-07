{
  lib,
  config,
  pkgs,
  ...
}: {
  ###################
  # CLI Environment #
  ###################
  imports = [
    ./programs/ghostty.nix
    ./programs/git.nix
    ./programs/yazi.nix
    ./programs/btop.nix
  ];

  ghostty.enable = true; # Terminal emulator
  git.enable = true; # Source code manager
  yazi.enable = true; # File explorer
  btop.enable = true; # Resource monitor
}
