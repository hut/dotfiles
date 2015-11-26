#!/bin/sh

main() {
    get_payload | tar --extract --gzip
    payload/install_configs.sh
}
