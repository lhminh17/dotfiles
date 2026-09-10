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
  
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      config = {
        common = {
          default = [ "gnome" "gtk" ];
          "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      };
    };
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
    gsettings-desktop-schemas
    gtk3
    ];
 };
}
