{ pkgs, ...}:
{
  home.packages = with pkgs; [
    neovim
    nerd-fonts.jetbrains-mono
    fd
    fzf
    git-lfs
    ripgrep
    ripgrep-all
    lazygit
    lua5_1
    lua51Packages.jsregexp
    lua51Packages.luarocks
    tree-sitter
    ghc
    zig
    zls
    uv
    claude-code
    nodejs
    go
  ];
}
