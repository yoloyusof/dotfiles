{ lib, pkgs, inputs, system, ... }:
let
  unstable = import inputs.nixpkgs-unstable {
    system = system;
    config.allowUnfree = true;
    config.permittedInsecurePackages = [ "electron-25.9.0" ];
  };
in
unstable.bun.overrideAttrs (old: {
  pname = "${old.pname}-mainline-patch";

  passthru = {
    sources = with lib; {
      "aarch64-darwin" = fetchurl {
        url = "https://github.com/oven-sh/bun/releases/download/bun-v${version}/bun-darwin-aarch64.zip";
        hash = "sha256-Upgh45aYCNmW1we/+2VsNbJl718HKQNFoAg0zDmHSwA=";
      };
      "aarch64-linux" = fetchurl {
        url = "https://github.com/oven-sh/bun/releases/download/bun-v${version}/bun-linux-aarch64.zip";
        hash = "sha256-RhHJ3H6tA8te1sk0eMEb5jBHFoAvfBTUWQo6O3ycMCs=";
      };
      "x86_64-darwin" = fetchurl {
        url = "https://github.com/oven-sh/bun/releases/download/bun-v${version}/bun-darwin-x64.zip";
        hash = "sha256-TSnZ727ERoglVxJQ/Ve+YkZNezYD1YxwJRw2sC1F0ro=";
      };
      "x86_64-linux" = fetchurl {
        url = "https://github.com/oven-sh/bun/releases/download/bun-v${version}/bun-linux-x64-baseline.zip";
        hash = "sha256-vg8YtbhW122EU/oBuMoh5kPVqA6YRbRxrDZWnoJmdYQ=";
      };
    };
  };
})
