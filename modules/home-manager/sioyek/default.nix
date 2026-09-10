{ config, pkgs, lib, ... }:

let
  cfg = config.myHome.sioyek;
  
    sioyek-wrapped = pkgs.symlinkJoin {
    name = "sioyek-wrapped";
    paths = [ pkgs.sioyek ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/sioyek \
        --prefix XDG_DATA_DIRS : "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}" \
        --prefix XDG_DATA_DIRS : "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
    '';
  };
in {
  options.myHome.sioyek = {
    enable = lib.mkEnableOption "Sioyek config";
  };

  config = lib.mkIf cfg.enable {
        home.packages = [ sioyek-wrapped ];

    xdg.configFile."sioyek/prefs_user.config".source = ./prefs_user.config;
    xdg.configFile."sioyek/keys_user.config".source = ./keys_user.config;
  };
}
