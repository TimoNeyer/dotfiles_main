{ pkgs, ...}:
{
  home.packages = with pkgs; [
      pandoc
      killall
      btop
      tree
      mtr
      iperf3
      dnsutils
      socat
      nmap
      gocryptfs
      hexyl
  ];
}
