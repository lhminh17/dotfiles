{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.mySystem.hardware.audio;
in {
  options.mySystem.hardware.audio = {
    enable = mkEnableOption "Enable Pipewire Audio";
  };

  config = mkIf cfg.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
