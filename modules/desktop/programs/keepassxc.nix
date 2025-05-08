{
  lib,
  config,
  pkgs,
  ...
}: {
  # KeepassXC Password manager configuration

  options = {
    keepassxc.enable =
      lib.mkEnableOption "Whether to enable KeepassXC";
  };

  config = lib.mkIf config.keepassxc.enable {
    home.packages = with pkgs; [
      keepassxc
    ];
  };
}
