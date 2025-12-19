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
    tree-sitter
    clang
    rustup
    zig
    zls
    uv
    claude-code
    nodejs
  ];
}
