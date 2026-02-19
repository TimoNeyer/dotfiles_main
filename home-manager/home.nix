{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./packages/coding.nix
    ./packages/zsh.nix
    ./packages/misc.nix
    ./editors/vim.nix
  ];

  home = {
    username = "timo";
    homeDirectory = "/home/timo";
    stateVersion = "25.11";
    sessionVariables = {
      EDITOR = "vim";
      VISUAL = "vim";
    };
  };
    nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;
}
