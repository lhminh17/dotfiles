{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.myHome.starship;
in
{
  options.myHome.starship = {
    enable = mkEnableOption " config starship suckless ";
  };

  config = mkIf cfg.enable {
    programs.bash = {
      enable = true;
    };

    programs.starship = {
      enable = true;
      enableBashIntegration = true;
      
      settings = {
        add_newline = false;
        format = "$directory$git_branch$git_status$nix_shell$character";

        directory = {
          style = "bold #88c0d0";
          truncation_length = 3;
          truncate_to_repo = true;
          format = "[$path]($style) ";
        };

        git_branch = {
          symbol = " ";
          style = "bold #81a1c1";
          format = "on [$symbol$branch]($style) ";
        };

        git_status = {
          style = "bold #ebcb8b";
          format = "([$all_status$ahead_behind]($style) )";
          staged = "+";
          modified = "*";
          untracked = "?";
          deleted = "✕";
        };

        nix_shell = {
          symbol = " ";
          style = "bold #8fbcbb";
          format = "via [$symbol$state]($style) ";
        };

        character = {
          success_symbol = "[❯](bold #a3be8c)";
          error_symbol = "[❯](bold #bf616a)";
        };
      };
    };
  };
}
