#!/bin/sh
"$1"/tmux new -A -s "$("$("$1"/go env GOPATH)"/bin/random_name)"
