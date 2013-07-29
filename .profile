#!/usr/bin/env bash
# ex: ts=8 sw=4 sts=4 et filetype=sh
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-

# E.G. enable_sh_plugin git /home/user /home/common
enable_sh_plugin() {
    local PLUGIN="${1}"
    [ -z "${PLUGIN}" ] && return 1
    shift
    # If a list of "HOMES" are passed in, use them
    local HOME=${@:-${HOME}}
    local h
    for h in ${HOME}; do
        if [ -r $h/profile.d/${PLUGIN}.sh ]; then
            . $h/profile.d/${PLUGIN}.sh
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
    [ -z "${@}" ] && eval set -- ${HOME}
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

