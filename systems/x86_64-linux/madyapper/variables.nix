{ config, pkgs, inputs, ... }:

{
  # Configure the session variables
  environment.sessionVariables = rec {
    "NIXOS_OZONE_WL" = "1"; # Tells applications to use Wayland by default
    "NIXPKGS_ALLOW_UNFREE" = "1"; # Allow unfree packages (Not necessary just incase)
  };
}
