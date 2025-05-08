{
  lib,
  config,
  pkgs,
  ...
}: {
  # Mullvad VPN configuration

  options = {
    mullvad-vpn.enable =
      lib.mkEnableOption "Whether to enable Mullvad VPN";
  };

  config = lib.mkIf config.mullvad-vpn.enable {
    home.packages = with pkgs; [
      mullvad-vpn
    ];
  };
}
