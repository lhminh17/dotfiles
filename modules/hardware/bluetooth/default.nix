{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.mySystem.hardware.bluetooth;
in {
  options.mySystem.hardware.bluetooth = {
    enable = mkEnableOption " Bluetooth";
  };

  config = mkIf cfg.enable {
    hardware.bluetooth.enable = true;
  };
}
