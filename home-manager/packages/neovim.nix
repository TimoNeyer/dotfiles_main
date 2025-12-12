{ pkgs, ...}:
{
  home.packages = with pkgs; [
    neovim
    nerd-fonts.jetbrains-mono
    fd
    ripgrep
    lazygit
    lua5_1
    lua51Packages.jsregexp
    tree-sitter
    clang
    rustup
    zig
    uv
  ];
}
