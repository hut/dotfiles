#!/bin/sh
# Dependencies: i3-wm (duh), jq (for processing json)

get_current_workspace() {
    i3-msg -t get_workspaces | jq '.[] | select(.focused == true) | .name'
}

get_current_output() {
    i3-msg -t get_workspaces | jq '.[] | select(.focused == true) | .output'
}

get_workspace_names() {
    output="$1"
    if [ -n "$output" ]; then
        i3-msg -t get_workspaces | jq '.[] | select(.output == '"$output"') | .name'
    else
        i3-msg -t get_workspaces | jq '.[] | .name'
    fi
}

get_workspace_numbers() {
    output="$1"
    if [ -n "$output" ]; then
        i3-msg -t get_workspaces | jq '.[] | select(.output == '"$output"') | .num'
    else
        i3-msg -t get_workspaces | jq '.[] | .num'
    fi
}

set_workspace() {
    i3-msg workspace "$1"
}

get_unused_workspace() {
    i=1
    for workspace in $(get_workspace_numbers); do
        if [ "$workspace" != "$i" ]; then
            echo "$i"
            return
        fi
        i="$((i+1))"
    done
    echo "$i"
}

get_next_workspace() {
    max="$1"
    found=
    first=
    current="$(get_current_workspace)"
    for workspace in $(get_workspace_numbers "$(get_current_output)"); do
        [ -n "$max" ] && [ "$workspace" -ge "$max" ] && break
        [ -z "$first" ] && first="$workspace"
        if [ -n "$found" ]; then
            echo "$workspace"
            return
        fi
        [ "$workspace" == "$current" ] && found=y
    done
    echo "$first"
}

case "$1" in
    current) get_current_workspace;;
    numbers) get_workspace_numbers;;
    new_workspace) set_workspace "$(get_unused_workspace)";;
    *) i3-msg -t get_workspaces | jq;;
#        max="$2"
#        first=
#        found=
#        test -z "$max" && max=10
#        for workspace in $(get_workspace_numbers); do
#            if [ -n "$found" ]; then
#                set_workspace "$workspace"
#                exit
#            fi
#        done
#        get_workspace_numbers "$(get_current_output)"
#        ;;
esac
