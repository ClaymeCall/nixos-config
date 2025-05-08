{
  lib,
  config,
  pkgs,
  ...
}: {
  ######################
  # i3 Suite Submodule #
  ######################

  imports = [
    ../programs/i3.nix
    ../programs/rofi/rofi.nix
    ../programs/rofi/rofimoji.nix
    ../programs/picom.nix
  ];

  options = {
    i3-suite.enable =
      lib.mkEnableOption "Enables a full i3 suite";
  };

  config = lib.mkIf config.i3-suite.enable {
    i3.enable = true;
    rofi.enable = true;
    rofimoji.enable = true;
    picom.enable = true;
  };
}
