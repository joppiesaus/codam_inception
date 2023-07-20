#!/usr/bin/env bash

# run ./expand_vars.sh <file>, this will return the file with
# environment variables expanded. Might be dangerous because
# it uses ``eval", but it works.

# Source: https://stackoverflow.com/a/20316582
declare file="$1"
declare data=$(< "$file")
declare delimiter="__apply_shell_expansion_delimiter__"
declare command="cat <<$delimiter"$'\n'"$data"$'\n'"$delimiter"
eval "$command"
