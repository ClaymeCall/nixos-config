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
}
