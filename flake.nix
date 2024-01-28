{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-software-center.url = "github:vlinkz/nix-software-center";
    nixos-artwork = {
      url = "github:NixOS/nixos-artwork";
      flake = false;
    };
    nix-std.url = "github:chessai/nix-std";
    nix-index-database = {
      url = "github:Mic92/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vscode-extensions.url = "github:nix-community/nix-vscode-extensions";

    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs = { nixpkgs.follows = "nixpkgs"; };
    };
    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme/nightly";
      flake = false;
    };

    charliepkgs = {
      url = "github:caffeinatedcharlie/charliepkgs";
      inputs = {
        nixpkgs.follows = "nixpkgs-unstable";
        snowfall-lib.follows = "snowfall-lib";
      };
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      channels-config.allowUnfree = true;
      src = ./.;

      snowfall.namespace = "me";

      # madyapper
      homes.users."yusof@madyapper".modules = with inputs; [
        nix-index-database.hmModules.nix-index
        charliepkgs.homeModules.vesktop
      ];
    };
}
