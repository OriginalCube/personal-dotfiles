{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  virtualisation.docker.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Manila";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_PH.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_PH.UTF-8";
    LC_IDENTIFICATION = "en_PH.UTF-8";
    LC_MEASUREMENT = "en_PH.UTF-8";
    LC_MONETARY = "en_PH.UTF-8";
    LC_NAME = "en_PH.UTF-8";
    LC_NUMERIC = "en_PH.UTF-8";
    LC_PAPER = "en_PH.UTF-8";
    LC_TELEPHONE = "en_PH.UTF-8";
    LC_TIME = "en_PH.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

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
  };

  users.users.ori = {
    isNormalUser = true;
    description = "ori";
    extraGroups = [ "networkmanager" "wheel" "docker" "video"];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
      vim 
    wget
    zsh
    kitty
    curl 
    nodejs_22
    # yarn
    yarn-berry
    git
    vscode
    sway
    swaybg
    swaylock
    wofi
    neovim
    pnpm
    whitesur-icon-theme
    papirus-icon-theme
    tmux
    lazygit
    btop
    postman
    mysql84
    php84
    php84Packages.composer
    docker
    #---- Hyperland ----#
    hyprland
    waybar
    hyprpicker
    matugen
    wofi
    rofi
    wayland
    wayland-utils
    hyprlock 
    hyprshot
    hypridle
    wlogout
    #-------------------#

    #------ Apps  ------#
    chromium
    google-chrome
    discord
    xfce.thunar 
    unzip
    gimp
    fastfetch
    ranger 
    htop
    bun
    xclip
    inkscape
    obs-studio
    youtube-music 
    spotify
    brave
    networkmanagerapplet
    #-------------------#
    (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" ]; })
    obsidian
    # Work tools
    skypeforlinux
    viber
  ];

  # on-start
  programs.hyprland.enable = true;
  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
  ];
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    ohMyZsh.enable = true;
    ohMyZsh.plugins = [ "git" ];
    ohMyZsh.theme = "awesomepanda";
    syntaxHighlighting.enable = true;
  };

  system.stateVersion = "25.05";

}
