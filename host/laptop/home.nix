{ config, pkgs, ... }:

{
  home.username = "minh";
  home.homeDirectory = "/home/minh";

  programs.home-manager.enable = true;

  home.stateVersion = "26.05";
}
