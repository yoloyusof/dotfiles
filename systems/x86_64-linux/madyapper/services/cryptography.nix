{ config, pkgs, inputs, ... }: {
  # GnuPG agent
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
