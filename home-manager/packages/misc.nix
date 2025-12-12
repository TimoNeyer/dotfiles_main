{ pkgs, ...}:
{
    home.packages = with pkgs; [
        pandoc
        fzf
        killall
        ripgrep
        ripgrep-all
        btop
        tree
        mtr
        iperf3
        dnsutils
        socat
        nmap
        git-lfs
        gocryptfs
    ];
}
