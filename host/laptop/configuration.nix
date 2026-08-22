{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/nixos
      ../../modules/hardware
    ];

  mySystem = {
    desktop.gnome.enable = true;
    hardware = {
      audio.enable = true;
      bluetooth.enable = true;
      dell.enable = true;
    };
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

 
  # Enable networking
  networking.networkmanager.enable = true;
 
   # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";


# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."minh" = {
    isNormalUser = true;
    description = "minh";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    neovim
    git
    firefox
    ghostty
    fastfetch
    wl-clipboard
    yazi
];

fonts = {
	packages = with pkgs; [
	nerd-fonts.jetbrains-mono 
	noto-fonts
	nerd-fonts.iosevka
	];
	fontconfig.defaultFonts.monospace = [ "JetbrainsMono Nerd Font" ];
};

#using flakes
nix.settings.experimental-features = [ "nix-command" "flakes"];

system.stateVersion = "26.05"; # Did you read the comment?

}
