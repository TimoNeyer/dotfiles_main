{ pkgs, ...}:
{
    home.packages = with pkgs; [
        atuin
        eza
        zoxide
        zsh
    ];
}
