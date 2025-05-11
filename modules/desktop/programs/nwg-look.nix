{
  lib,
  config,
  pkgs,
  ...
}: {
  # NWG-Look configuration

  options = {
    nwg-look.enable =
      lib.mkEnableOption "Whether to enable NWG-Look";
  };

  config = lib.mkIf config.nwg-look.enable {
    home.packages = with pkgs; [
      nwg-look
    ];
  };
}
