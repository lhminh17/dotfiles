{ config, lib, pkgs, ... }:
with lib;

let 
  cfg = config.mySystem.desktop.gnome;

in{
  options.mySystem.desktop.gnome = {
    enable = mkEnableOption " gnome ";
  };

  config = mkIf cfg.enable {
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

    environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    epiphany
    geary
    gnome-music
    totem
  ];

    environment.systemPackages = with pkgs; [
    gnome-tweaks
    wl-clipboard
  ];
 };
}
