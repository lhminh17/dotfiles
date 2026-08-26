{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/nixos
      ../../modules/hardware
    ];
  # import modules
  mySystem = {
    core.enable = true;
    desktop.gnome.enable = true;
    hardware = {
      audio.enable = true;
      bluetooth.enable = true;
      dell.enable = true;
    };
  };

  # username 
  networking.hostName = "nixos";

   # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."minh" = {
    isNormalUser = true;
    description = "minh";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    packages = with pkgs; [];
  };

 system.stateVersion = "26.05"; # Did you read the comment?

}
