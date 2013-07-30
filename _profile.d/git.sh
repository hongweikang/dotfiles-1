#!/usr/bin/env bash
# ex: ts=8 sw=4 sts=4 et filetype=sh
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-

g() {
    echo "git $@"
}

git_aliases() {
    alias gs="g s"
}

