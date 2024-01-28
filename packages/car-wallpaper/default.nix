{ inputs, pkgs, lib, ... }:
pkgs.writeTextFile {
  name = "car-wallpaper";
  destination = "/share/gnome-background-properties/car.xml";
  text = ''
    <?xml version="1.0"?>
    <!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
    <wallpapers>
      <wallpaper deleted="false">
        <name>Car</name>
        <filename>${./car.jpg}</filename>
        <options>zoom</options>
        <shade_type>solid</shade_type>
        <pcolor>#ffffff</pcolor>
        <scolor>#000000</scolor>
      </wallpaper>
    </wallpapers>
  '';

  meta = {
    description = "Car wallpaper";
    downloadPage =
      "https://github.com/yoloyusof/dotfiles/blob/main/packages/car-wallpaper/car.jpg";
    platforms = lib.platforms.all;
  };
}
