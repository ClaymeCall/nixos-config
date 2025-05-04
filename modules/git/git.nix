{
  lib,
  config,
  pkgs,
  ...
}: {
  # Git configuration
  programs.git = {
    enable = true;
    userName = "Clement Callejon";
    userEmail = "clement.callejon@tutanota.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
