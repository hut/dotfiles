#!/bin/sh

main() {
    dir="$(mktemp -d hut_deploy_XXXXXXXXX)"
    cd "$dir" || exit 1
    get_payload | tar --extract --gzip
}
