{
  lib,
  config,
  ...
}: {
  # Git client configuration

  options = {
    git.enable =
      lib.mkEnableOption "enables git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "Clement Callejon";
      userEmail = "clement.callejon@tutanota.com";

      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
