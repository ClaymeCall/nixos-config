# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  self,
  pkgs,
  inputs,
  ...
}: let
  nvf = self.outputs.packages."x86_64-linux".nvf;
in {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Include all necessary modules.
    inputs.home-manager.nixosModules.default
  ];

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.clement = import ./home.nix;
  home-manager.extraSpecialArgs = {inherit self inputs;};

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable network manager applet
  programs.nm-applet.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Fonts
  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];

  # Enable experimental Nix features
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Environment configuration
  environment = {
    variables = {
      TERM = "ghostty";
      SHELL = "zsh"; #Seems to work only at user level
    };

    shellAliases = {
      sudo = "sudo ";
      vim = "nvim";
      nixcfg = "sudo nvim /etc/nixos";
      rebuild = "sudo nixos-rebuild";
    };
  };

  # Shell configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    vteIntegration = true; # Enables shell integration in tty
    ohMyZsh = {
      enable = true;
      theme = "agnoster";
    };
  };

  # Enable the X11 windowing system with i3.
  services.xserver = {
    enable = true;
    windowManager.i3.enable = true;
    xkb = {
      layout = "fr";
      variant = "azerty";
    };
  };

  # Enable the Hyprland.
  programs.hyprland = {
    enable = true;
    #withUWSM = true;
  };

  services.displayManager = {
    defaultSession = "hyprland";
    ly.enable = true;
  };

  # Configure console keymap
  console.keyMap = "fr";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.clement = {
    isNormalUser = true;
    description = "Clement";
    extraGroups = ["networkmanager" "wheel" "audio"];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Versioning
  programs.git.enable = true;

  # Web Browser
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Virtual machine guest/host interaction
    spice-vdagent
    # Compilation
    gnumake
    libgcc

    # File download
    wget

    # Default applications for filetypes
    feh # Image viewer
    zathura # PDF viewer
    vlc # Media & video player
    clementine # Music player

    # Terminal emulator
    ghostty

    # Text editor
    nvf

    # CLI File exploration
    tree
    yazi
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
