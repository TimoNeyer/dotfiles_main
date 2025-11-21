function md() {
  pandoc $@ | lynx -stdin
}

function mdpdf() {
  if [ -f "$2" ]; then
    echo Error: output file exists
  elif [ ! -f "$1" ]; then
    echo Error: input file not found
  else
    DATA_DIR="$(mktemp -d -p /tmp mdpdf.XXXXXXXX)"
    mkdir $DATA_DIR
    pandoc \
      --from=markdown \
      --to=pdf \
      --data-dir $DATA_DIR \
      -o $2 $1
    rm -r $DATA_DIR
  fi
}

function fuck() {
  local last_command=$(fc -n -l -1 -1)
  echo "Executing: sudo $last_command"
  echo -n "Continue? (Y/n) "
  read -r response
  if [[ $response =~ ^([Yy][Ee][Ss]|[Yy]|)$ ]]; then
    bash -c "sudo $last_command"
    return 0
  else
    echo "Aborted."
    return 1
  fi
}

function ,c() {
  command $@
}

function wg-sync() {
    sudo wg syncconf $1 <(wg-quick strip $1)
}

function vault() {
  DEFAULT_VAULT=cert
  CONFIG_PATH="$HOME/.config/vaults.json"
  SELECTED_VAULT=

  function cryfs-vault-open() {
    cryfs \
      -o allow_root \
      --unmount-idle 5 \
      $(jq -r --arg p "$SELECTED_VAULT" '.[$p].e' "$CONFIG_PATH") \
      $(jq -r --arg p "$SELECTED_VAULT" '.[$p].m' "$CONFIG_PATH")
  }

  function cryfs-vault-close() {
    cryfs-unmount \
      $(jq -r --arg p "$SELECTED_VAULT" '.[$p].m' "$CONFIG_PATH")
  }

  function gocryptfs_vault_open() {
    gocryptfs -nodev -noexec -nosuid -acl -i 15m -ro -allow_other $(jq -r --arg p "$SELECTED_VAULT" '.[$p].e' "$CONFIG_PATH") $(jq -r --arg p "$SELECTED_VAULT" '.[$p].m' "$CONFIG_PATH")
  }

  function gocryptfs_vault_close() {
    fusermount -u \
      $(jq -r --arg p "$SELECTED_VAULT" '.[$p].m' "$CONFIG_PATH")
  }
  if [[ $# -eq 2 ]]; then
    SELECTED_VAULT="$2"
  elif [[ $# -eq 1 ]]; then
    SELECTED_VAULT=$DEFAULT_VAULT
  fi
  case $1 in
  "open")
    gocryptfs_vault_open $SELECTED_VAULT
    ;;
  "close")
    gocryptfs_vault_close $SELECTED_VAULT
    ;;
  *)
    echo "error: unkown option $1, [open|close] VAULTNAME"
    return 1
    ;;
  esac
}
