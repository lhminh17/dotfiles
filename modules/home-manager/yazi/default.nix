{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.myHome.yazi;
in
{
  options.myHome.yazi = {
    enable = mkEnableOption "config yazi";
  };

  config = mkIf cfg.enable {
    programs.yazi = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;

      settings = {
        mgr = {
          show_hidden = true;
        };

        opener = {
          edit = [
            {
              run = ''nvim "$@"'';
              block = true;
              desc = "Edit with Neovim";
            }
          ];
        };

        open = {
          rules = [
            { name = "*/"; use = [ "edit" "open" "reveal" ]; }
            { mime = "text/*"; use = [ "edit" "reveal" ]; }
            { mime = "application/json"; use = [ "edit" "reveal" ]; }
            { mime = "*/javascript"; use = [ "edit" "reveal" ]; }
            { mime = "application/x-ndjson"; use = [ "edit" "reveal" ]; }
          ];
        };
      };
    };
  };
}
