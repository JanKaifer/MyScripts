#! /bin/bash

NEW_WORKSPACE=$(get_next_workspace.sh $1)

i3-msg move container to workspace $NEW_WORKSPACE

