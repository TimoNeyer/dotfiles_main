function bitwarden-cli () {
  if [ "$?" != "0" ]; then
    exit 1
  fi
  while true; do
    echo -n "bw-cli> "
    read -r input
    case "$input" in
      "help")
        bw --help
        continue
        ;;
      "exit")
        return 0
        ;;
      "unlock")
        SESSION="$(bw unlock)"
        continue
        ;;
      "clear")
        clear
        continue
        ;;
      "get")
        bw $input --session $SESSION | tr -d '\n' | wl-copy
        continue
        ;;
    esac
  if [ ! -z "$SESSION" ]; then
    bw $input --session $SESSION
  else
    bw $input
  fi
  done
  return 0
}
