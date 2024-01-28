{ inputs, pkgs, system, lib, ... }:

let
  unstable = import inputs.nixpkgs-unstable { system = system; config.allowUnfree = true; };
  charliepkgs = inputs.charliepkgs;
in
{
  programs = {
    firefox.enable = true;
    vscode.enable = true;
    obs-studio.enable = true;
    bun =
      {
        enable = true;
        package = pkgs.me.bun-mainline;
      };
    vesktop = {
      enable = true;
      package = charliepkgs.lib.patchOutput unstable.vesktop ''
        rm -r $out/share/icons
        mkdir -p $out/share/icons/hicolor/scalable/apps/
        cp ${./icons/vesktop.svg} $out/share/icons/hicolor/scalable/apps/vesktop.svg
      '';
    };
    nix-index-database.comma.enable = true;
    nushell = {
      enable = true;
      shellAliases = {
        switch = "sudo nixos-rebuild switch --fast --print-build-logs";
        nv = "nix develop --command code";
        gc = "sudo nix-collect-garbage -d";
      };
      extraConfig = ''
        $env.config.show_banner = false;
        $env.config.shell_integration = true;
      '';
    };
    git = {
      enable = true;
      userName = "yoloyusof";
      userEmail = "117531058+yoloyusof@users.noreply.github.com";
      extraConfig = {
        core.editor = "code --wait";
        init.defaultBranch = "main";
        credential = {
          credentialStore = "plaintext";
          helper = "${pkgs.git-credential-manager}/bin/git-credential-manager";
        };
      };
    };
  };
}
