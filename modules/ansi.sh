#!/usr/bin/env bash
#
# Copyright (c) 2015-2017 Vegard IT GmbH, http://vegardit.com
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# 
# @author Sebastian Thomschke, Vegard IT GmbH
# @author Patrick Spielmann, Vegard IT GmbH

#
# THIS FILE IS GENERATED BY BASH-FUNK GENERATOR
#
function -ansi-bold() {
    local opts=""
    local opt
    for opt in a e u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt ; $opts" || opts="set +$opt ; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail ; $opts" || opts="set +o pipefail ; $opts"
    for opt in nullglob extglob nocasematch nocaseglob ; do
        shopt -q $opt && opts="shopt -s $opt ; $opts" || opts="shopt -u $opt ; $opts"
    done

    set +auHt
    set -e
    set -o pipefail

    local __fn=${FUNCNAME[0]}
    __impl$__fn "$@" && local rc=0 || local rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]... [TEXT]"
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-ansi-bold() {
    [ -p /dev/stdout ] && __in_pipe=1 || true
    [ -t 1 ] || __in_subshell=1
    local __arg __optionWithValue __params=() __fn=${FUNCNAME[0]/__impl/} _on _off _help _selftest _TEXT
    for __arg in "$@"; do
        case $__arg in

            --help)
                echo "Usage: $__fn [OPTION]... [TEXT]"
                echo
                echo "Sets bold mode or prints the given text in bold."
                echo
                echo "Parameters:"
                echo -e "  \033[1mTEXT\033[22m "
                echo "      The text to print in bold."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --off\033[22m "
                echo "        Print the ANSI escape sequence that disables sets bold attribute."
                echo -e "\033[1m    --on\033[22m "
                echo "        Print the ANSI escape sequence that enables sets bold attribute."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                __stdout=$($__fn --help); __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> [31mFAILED[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> [32mOK[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;

            --on)
                _on=true
            ;;

            --off)
                _off=true
            ;;



            -*)
                echo "$__fn: invalid option: '$__arg'"
                return 64
              ;;

            *)
                case $__optionWithValue in
                    *)
                        __params+=("$__arg")
                esac
              ;;
        esac
    done

    for __param in "${__params[@]}"; do
        if [[ ! $_TEXT && ${#__params[@]} > 0 ]]; then
            _TEXT=$__param
            continue
        fi
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done


    if [[ $_TEXT ]]; then
        true
    fi


    ######################################################
if [[ $_TEXT ]]; then
    echo -ne "\033[1m$_TEXT\033[22m"
fi

if [[ $_on ]]; then
    echo -ne "\033[1m"
elif [[ $_off ]]; then
    echo -ne "\033[22m"
fi
}
function __complete-ansi-bold() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --on --off --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}ansi-bold -- ${BASH_FUNK_PREFIX:--}ansi-bold

function -ansi-colors-supported() {
    local opts=""
    local opt
    for opt in a e u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt ; $opts" || opts="set +$opt ; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail ; $opts" || opts="set +o pipefail ; $opts"
    for opt in nullglob extglob nocasematch nocaseglob ; do
        shopt -q $opt && opts="shopt -s $opt ; $opts" || opts="shopt -u $opt ; $opts"
    done

    set +auHt
    set -e
    set -o pipefail

    local __fn=${FUNCNAME[0]}
    __impl$__fn "$@" && local rc=0 || local rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]..."
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-ansi-colors-supported() {
    [ -p /dev/stdout ] && __in_pipe=1 || true
    [ -t 1 ] || __in_subshell=1
    local __arg __optionWithValue __params=() __fn=${FUNCNAME[0]/__impl/} _help _selftest
    for __arg in "$@"; do
        case $__arg in

            --help)
                echo "Usage: $__fn [OPTION]..."
                echo
                echo "Determines if ANSI color escape sequences are supported by the current terminal."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                __stdout=$($__fn --help); __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> [31mFAILED[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> [32mOK[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;



            -*)
                echo "$__fn: invalid option: '$__arg'"
                return 64
              ;;

            *)
                case $__optionWithValue in
                    *)
                        __params+=("$__arg")
                esac
              ;;
        esac
    done

    for __param in "${__params[@]}"; do
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done




    ######################################################
if hash tput &>/dev/null; then
    ncolors=$(tput colors)
    if [[ $ncolors -ge 8 ]]; then
        return 0
    else
        return 1
    fi

elif hash infocmp &>/dev/null; then
    infocmp $TERM 2>/dev/null | grep "colors#8" >/dev/null
    return

elif [[ $TERM == "cygwin" ]]; then
    return 0
fi

return 1
}
function __complete-ansi-colors-supported() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}ansi-colors-supported -- ${BASH_FUNK_PREFIX:--}ansi-colors-supported

