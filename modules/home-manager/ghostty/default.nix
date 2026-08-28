{ config, lib, pkgs, ... }:

with lib;

let 
	cfg = config.myHome.ghostty;
in 
{
	options.myHome.ghostty = {
		enable = mkEnableOption " config ghostty ";
		};

	config = mkIf cfg.enable {
		programs.ghostty = {
			enable = true;
			settings = {
				theme = "base16-black-metal-gorgoroth";
				window-decoration = false;
				window-padding-x = 10;
				window-padding-y = 10;
				font-family = "Iosevka Nerd Font";
				font-size = 12;
			};
		};

		home.sessionVariables = {
			TERMINAL = "ghostty";
		};

		xdg.mimeApps = {
			enable = true;
			defaultApplications = {
				" terminal " = [ "com.mitchellh.ghostty.desktop" ];
			};
		};
	};
}

