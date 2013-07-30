#!/usr/bin/env bash
# ex: ts=8 sw=4 sts=4 et filetype=sh
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-

# Assuming default download location to be "/home/user/dotfiles", but
# allow for override of default download location if MOPUB_DOTFILES
# environment variable is defined.
export DOTFILES="${MOPUB_DOTFILES:-${HOME}/dotfiles}"

# E.G. enable_sh_plugin git /home/user /home/common
enable_sh_plugin() {
    local PLUGIN="${1}"
    [ -z "${PLUGIN}" ] && return 1
    shift
    # If a list of "DOTFILES" locations are passed in, use them
    local DOTFILES=${@:-${DOTFILES}}
    local d
    for d in ${DOTFILES}; do
        if [ -r $d/profile.d/${PLUGIN}.sh ]; then
            . $d/profile.d/${PLUGIN}.sh
        fi
    done
}

# E.G. enable_sh_plugins "git vim" 
#      enable_sh_plugins "vim" /home/user
enable_sh_plugins() {
    local PLUGINS="${1}"
    [ -z "${PLUGINS}" ] && return 1
    shift
    local p
    for p in ${PLUGINS}; do
        enable_sh_plugin "${p}" "${@}"
    done
}

# E.G. enable_all_sh_plugins 
#      enable_all_sh_plugins /home/common
enable_all_sh_plugins() {
    local d
    [ -z "${@}" ] && eval set -- ${DOTFILES}
    for d in ${@}; do
        if [ -d ${d} ]; then
            local p
            for p in ${d}/profile.d/*.sh; do
                if [ -r $p ]; then
                    . $p
                fi
            done
        fi
    done
}

