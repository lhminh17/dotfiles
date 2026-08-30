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
				theme = "TokyoNight";

				window-decoration = false;
				window-padding-x = 0;
				window-padding-y = 0;
				window-padding-balance = true;
			};
		};

		home.sessionVariables = {
			TERMINAL = "ghostty";
		};
	};
}

