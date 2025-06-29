#!/usr/bin/env bash

if pgrep "$1"; then
    pkill "$1"
else
    i3-msg "$(grep "exec --no-startup-id $1" .config/i3/config)"
fi
