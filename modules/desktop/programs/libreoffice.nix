{
  lib,
  config,
  pkgs,
  ...
}: {
  # LibreOffice configuration

  options = {
    libreoffice-fresh.enable =
      lib.mkEnableOption "Whether to enable LibreOffice";
  };

  config = lib.mkIf config.libreoffice-fresh.enable {
    home.packages = with pkgs; [
      libreoffice-fresh
    ];
  };
}
