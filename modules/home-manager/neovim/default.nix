{  config, lib, pkgs, ... }: 

with lib;

let 
  cfg = config.myHome.neovim;

in 
{
  options.myHome.neovim = {
    enable = mkEnableOption " config neovim ";
  };

  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;

      # plugin
      plugins = with pkgs.vimPlugins; [
        nvim-web-devicons
	      lualine-nvim
	      base16-nvim
        
        #telescope
        plenary-nvim
        telescope-nvim

        #neotree
        nvim-tree-lua
        ];
      
      extraPackages = with pkgs;[
        ripgrep
        fd
      ];

      initLua = builtins.readFile ./init.lua;
    };

		programs.bash.sessionVariables = {
			EDITOR = "nvim";
			VISUAL = "nvim";
  	};

		programs.zsh.sessionVariables = {
			EDITOR = "nvim";
			VISUAL = "nvim";
		};
	};
}
