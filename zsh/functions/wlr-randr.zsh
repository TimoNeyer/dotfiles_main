function wr () {
  case $1 in
    "home")
      echo applying home
      wlr-randr --ouput eDP-1 --off
      ;;
    "parent")
      echo applying parent
      wlr-randr --output eDP-1 --off --output DP-5 --preferred --pos 0,0 --output DP-3 --pos 3840,0
      ;;
    *)
      bash -c "wlr-randr $@"
 esac
}
