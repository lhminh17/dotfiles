{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.mySystem.hardware.dell;
in {
  options.mySystem.hardware.dell = {
    enable = mkEnableOption "Enable Dell & Intel optimizations";
  };

  config = mkIf cfg.enable {
    boot.kernelPackages = pkgs.linuxPackages_latest;
    boot.extraModprobeConfig = ''
      options dell-smm-hwmon ignore_dmi=1 force=1 fan_mult=1
    '';
    hardware.enableAllFirmware = true;
    hardware.enableRedistributableFirmware = true;
    hardware.graphics = {
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-vaapi-driver
        vpl-gpu-rt
      ];
    };
    services.thermald.enable = true;
    services.power-profiles-daemon.enable = true;
  };
}
