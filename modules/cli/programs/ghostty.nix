{
  lib,
  config,
  ...
}: {
  # Ghostty terminal emulator configuration

  options = {
    ghostty.enable =
      lib.mkEnableOption "Whether to enable ghostty";
  };

  config = lib.mkIf config.ghostty.enable {
    programs.ghostty = {
      enable = true;

      settings = {
        # Font customization
        font-family = "JetBrains Mono Nerd Font";
        font-size = 13;

        # Color theme
        theme = "catppuccin-mocha";

        # Cursor customization
        cursor-style = "bar";
        cursor-opacity = 0.7;

        # Transparency customization
        background-opacity = 0.8;
        background-blur = true;

        # Clipboard settings
        clipboard-read = "ask";
        clipboard-write = "allow";

        # Other
        window-decoration = "none";
        desktop-notifications = true;
        resize-overlay = "never";
        link-url = true;
      };
    };
  };
}
