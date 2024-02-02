{ config, pkgs, inputs, ... }:

{
  services.xserver.desktopManager.gnome.enable = true;
  environment.systemPackages = [ pkgs.adwaita-qt ];
  qt.style = "adwaita-dark";
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-photos
    gnome.simple-scan
    gnome.gnome-maps
    gnome.seahorse
    gnome.geary
    snapshot
    epiphany
  ];
}
