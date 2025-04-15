{ config, pkgs, ... }:

{
  home.username = "clement";
  home.homeDirectory = "/home/clement";
  home.stateVersion = "24.11";

  programs.zsh = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw";
    };
  };
}
