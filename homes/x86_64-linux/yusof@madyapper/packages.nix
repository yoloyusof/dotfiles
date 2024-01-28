{ pkgs, inputs, system, ... }:
let
  unstable = import inputs.nixpkgs-unstable {
    system = system;
    config.allowUnfree = true;
    config.permittedInsecurePackages = [ "electron-25.9.0" ];
  };
  charliepkgs = inputs.charliepkgs.packages.${pkgs.system};
in
{
  home.packages = with unstable; [
    vinegar
    obsidian
    inkscape
    gimp
    krita
    piper
    protonvpn-gui
    prismlauncher-qt5
    monophony
    g4music
    amberol
    tor-browser
    newsflash
    whois
  ] ++ [
    inputs.nix-software-center.packages.${pkgs.system}.nix-software-center
  ];
}

