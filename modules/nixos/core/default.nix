{ config, lib, pkgs, ...}: 

with lib;

let 
  cfg = config.mySystem.core;
in {
  options.mySystem.core = {
    enable = mkEnableOption " core system settings ";
  };

  config = mkIf cfg.enable {
    # bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # network
    networking.networkmanager.enable = true;
    i18n.defaultLocale = "en_US.UTF-8";

    # flakes
    nixpkgs.config.allowUnfree = true;
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    #environment variables
    environment.systemPackages = with pkgs; [
	    neovim
	    git
	    firefox
	    ghostty
	    fastfetch
	    wl-clipboard
	    yazi
      sioyek
    ];

    # fonts 
    fonts = {
      packages = with pkgs; [
        nerd-fonts.jetbrains-mono 
      	noto-fonts
	      nerd-fonts.iosevka
        nerd-fonts.comic-shanns-mono
      ];
      fontconfig.defaultFonts.monospace = [ "JetBrainsMono Nerd Font" ];
    };
  };
}
