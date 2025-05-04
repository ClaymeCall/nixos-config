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
    ./ghostty/ghostty.nix
    ./git/git.nix
    ./yazi/yazi.nix
    ./btop/btop.nix
  ];
}
