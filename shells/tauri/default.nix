{ pkgs, ... }:
pkgs.mkShell {
  packages = [
    pkgs.rustc
    pkgs.cargo
    pkgs.rust-analyzer
    pkgs.rustfmt
    pkgs.clippy
    pkgs.nodePackages_latest.nodejs
    pkgs.nodePackages_latest.pnpm
  ];

  RUST_BACKTRACE = "1";
  RUST_SRC_PATH = pkgs.rustPlatform.rustLibSrc;
}
