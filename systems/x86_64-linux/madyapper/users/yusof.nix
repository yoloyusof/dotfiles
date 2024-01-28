{ config, pkgs, inputs, ... }:

{
  users.users.yusof = {
    # My user account
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "libvirtd" "video" "audio" ];
    initialHashedPassword = "$y$j9T$Ti3J9SPuMWUbrUEjTYgbf0$wNuh5CG1AfASfkaBoxpr1GsgPU9DRjk50wH9aUilDD7";
    shell = pkgs.nushell;
  };
}
