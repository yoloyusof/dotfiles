{ config, pkgs, inputs, ... }:

{
  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
  };
  # Optimisation utilities
  programs.gamemode.enable = true;
  environment.systemPackages = [
    pkgs.mangohud # MangoHud overlay
  ];
}