function -ansi-reset() {
    local opts=""
    local opt
    for opt in a e u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt ; $opts" || opts="set +$opt ; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail ; $opts" || opts="set +o pipefail ; $opts"
    for opt in nullglob extglob nocasematch nocaseglob ; do
        shopt -q $opt && opts="shopt -s $opt ; $opts" || opts="shopt -u $opt ; $opts"
    done

    set +auHt
    set -e
    set -o pipefail

    local __fn=${FUNCNAME[0]}
    __impl$__fn "$@" && local rc=0 || local rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]..."
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-ansi-reset() {
    [ -p /dev/stdout ] && __in_pipe=1 || true
    [ -t 1 ] || __in_subshell=1
    local __arg __optionWithValue __params=() __fn=${FUNCNAME[0]/__impl/} _help _selftest
    for __arg in "$@"; do
        case $__arg in

            --help)
                echo "Usage: $__fn [OPTION]..."
                echo
                echo "Prints an ANSI escape sequence that reset all ANSI attributes."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                __stdout=$($__fn --help); __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> [31mFAILED[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> [32mOK[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;



            -*)
                echo "$__fn: invalid option: '$__arg'"
                return 64
              ;;

            *)
                case $__optionWithValue in
                    *)
                        __params+=("$__arg")
                esac
              ;;
        esac
    done

    for __param in "${__params[@]}"; do
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done




    ######################################################
echo -ne "\033[0m"
}
function __complete-ansi-reset() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}ansi-reset -- ${BASH_FUNK_PREFIX:--}ansi-reset

