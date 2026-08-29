{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home-manager
  ];

  home.username = "minh";
  home.homeDirectory = "/home/minh";

  programs.home-manager.enable = true;
  home.stateVersion = "26.05";

  # neovim
  myHome.neovim.enable = true;
	# yazi
	myHome.yazi.enable = false;
	# ghostty
	myHome.ghostty.enable = true;
  # starship
  myHome.starship.enable = true;

}
