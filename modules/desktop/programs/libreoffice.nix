{
  lib,
  config,
  pkgs,
  ...
}: {
  # LibreOffice configuration

  options = {
    libreoffice.enable =
      lib.mkEnableOption "Whether to enable LibreOffice";
  };

  config = lib.mkIf config.libreoffice.enable {
    home.packages = with pkgs; [
      libreoffice-fresh
    ];
  };
}