function -ansi-ul() {
    local opts=""
    local opt
    for opt in a e u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt ; $opts" || opts="set +$opt ; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail ; $opts" || opts="set +o pipefail ; $opts"
    for opt in nullglob extglob nocasematch nocaseglob ; do
        shopt -q $opt && opts="shopt -s $opt ; $opts" || opts="shopt -u $opt ; $opts"
    done

    set +auHt
    set -e
    set -o pipefail

    local __fn=${FUNCNAME[0]}
    __impl$__fn "$@" && local rc=0 || local rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]... [TEXT]"
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-ansi-ul() {
    [ -p /dev/stdout ] && __in_pipe=1 || true
    [ -t 1 ] || __in_subshell=1
    local __arg __optionWithValue __params=() __fn=${FUNCNAME[0]/__impl/} _on _off _help _selftest _TEXT
    for __arg in "$@"; do
        case $__arg in

            --help)
                echo "Usage: $__fn [OPTION]... [TEXT]"
                echo
                echo "Sets underlined mode or prints the given text underlined."
                echo
                echo "Parameters:"
                echo -e "  \033[1mTEXT\033[22m "
                echo "      The text to print underlined."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --off\033[22m "
                echo "        Print the ANSI escape sequence that disables sets underlined attribute."
                echo -e "\033[1m    --on\033[22m "
                echo "        Print the ANSI escape sequence that enables sets underlined attribute."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                __stdout=$($__fn --help); __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> [31mFAILED[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> [32mOK[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;

            --on)
                _on=true
            ;;

            --off)
                _off=true
            ;;



            -*)
                echo "$__fn: invalid option: '$__arg'"
                return 64
              ;;

            *)
                case $__optionWithValue in
                    *)
                        __params+=("$__arg")
                esac
              ;;
        esac
    done

    for __param in "${__params[@]}"; do
        if [[ ! $_TEXT && ${#__params[@]} > 0 ]]; then
            _TEXT=$__param
            continue
        fi
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done


    if [[ $_TEXT ]]; then
        true
    fi


    ######################################################
if [[ $_TEXT ]]; then
    echo -ne "\033[4m$_TEXT\033[24m"
fi

if [[ $_on ]]; then
    echo -ne "\033[4m"
elif [[ $_off ]]; then
    echo -ne "\033[24m"
fi
}
function __complete-ansi-ul() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --on --off --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}ansi-ul -- ${BASH_FUNK_PREFIX:--}ansi-ul

function -test-ansi() {
    local opts=""
    local opt
    for opt in a e u H t; do
        [[ $- =~ $opt ]] && opts="set -$opt ; $opts" || opts="set +$opt ; $opts"
    done
    shopt -q -o pipefail && opts="set -o pipefail ; $opts" || opts="set +o pipefail ; $opts"
    for opt in nullglob extglob nocasematch nocaseglob ; do
        shopt -q $opt && opts="shopt -s $opt ; $opts" || opts="shopt -u $opt ; $opts"
    done

    set +auHt
    set -e
    set -o pipefail

    local __fn=${FUNCNAME[0]}
    __impl$__fn "$@" && local rc=0 || local rc=$?

    if [[ $rc == 64 && -t 1 ]]; then
        echo; echo "Usage: $__fn [OPTION]..."
        echo; echo "Type '$__fn --help' for more details."
    fi

    eval $opts

    return $rc
}
function __impl-test-ansi() {
    [ -p /dev/stdout ] && __in_pipe=1 || true
    [ -t 1 ] || __in_subshell=1
    local __arg __optionWithValue __params=() __fn=${FUNCNAME[0]/__impl/} _help _selftest
    for __arg in "$@"; do
        case $__arg in

            --help)
                echo "Usage: $__fn [OPTION]..."
                echo
                echo "Performs a selftest of all functions of this module by executing each function with option '--selftest'."
                echo
                echo "Options:"
                echo -e "\033[1m    --help\033[22m "
                echo "        Prints this help."
                echo -e "\033[1m    --selftest\033[22m "
                echo "        Performs a self-test."
                echo
                return 0
              ;;

            --selftest)
                echo "Testing function [$__fn]..."
                echo -e "$ \033[1m$__fn --help\033[22m"
                __stdout=$($__fn --help); __rc=$?
                if [[ $__rc != 0 ]]; then echo -e "--> [31mFAILED[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
                echo -e "--> [32mOK[0m"
                echo "Testing function [$__fn]...DONE"
                return 0
              ;;



            -*)
                echo "$__fn: invalid option: '$__arg'"
                return 64
              ;;

            *)
                case $__optionWithValue in
                    *)
                        __params+=("$__arg")
                esac
              ;;
        esac
    done

    for __param in "${__params[@]}"; do
        echo "$__fn: Error: too many parameters: '$__param'"
        return 64
    done




    ######################################################
${BASH_FUNK_PREFIX:--}ansi-bold --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}ansi-colors-supported --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}ansi-reset --selftest && echo || return 1
${BASH_FUNK_PREFIX:--}ansi-ul --selftest && echo || return 1
}
function __complete-test-ansi() {
    local currentWord=${COMP_WORDS[COMP_CWORD]}
    if [[ ${currentWord} == -* ]]; then
        local options=" --help --selftest "
        for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
        COMPREPLY=($(compgen -o default -W '$options' -- $currentWord))
    else
        COMPREPLY=($(compgen -o default -- $currentWord))
    fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}test-ansi -- ${BASH_FUNK_PREFIX:--}test-ansi


function -help-ansi() {
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}ansi-bold [TEXT]\033[0m  -  Sets bold mode or prints the given text in bold."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}ansi-colors-supported\033[0m  -  Determines if ANSI color escape sequences are supported by the current terminal."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}ansi-reset\033[0m  -  Prints an ANSI escape sequence that reset all ANSI attributes."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}ansi-ul [TEXT]\033[0m  -  Sets underlined mode or prints the given text underlined."
    echo -e "\033[1m${BASH_FUNK_PREFIX:--}test-ansi\033[0m  -  Performs a selftest of all functions of this module by executing each function with option '--selftest'."

}
__BASH_FUNK_FUNCS+=( ansi-bold ansi-colors-supported ansi-reset ansi-ul test-ansi )
