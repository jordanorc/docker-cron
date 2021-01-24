#!/bin/bash
set -e

initialize_system() {
    if test -f /entrypoint.d/*; then
        . /entrypoint.d/*
    fi

    printenv >>/etc/environment
    echo -e "${CRONTAB_ENTRY}" | crontab -
    crontab -l
}

initialize_system

exec "$@"
