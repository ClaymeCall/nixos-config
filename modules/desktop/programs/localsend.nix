{
  lib,
  config,
  pkgs,
  ...
}: {
  # LocalSend configuration

  options = {
    localsend.enable =
      lib.mkEnableOption "Whether to enable localsend";
  };

  config = lib.mkIf config.localsend.enable {
    home.packages = with pkgs; [
      localsend
    ];
  };
}
