{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  virtualisation.docker.enable = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Manila";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

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

  # Enable the GNOME Desktop Environment.
  services.xserver = {
    enable = true; 
 
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    desktopManager.gnome.enable = true;
    # desktopManager.sway.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
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
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" "docker" "video" ];
    packages = with pkgs; [];
  };

  # Enable programs
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
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
  fonts.fontconfig.enable = true;
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
  ];
  systemd.user.services.discord-on-startup = {
  description = "Launch Discord on user login";
  wantedBy = [ "default.target" ];
  serviceConfig = {
      ExecStart = "${pkgs.discord}/bin/discord";
      Restart = "always";
    };
  };

  programs.hyprland.enable = true;

  # Sway
  services.gnome.gnome-keyring.enable = true;

  # enable Sway window manager
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

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


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}

