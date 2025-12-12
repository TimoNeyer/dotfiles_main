{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./packages/neovim.nix
    ./packages/zsh.nix
    ./packages/misc.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };


  home = {
    username = "timo";
    homeDirectory = "/home/timo";
    stateVersion = "25.11";
    sessionVariables = {
      EDITOR = "vim";
      VISUAL = "vim";
    };
  };

  programs.home-manager.enable = true;
}
