{ inputs, pkgs, system, lib, ... }:

let
  unstable = import inputs.nixpkgs-unstable {
    system = system;
    config.allowUnfree = true;
  };
  charliepkgs = inputs.charliepkgs;
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  programs = {
    spicetify =
      let
        SpotifyNoPremium = pkgs.fetchgit {
          url = "https://github.com/Daksh777/SpotifyNoPremium";
          rev = "b67e393a3eacab964ed388d10802944fc1935148";
          sha256 = "HvJa7F92DwzP1q8qxjxgKVUUCS8SFlsk5jUEgj2VQSg=";
        };
      in
      {
        enable = true;
        theme = spicePkgs.themes.catppuccin;
        colorScheme = "mocha";

        enabledExtensions = with spicePkgs.extensions; [
          fullAppDisplay
          shuffle # shuffle+ (special characters are sanitized out of ext names)
          hidePodcasts
          adblock
        ];

        enabledCustomApps = with spicePkgs.apps; [
          new-releases
          lyrics-plus
        ];
      };
    firefox.enable = true;
    vscode.enable = true;
    obs-studio.enable = true;
    bun = {
      enable = true;
      package = pkgs.me.bun-baseline;
    };
    vesktop = {
      enable = true;
      package = charliepkgs.lib.patchOutput unstable.vesktop ''
        rm -r $out/share/icons
        mkdir -p $out/share/icons/hicolor/scalable/apps/
        cp ${
          ./icons/vesktop.svg
        } $out/share/icons/hicolor/scalable/apps/vesktop.svg
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
        commit.gpgsign = true;
        user.signingkey = "~/.ssh/id_ed25519.pub";
        gpg.format = "ssh";
        credential = {
          credentialStore = "plaintext";
          helper = "${pkgs.git-credential-manager}/bin/git-credential-manager";
        };
      };
    };
  };
}
