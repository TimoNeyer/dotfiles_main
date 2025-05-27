#!/bin/env sh

DEFAULT_VAULT=cert
CONFIG_PATH=~/.config/zsh/functions/vaults.json
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
        $(jq -r --arg p "$SELECTED_VAULT" '.[$p].m // empty' "$CONFIG_PATH")
}

vault() {
    if [[ $# -eq 2 ]]; then
        SELECTED_VAULT="$2"
    elif [[ $# -eq 1 ]]; then
        SELECTED_VAULT=$DEFAULT_VAULT
    fi
    case $1 in
    "open")
        cryfs-vault-open $SELECTED_VAULT
        ;;
    "close")
        cryfs-vault-close $SELECTED_VAULT
        ;;
    *)
        echo "error: unkown option $1, [open|close] VAULTNAME"
        return 1
        ;;
    esac
}
