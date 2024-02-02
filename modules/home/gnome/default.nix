{ lib, osConfig, pkgs, ... }:

{
  config = lib.mkIf osConfig.services.xserver.desktopManager.gnome.enable {

    home.packages = with pkgs.gnomeExtensions;
      [
        appindicator
        hot-edge
        just-perfection
        blur-my-shell
        wayland-or-x11
        paperwm
        smile-complementary-extension
      ] ++ [
        pkgs.adw-gtk3
        pkgs.gnome.gnome-tweaks
        pkgs.me.nix-gear-wallpaper
        pkgs.me.car-wallpaper
      ];

    dconf.settings = {

      "org/gnome/mutter" = {
        attach-modal-dialogs = true;
        dynamic-workspaces = true;
        edge-tiling = true;
        focus-change-on-pointer-rest = true;
        overlay-key = "Super_L";
        workspaces-only-on-primary = true;
        experimental-features = [ "scale-monitor-framebuffer" ];
      };

      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          "gsconnect@andyholmes.github.io"
          "appindicatorsupport@rgcjonas.gmail.com"
          "switch-x11-wayland@prasanthc41m.github.com"
          "blur-my-shell@aunetx"
          "just-perfection-desktop@just-perfection"
          "hotedge@jonathan.jdoda.ca"
          "waylandorx11@injcristianrojas.github.com"
          "paperwm@paperwm.github.com"
          "smile-extension@mijorus.it"
        ];
        favorite-apps = [
          "firefox-nightly.desktop"
          "code.desktop"
          "vesktop.desktop"
          "org.gnome.Console.desktop"
          "obsidian.desktop"
          "org.prismlauncher.PrismLauncher.desktop"
          "org.gnome.Nautilus.desktop"
          "org.inkscape.Inkscape.desktop"
          "com.obsproject.Studio.desktop"
          "steam.desktop"
        ];
        welcome-dialog-last-shown-version = "1000000";
      };

      "org/gnome/shell/extensions/just-perfection" = {
        app-menu = false;
        power-icon = false;
        search = false;
        theme = true;
        top-panel-position = 1;
        switcher-popup-delay = true;
      };

    };
  };
}
