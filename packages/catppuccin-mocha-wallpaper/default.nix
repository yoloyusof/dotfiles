{ inputs, pkgs, lib, ... }:
pkgs.writeTextFile {
  name = "catppuccin-mocha-wallpaper";
  destination = "/share/gnome-background-properties/catppuccin-mocha-wallpaper.xml";
  text = ''
    <?xml version="1.0"?>
    <!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
    <wallpapers>
      <wallpaper deleted="false">
        <name>Catppuccin Mocha Wallpaper</name>
        <filename>${./wallpaper.png}</filename>
        <options>zoom</options>
        <shade_type>solid</shade_type>
        <pcolor>#ffffff</pcolor>
        <scolor>#000000</scolor>
      </wallpaper>
    </wallpapers>
  '';

  meta = {
    description = "Catppuccin wallpaper";
    downloadPage =
      "https://github.com/yoloyusof/dotfiles/blob/main/packages/catppuccin-mocha-wallpaper/wallpaper.png";
    platforms = lib.platforms.all;
  };
}
