{ config, pkgs, inputs, ... }:

{
  imports = [
    ./gnome.nix # Add GNome Desktop Manager
    ./fonts.nix # Set-up font configurations
  ];
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    excludePackages = [ pkgs.xterm ];
  };
  # Enable GDM
  services.xserver.displayManager.gdm.enable = true;
}
