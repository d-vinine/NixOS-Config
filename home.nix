{ pkgs, inputs, ... }: {
  imports = [
    ./modules/home/nixvim.nix
    ./modules/home/ghostty.nix
    ./modules/home/zen.nix
    ./modules/home/bash.nix
    ./modules/home/git.nix
    ./modules/home/tmux.nix
  ];

  home.packages = with pkgs; [
    nixpkgs-fmt
    ripgrep
    man-pages
    man-pages-posix
  ];

  home.username = "dhanvinm";
  home.homeDirectory = "/home/dhanvinm";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
