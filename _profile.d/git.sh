#!/usr/bin/env bash
# ex: ts=8 sw=4 sts=4 et filetype=sh
# -*- mode: shell-script; indent-tabs-mode: nil; sh-basic-offset: 4; -*-

# git coloring
command git config --global color.ui true

git() {
    local _GIT="command git"
    local command="$1"
    shift
    case "${command}" in
        a)    $_GIT add "$@";;
        all)  $_GIT add . "$@";;
        b)    $_GIT branch "$@";;
        ba)   $_GIT branch -a "$@";;
        co)   $_GIT checkout "$@";;
        cl)   $_GIT clone "$@";;
        c)    $_GIT commit -v "$@";;
        ca)   $_GIT commit -v -a "$@";;
        ci)   $_GIT commit --interactive "$@";;
        d)    $_GIT diff "$@";;
        dv)   $_GIT diff -w "$@";;
        l)    $_GIT pull "$@";;
        pr)   $_GIT pull --rebase "$@";;
        pp)   $_GIT pull && $_GIT push "$@";;
        up)   $_GIT fetch && $_GIT rebase "$@";;
        p)    $_GIT push "$@";;
        po)   $_GIT push origin "$@";;
        s|st) $_GIT status "$@";;
        ss)   $_GIT status -s "$@";;
        count) $_GIT shortlog -sn "$@";;
        cp)   $_GIT cherry-pick "$@";;
        export) $_GIT archive --format zip --output "$@";;
        del)  $_GIT branch -D "$@";;
        mu)   $_GIT fetch origin -v && $_GIT fetch upstream -v && $_GIT merge upstream/master;;
        sl)   $_GIT shortlog -sn "$@";;
        w)    $_GIT whatchanged "$@";;
        ll)   $_GIT log --graph --pretty=oneline --abbrev-commit "$@";;
        g)    $_GIT log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative "$@";;
        gs)   $_GIT log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative --stat "$@";;
        aliases)
            # Replaces __git_aliases sourced from bash-completion to include our aliases
            __git_aliases ()
            {
                echo "a all b ba co cl c ca cl ci d dv l pr pp up p po s st ss count cp export del mu sl w ll g gs"
                # One canonical list
                [ "-x" = "$1" ] && return 0;
                local i IFS=$'\n'
                for i in $(git --git-dir="$(__gitdir)" config --get-regexp "alias\..*" 2>/dev/null); do
                    case "$i" in
                        alias.*)
                            i="${i#alias.}"
                            echo "${i/ */}"
                            ;;
                    esac
                done
            }
            export __git_aliases
            for a in $(__git_aliases -x); do
                alias g${a}="git ${a}";
            done
            ;;
        *) $_GIT "$command" "$@";;
    esac
}

