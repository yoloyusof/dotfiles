{ config, pkgs, inputs, ... }:

{
  imports = [
    ./gaming.nix # Import settings for gaming
    ./sandboxing.nix # Import virtualisation and other container settings
    ./cryptography.nix # Import cryptography settings
  ];
}
