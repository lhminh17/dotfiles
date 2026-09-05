{ config, lib, pkgs, ... }:

with lib;

let 
  cfg = config.myHome.sioyek;
in
{
  options.myHome.sioyek = {
    enable = mkEnableOption "config sioyek dotfiles ";
  };

  config = mkIf cfg.enable {
    xdg.configFile."sioyek/keys_user.config".source = ./keys_user.config;
    xdg.configFile."sioyek/prefs_user.config".source = ./prefs_user.config;

  };
}
