{ config, pkgs, inputs, ... }:

{
  imports = [
    # Import all the active user configurations
    ./yusof.nix
  ];

  users.mutableUsers = false;
  environment.shells = with pkgs; [ nushell ];
}
