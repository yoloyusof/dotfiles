{ config, pkgs, inputs, ... }:

{
  users.users.yusof = {
    # My user account
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "libvirtd" "video" "audio" ];
    initialHashedPassword = "$y$j9T$It5oQO/Z2zis15EnpJinD.$.AujWRPz4EYUfuRMOTmByKCw051rRLbh8OAiqv2KVS/";
    shell = pkgs.nushell;
  };
}
