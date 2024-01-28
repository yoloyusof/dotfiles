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
      "x86_64-linux" = fetchurl {
        url = "https://github.com/oven-sh/bun/releases/download/bun-v${version}/bun-linux-x64-baseline.zip";
        hash = "sha256-vg8YtbhW122EU/oBuMoh5kPVqA6YRbRxrDZWnoJmdYQ=";
      };
    };
  };
})
