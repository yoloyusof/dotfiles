# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, inputs, ... }:

{
  nix = {
    # https://nixos.org/manual/nix/stable/command-ref/conf-file.html
    settings = {
      # How to update this array later: Go to https://nixos.org/manual/nix/stable/contributing/experimental-features#currently-available-experimental-features
      # and run `copy(JSON.stringify($$("#currently-available-experimental-features ~ h2").map(h2 => h2.textContent), null, 2).replaceAll(",", ""))`
      experimental-features = [ "flakes" "nix-command" ];
      use-xdg-base-directories =
        false; # Some bug makes $PATH not update to the new directories so for now I'm disabling this
      auto-optimise-store = true;
      log-lines = 10000000;
      substituters = [ "https://nix-community.cachix.org" ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
    # https://github.com/Nyabinary/dotfiles/blob/4491af8ecc54fdd65ae4af7906080208682b15c9/hosts/default.nix#L30-L34
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = [ "nixpkgs=flake:nixpkgs" ];
  };
  home-manager.useUserPackages =
    true; # "This is necessary if, for example, you wish to use `nixos-rebuild build-vm`" ―https://nix-community.github.io/home-manager/#:~:text=use%20nixos-rebuild-,build-vm,-.%20This%20option%20may
  home-manager.useGlobalPkgs = true;
}

