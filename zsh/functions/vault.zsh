#!/bin/env sh

DEFAULT_VAULT=cert
CONFIG_PATH="$HOME/.config/zsh/functions/vaults.json.local"
SELECTED_VAULT=

cryfs-vault-open() {
    cryfs \
        -o allow_root \
        --unmount-idle 5 \
        $(jq -r --arg p "$SELECTED_VAULT" '.[$p].e' "$CONFIG_PATH") \
        $(jq -r --arg p "$SELECTED_VAULT" '.[$p].m' "$CONFIG_PATH")
}

cryfs-vault-close() {
    cryfs-unmount \
        $(jq -r --arg p "$SELECTED_VAULT" '.[$p].m' "$CONFIG_PATH")
}

gocryptfs_vault_open() {
  gocryptfs -nodev -noexec -nosuid -acl -i 15m -ro -allow_other  $(jq -r --arg p "$SELECTED_VAULT" '.[$p].e' "$CONFIG_PATH") $(jq -r --arg p "$SELECTED_VAULT" '.[$p].m' "$CONFIG_PATH")
}

gocryptfs_vault_close() {
  fusermount -u \
        $(jq -r --arg p "$SELECTED_VAULT" '.[$p].m' "$CONFIG_PATH")
}

vault() {
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
