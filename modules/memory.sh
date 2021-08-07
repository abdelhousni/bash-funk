#!/usr/bin/env bash
#
# Copyright 2015-2021 by Vegard IT GmbH (https://vegardit.com)
# SPDX-License-Identifier: Apache-2.0
#
# @author Sebastian Thomschke, Vegard IT GmbH
# @author Patrick Spielmann, Vegard IT GmbH
#
# THIS FILE IS GENERATED BY BASH-FUNK GENERATOR
#
# documentation: https://github.com/vegardit/bash-funk/tree/master/docs/memory.md
#

function -alloc-mem() {
   local opts="" opt rc __fn=${FUNCNAME[0]}
   for opt in a u H t; do
      [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
   done
   shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
   for opt in nullglob extglob nocasematch nocaseglob; do
      shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
   done

   set +auHt -o pipefail

   __impl$__fn "$@" && rc=0 || rc=$?

   if [[ $rc == 64 && -t 1 ]]; then
      echo -e "\nUsage: $__fn [OPTION]... MEMORY_IN_MB\n\nType '$__fn --help' for more details."
   fi
   eval $opts
   return $rc
}
function __impl-alloc-mem() {
   local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest _MEMORY_IN_MB
   [ -t 1 ] && __interactive=1 || true
         for __arg in "$@"; do
         case "$__arg" in
            --) __noMoreFlags=1; __args+=("--") ;;
            -|--*) __args+=("$__arg") ;;
            -*) [[ $__noMoreFlags == "1" ]] && __args+=("$__arg") || for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
         esac
      done
   for __arg in "${__args[@]}"; do
      if [[ $__optionWithValue == "--" ]]; then
         __params+=("$__arg")
         continue
      fi
      case "$__arg" in

         --help)
            echo "Usage: $__fn [OPTION]... MEMORY_IN_MB"
            echo
            echo "Allocates the given amount of RAM."
            echo
            echo "Requirements:"
            echo "  + Command 'python' must be available."
            echo
            echo "Parameters:"
            echo -e "  \033[1mMEMORY_IN_MB\033[22m (required, integer: 1-?)"
            echo "      Amount of RAM in MB to allocate."
            echo
            echo "Options:"
            echo -e "\033[1m    --help\033[22m"
            echo "        Prints this help."
            echo -e "\033[1m    --selftest\033[22m"
            echo "        Performs a self-test."
            echo -e "    \033[1m--\033[22m"
            echo "        Terminates the option list."
            echo
            return 0
           ;;

         --selftest)
            echo "Testing function [$__fn]..."
            echo -e "$ \033[1m$__fn --help\033[22m"
            local __stdout __rc
            __stdout="$($__fn --help)"; __rc=$?
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo "Testing function [$__fn]...DONE"
            return 0
           ;;

         --)
            __optionWithValue="--"
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
      if [[ ! $_MEMORY_IN_MB ]]; then
         _MEMORY_IN_MB=$__param
         continue
      fi
      echo "$__fn: Error: too many parameters: '$__param'"
      return 64
   done

   if [[ $_MEMORY_IN_MB ]]; then
      if [[ ! "$_MEMORY_IN_MB" =~ ^-?[0-9]*$ ]]; then echo "$__fn: Error: Value '$_MEMORY_IN_MB' for parameter MEMORY_IN_MB is not a numeric value."; return 64; fi
      if [[ $_MEMORY_IN_MB -lt 1 ]]; then echo "$__fn: Error: Value '$_MEMORY_IN_MB' for parameter MEMORY_IN_MB is too low. Must be >= 1."; return 64; fi
   else
      echo "$__fn: Error: Parameter MEMORY_IN_MB must be specified."; return 64
   fi

   if ! hash "python" &>/dev/null; then echo "$__fn: Error: Required command 'python' not found on this system."; return 64; fi

####### alloc-mem ####### START
echo -n "Allocating ${_MEMORY_IN_MB} MB of memory (may take a moment)..."
python -c "
a='1'*1024*1024*${_MEMORY_IN_MB}
print('DONE')
raw_input('Press enter to exit...')
"
####### alloc-mem ####### END
}
function __complete-alloc-mem() {
   local curr=${COMP_WORDS[COMP_CWORD]}
   if [[ ${curr} == -* ]]; then
      local options=" --help "
      for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
      COMPREPLY=($(compgen -o default -W '$options' -- $curr))
   else
      COMPREPLY=($(compgen -o default -- $curr))
   fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}alloc-mem -- ${BASH_FUNK_PREFIX:--}alloc-mem

if [ -e /proc/meminfo ]; then
function -memfree() {
   local opts="" opt rc __fn=${FUNCNAME[0]}
   for opt in a u H t; do
      [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
   done
   shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
   for opt in nullglob extglob nocasematch nocaseglob; do
      shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
   done

   set +auHt -o pipefail

   __impl$__fn "$@" && rc=0 || rc=$?

   if [[ $rc == 64 && -t 1 ]]; then
      echo -e "\nUsage: $__fn [OPTION]... [MEMORY_UNIT]\n\nType '$__fn --help' for more details."
   fi
   eval $opts
   return $rc
}
function __impl-memfree() {
   local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest _MEMORY_UNIT
   [ -t 1 ] && __interactive=1 || true
         for __arg in "$@"; do
         case "$__arg" in
            --) __noMoreFlags=1; __args+=("--") ;;
            -|--*) __args+=("$__arg") ;;
            -*) [[ $__noMoreFlags == "1" ]] && __args+=("$__arg") || for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
         esac
      done
   for __arg in "${__args[@]}"; do
      if [[ $__optionWithValue == "--" ]]; then
         __params+=("$__arg")
         continue
      fi
      case "$__arg" in

         --help)
            echo "Usage: $__fn [OPTION]... [MEMORY_UNIT]"
            echo
            echo "Prints the free memory (in KB by default)."
            echo
            echo "Parameters:"
            echo -e "  \033[1mMEMORY_UNIT\033[22m (default: 'KB', one of: [KB,MB,GB])"
            echo "      The memory unit of the printed value."
            echo
            echo "Options:"
            echo -e "\033[1m    --help\033[22m"
            echo "        Prints this help."
            echo -e "\033[1m    --selftest\033[22m"
            echo "        Performs a self-test."
            echo -e "    \033[1m--\033[22m"
            echo "        Terminates the option list."
            echo
            echo "Examples:"
            echo -e "$ \033[1m$__fn \033[22m"
            echo "1036560"
            echo -e "$ \033[1m$__fn MB\033[22m"
            echo "1012"
            echo -e "$ \033[1m$__fn GB\033[22m"
            echo "1"
            echo
            return 0
           ;;

         --selftest)
            echo "Testing function [$__fn]..."
            echo -e "$ \033[1m$__fn --help\033[22m"
            local __stdout __rc
            __stdout="$($__fn --help)"; __rc=$?
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo -e "$ \033[1m$__fn \033[22m"
            __stdout="$($__fn )"; __rc=$?
            echo "$__stdout"
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            __regex="^[0-9]+$"
            if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[0-9]+]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo -e "$ \033[1m$__fn MB\033[22m"
            __stdout="$($__fn MB)"; __rc=$?
            echo "$__stdout"
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            __regex="^[0-9]+$"
            if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[0-9]+]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo -e "$ \033[1m$__fn GB\033[22m"
            __stdout="$($__fn GB)"; __rc=$?
            echo "$__stdout"
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            __regex="^[0-9]+$"
            if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[0-9]+]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo "Testing function [$__fn]...DONE"
            return 0
           ;;

         --)
            __optionWithValue="--"
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
      if [[ ! $_MEMORY_UNIT && ${#__params[@]} > 0 ]]; then
         _MEMORY_UNIT=$__param
         continue
      fi
      echo "$__fn: Error: too many parameters: '$__param'"
      return 64
   done

   if [[ ! $_MEMORY_UNIT ]]; then _MEMORY_UNIT="KB"; fi

   if [[ $_MEMORY_UNIT ]]; then
      if [[ $_MEMORY_UNIT != 'KB' && $_MEMORY_UNIT != 'MB' && $_MEMORY_UNIT != 'GB' ]]; then echo "$__fn: Error: Value '$_MEMORY_UNIT' for parameter MEMORY_UNIT is not one of the allowed values [KB,MB,GB]."; return 64; fi
   fi

####### memfree ####### START
local totalMem=$(awk '/MemFree/ {print $2}' /proc/meminfo)
local totalMemUnit=$(awk '/MemFree/ {print $3}' /proc/meminfo)

case ${totalMemUnit} in
   [Kk][Bb]) local memTotalKB=$totalMem ;;
   [Mm][Bb]) local memTotalKB=$(( totalMem * 1024 )) ;;
   [Gg][Bb]) local memTotalKB=$(( totalMem * 1024 * 1024 )) ;;
   *) echo "$__fn: Error: Unsupported memory unit ${totalMemUnit} encountered."
      return 1
     ;;
esac

case $_MEMORY_UNIT in
   KB) echo $memTotalKB ;;
   MB) echo $(( memTotalKB / 1024 )) ;;
   GB) echo $(( memTotalKB / 1024 / 1024 )) ;;
esac
####### memfree ####### END
}
function __complete-memfree() {
   local curr=${COMP_WORDS[COMP_CWORD]}
   if [[ ${curr} == -* ]]; then
      local options=" --help "
      for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
      COMPREPLY=($(compgen -o default -W '$options' -- $curr))
   else
      COMPREPLY=($(compgen -o default -- $curr))
   fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}memfree -- ${BASH_FUNK_PREFIX:--}memfree
fi

if [ -e /proc/meminfo ]; then
function -meminfo() {
   local opts="" opt rc __fn=${FUNCNAME[0]}
   for opt in a u H t; do
      [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
   done
   shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
   for opt in nullglob extglob nocasematch nocaseglob; do
      shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
   done

   set +auHt -o pipefail

   __impl$__fn "$@" && rc=0 || rc=$?

   if [[ $rc == 64 && -t 1 ]]; then
      echo -e "\nUsage: $__fn [OPTION]...\n\nType '$__fn --help' for more details."
   fi
   eval $opts
   return $rc
}
function __impl-meminfo() {
   local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest
   [ -t 1 ] && __interactive=1 || true
         for __arg in "$@"; do
         case "$__arg" in
            --) __noMoreFlags=1; __args+=("--") ;;
            -|--*) __args+=("$__arg") ;;
            -*) [[ $__noMoreFlags == "1" ]] && __args+=("$__arg") || for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
         esac
      done
   for __arg in "${__args[@]}"; do
      if [[ $__optionWithValue == "--" ]]; then
         __params+=("$__arg")
         continue
      fi
      case "$__arg" in

         --help)
            echo "Usage: $__fn [OPTION]..."
            echo
            echo "Prints memory information from /proc/meminfo."
            echo
            echo "Options:"
            echo -e "\033[1m    --help\033[22m"
            echo "        Prints this help."
            echo -e "\033[1m    --selftest\033[22m"
            echo "        Performs a self-test."
            echo -e "    \033[1m--\033[22m"
            echo "        Terminates the option list."
            echo
            echo "Examples:"
            echo -e "$ \033[1m$__fn \033[22m"
            echo "MemTotal:       24689452 kB
MemFree:        13713796 kB
MemAvailable:   16143004 kB
..."
            echo
            return 0
           ;;

         --selftest)
            echo "Testing function [$__fn]..."
            echo -e "$ \033[1m$__fn --help\033[22m"
            local __stdout __rc
            __stdout="$($__fn --help)"; __rc=$?
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo -e "$ \033[1m$__fn \033[22m"
            __stdout="$($__fn )"; __rc=$?
            echo "$__stdout"
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            __regex="^.*MemTotal.*MemFree.*$"
            if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [.*MemTotal.*MemFree.*]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo "Testing function [$__fn]...DONE"
            return 0
           ;;

         --)
            __optionWithValue="--"
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

####### meminfo ####### START
cat /proc/meminfo
####### meminfo ####### END
}
function __complete-meminfo() {
   local curr=${COMP_WORDS[COMP_CWORD]}
   if [[ ${curr} == -* ]]; then
      local options=" --help "
      for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
      COMPREPLY=($(compgen -o default -W '$options' -- $curr))
   else
      COMPREPLY=($(compgen -o default -- $curr))
   fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}meminfo -- ${BASH_FUNK_PREFIX:--}meminfo
fi

if [ -e /proc/meminfo ]; then
function -memtotal() {
   local opts="" opt rc __fn=${FUNCNAME[0]}
   for opt in a u H t; do
      [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
   done
   shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
   for opt in nullglob extglob nocasematch nocaseglob; do
      shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
   done

   set +auHt -o pipefail

   __impl$__fn "$@" && rc=0 || rc=$?

   if [[ $rc == 64 && -t 1 ]]; then
      echo -e "\nUsage: $__fn [OPTION]... [MEMORY_UNIT]\n\nType '$__fn --help' for more details."
   fi
   eval $opts
   return $rc
}
function __impl-memtotal() {
   local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest _MEMORY_UNIT
   [ -t 1 ] && __interactive=1 || true
         for __arg in "$@"; do
         case "$__arg" in
            --) __noMoreFlags=1; __args+=("--") ;;
            -|--*) __args+=("$__arg") ;;
            -*) [[ $__noMoreFlags == "1" ]] && __args+=("$__arg") || for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
         esac
      done
   for __arg in "${__args[@]}"; do
      if [[ $__optionWithValue == "--" ]]; then
         __params+=("$__arg")
         continue
      fi
      case "$__arg" in

         --help)
            echo "Usage: $__fn [OPTION]... [MEMORY_UNIT]"
            echo
            echo "Prints the total memory (in KB by default)."
            echo
            echo "Parameters:"
            echo -e "  \033[1mMEMORY_UNIT\033[22m (default: 'KB', one of: [KB,MB,GB])"
            echo "      The memory unit of the printed value."
            echo
            echo "Options:"
            echo -e "\033[1m    --help\033[22m"
            echo "        Prints this help."
            echo -e "\033[1m    --selftest\033[22m"
            echo "        Performs a self-test."
            echo -e "    \033[1m--\033[22m"
            echo "        Terminates the option list."
            echo
            echo "Examples:"
            echo -e "$ \033[1m$__fn \033[22m"
            echo "1036560"
            echo -e "$ \033[1m$__fn MB\033[22m"
            echo "1012"
            echo -e "$ \033[1m$__fn GB\033[22m"
            echo "1"
            echo
            return 0
           ;;

         --selftest)
            echo "Testing function [$__fn]..."
            echo -e "$ \033[1m$__fn --help\033[22m"
            local __stdout __rc
            __stdout="$($__fn --help)"; __rc=$?
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo -e "$ \033[1m$__fn \033[22m"
            __stdout="$($__fn )"; __rc=$?
            echo "$__stdout"
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            __regex="^[0-9]+$"
            if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[0-9]+]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo -e "$ \033[1m$__fn MB\033[22m"
            __stdout="$($__fn MB)"; __rc=$?
            echo "$__stdout"
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            __regex="^[0-9]+$"
            if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[0-9]+]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo -e "$ \033[1m$__fn GB\033[22m"
            __stdout="$($__fn GB)"; __rc=$?
            echo "$__stdout"
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            __regex="^[0-9]+$"
            if [[ ! "$__stdout" =~ $__regex ]]; then echo -e "--> \033[31mFAILED\033[0m - stdout [$__stdout] does not match required pattern [[0-9]+]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo "Testing function [$__fn]...DONE"
            return 0
           ;;

         --)
            __optionWithValue="--"
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
      if [[ ! $_MEMORY_UNIT && ${#__params[@]} > 0 ]]; then
         _MEMORY_UNIT=$__param
         continue
      fi
      echo "$__fn: Error: too many parameters: '$__param'"
      return 64
   done

   if [[ ! $_MEMORY_UNIT ]]; then _MEMORY_UNIT="KB"; fi

   if [[ $_MEMORY_UNIT ]]; then
      if [[ $_MEMORY_UNIT != 'KB' && $_MEMORY_UNIT != 'MB' && $_MEMORY_UNIT != 'GB' ]]; then echo "$__fn: Error: Value '$_MEMORY_UNIT' for parameter MEMORY_UNIT is not one of the allowed values [KB,MB,GB]."; return 64; fi
   fi

####### memtotal ####### START
local totalMem=$(awk '/MemTotal/ {print $2}' /proc/meminfo)
local totalMemUnit=$(awk '/MemTotal/ {print $3}' /proc/meminfo)

case ${totalMemUnit} in
   [Kk][Bb]) local memTotalKB=$totalMem ;;
   [Mm][Bb]) local memTotalKB=$(( totalMem * 1024 )) ;;
   [Gg][Bb]) local memTotalKB=$(( totalMem * 1024 * 1024 )) ;;
   *) echo "$__fn: Error: Unsupported memory unit ${totalMemUnit} encountered."
      return 1
     ;;
esac

case $_MEMORY_UNIT in
   KB) echo $memTotalKB ;;
   MB) echo $(( memTotalKB / 1024 )) ;;
   GB) echo $(( memTotalKB / 1024 / 1024 )) ;;
esac
####### memtotal ####### END
}
function __complete-memtotal() {
   local curr=${COMP_WORDS[COMP_CWORD]}
   if [[ ${curr} == -* ]]; then
      local options=" --help "
      for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
      COMPREPLY=($(compgen -o default -W '$options' -- $curr))
   else
      COMPREPLY=($(compgen -o default -- $curr))
   fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}memtotal -- ${BASH_FUNK_PREFIX:--}memtotal
fi

function -procmem() {
   local opts="" opt rc __fn=${FUNCNAME[0]}
   for opt in a u H t; do
      [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
   done
   shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
   for opt in nullglob extglob nocasematch nocaseglob; do
      shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
   done

   set +auHt -o pipefail

   __impl$__fn "$@" && rc=0 || rc=$?

   if [[ $rc == 64 && -t 1 ]]; then
      echo -e "\nUsage: $__fn [OPTION]...\n\nType '$__fn --help' for more details."
   fi
   eval $opts
   return $rc
}
function __impl-procmem() {
   local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _group _color _help _selftest
   [ -t 1 ] && __interactive=1 || true
         for __arg in "$@"; do
         case "$__arg" in
            --) __noMoreFlags=1; __args+=("--") ;;
            -|--*) __args+=("$__arg") ;;
            -*) [[ $__noMoreFlags == "1" ]] && __args+=("$__arg") || for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
         esac
      done
   for __arg in "${__args[@]}"; do
      if [[ $__optionWithValue == "--" ]]; then
         __params+=("$__arg")
         continue
      fi
      case "$__arg" in

         --help)
            echo "Usage: $__fn [OPTION]..."
            echo
            echo "Prints memory consumption information of all running processes."
            echo
            echo "Options:"
            echo -e "\033[1m    --color [WHEN]\033[22m (default: 'auto', one of: [always,auto,never])"
            echo "        Indicates when to colorize the output."
            echo -e "\033[1m-g, --group\033[22m"
            echo "        Group memory usage of same processes."
            echo "    -----------------------------"
            echo -e "\033[1m    --help\033[22m"
            echo "        Prints this help."
            echo -e "\033[1m    --selftest\033[22m"
            echo "        Performs a self-test."
            echo -e "    \033[1m--\033[22m"
            echo "        Terminates the option list."
            echo
            return 0
           ;;

         --selftest)
            echo "Testing function [$__fn]..."
            echo -e "$ \033[1m$__fn --help\033[22m"
            local __stdout __rc
            __stdout="$($__fn --help)"; __rc=$?
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo "Testing function [$__fn]...DONE"
            return 0
           ;;

         --group|-g)
            _group=1
         ;;

         --color)
            _color="auto"
            __optionWithValue=color
         ;;

         --)
            __optionWithValue="--"
           ;;
         -*)
            echo "$__fn: invalid option: '$__arg'"
            return 64
           ;;

         *)
            case $__optionWithValue in
               color)
                  _color=$__arg
                  __optionWithValue=
                 ;;
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

   if [[ $_color ]]; then
      if [[ $_color == "@@##@@" ]]; then echo "$__fn: Error: Value WHEN for option --color must be specified."; return 64; fi
      if [[ $_color != 'always' && $_color != 'auto' && $_color != 'never' ]]; then echo "$__fn: Error: Value '$_color' for option --color is not one of the allowed values [always,auto,never]."; return 64; fi
   fi

####### procmem ####### START
if [[ $_group ]]; then

   echo "  PHYS. MEM   VIRT. MEM  USER     #  PROCESS"
   local mem1 mem2 usr cmd prev_mem1 prev_mem2 prev_usr prev_cmd prev_count
   (ps -eww -o rss,vsize,user,args --sort=+user,+args | tail -n +1 | while read mem1 mem2 usr cmd; do
      if [[ $prev_usr == $usr && $prev_cmd == $cmd ]]; then
         prev_mem1=$((prev_mem1 + mem1))
         prev_mem2=$((prev_mem1 + mem2))
         prev_count=$(( prev_count + 1 ))
      else
         if [[ -n $prev_cmd ]]; then
            printf "%5d.%02d MB " $((prev_mem1/1024 )) $(( (prev_mem1*100/1024) - (prev_mem1/1024*100) ))
            printf "%5d.%02d MB " $((prev_mem2/1024 )) $(( (prev_mem2*100/1024) - (prev_mem2/1024*100) ))
            printf "%-8s " $prev_usr
            printf "%2sx " $prev_count
            echo "$prev_cmd"
         fi
         prev_usr=$usr
         prev_mem1=$mem1
         prev_mem2=$mem2
         prev_cmd=$cmd
         prev_count=1
      fi
   done && (
      printf "%5d.%02d MB " $((prev_mem1/1024 )) $(( (prev_mem1*100/1024) - (prev_mem1/1024*100) ))
      printf "%5d.%02d MB " $((prev_mem2/1024 )) $(( (prev_mem2*100/1024) - (prev_mem2/1024*100) ))
      printf " %-8s " $prev_usr
      printf "%2sx $prev_cmd\n" $prev_count
   )) | grep -v "0.00 MB"| sort -h | ${BASH_FUNK_PREFIX:--}ansi-alternate --color ${_color:-auto}

else

   echo "  PHYS. MEM   VIRT. MEM    PID  USER     PROCESS"
   local mem1 mem2 pid usr cmd
   ps -eww -o rss,vsize,pid,user,args --sort=+rss,+args | tail -n +1 | while read mem1 mem2 pid usr cmd; do
      if [[ mem2 -gt 0 ]]; then
         printf "%5d.%02d MB " $((mem1/1024 )) $(( (mem1*100/1024) - (mem1/1024*100) ))
         printf "%5d.%02d MB " $((mem2/1024 )) $(( (mem2*100/1024) - (mem2/1024*100) ))
         printf "%6d  " $pid
         printf "%-8s " $usr
         echo "$cmd"
      fi
   done | ${BASH_FUNK_PREFIX:--}ansi-alternate --color ${_color:-auto}

fi
####### procmem ####### END
}
function __complete-procmem() {
   local curr=${COMP_WORDS[COMP_CWORD]}
   if [[ ${curr} == -* ]]; then
      local options=" --group -g --color --help "
      for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
      COMPREPLY=($(compgen -o default -W '$options' -- $curr))
   else
      local prev="${COMP_WORDS[COMP_CWORD-1]}"
      case $prev in
         --color)
            COMPREPLY=($(compgen -o default -W "always
auto
never" -- $curr))
              ;;
         *)
            COMPREPLY=($(compgen -o default -- $curr))
           ;;
      esac
   fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}procmem -- ${BASH_FUNK_PREFIX:--}procmem

function -test-all-memory() {
   local opts="" opt rc __fn=${FUNCNAME[0]}
   for opt in a u H t; do
      [[ $- =~ $opt ]] && opts="set -$opt; $opts" || opts="set +$opt; $opts"
   done
   shopt -q -o pipefail && opts="set -o pipefail; $opts" || opts="set +o pipefail; $opts"
   for opt in nullglob extglob nocasematch nocaseglob; do
      shopt -q $opt && opts="shopt -s $opt; $opts" || opts="shopt -u $opt; $opts"
   done

   set +auHt -o pipefail

   __impl$__fn "$@" && rc=0 || rc=$?

   if [[ $rc == 64 && -t 1 ]]; then
      echo -e "\nUsage: $__fn [OPTION]...\n\nType '$__fn --help' for more details."
   fi
   eval $opts
   return $rc
}
function __impl-test-all-memory() {
   local __args=() __arg __idx __noMoreFlags __optionWithValue __params=() __interactive __fn=${FUNCNAME[0]/__impl/} _help _selftest
   [ -t 1 ] && __interactive=1 || true
         for __arg in "$@"; do
         case "$__arg" in
            --) __noMoreFlags=1; __args+=("--") ;;
            -|--*) __args+=("$__arg") ;;
            -*) [[ $__noMoreFlags == "1" ]] && __args+=("$__arg") || for ((__idx=1; __idx<${#__arg}; __idx++)); do __args+=("-${__arg:$__idx:1}"); done ;;
            *) __args+=("$__arg") ;;
         esac
      done
   for __arg in "${__args[@]}"; do
      if [[ $__optionWithValue == "--" ]]; then
         __params+=("$__arg")
         continue
      fi
      case "$__arg" in

         --help)
            echo "Usage: $__fn [OPTION]..."
            echo
            echo "Performs a selftest of all functions of this module by executing each function with option '--selftest'."
            echo
            echo "Options:"
            echo -e "\033[1m    --help\033[22m"
            echo "        Prints this help."
            echo -e "\033[1m    --selftest\033[22m"
            echo "        Performs a self-test."
            echo -e "    \033[1m--\033[22m"
            echo "        Terminates the option list."
            echo
            return 0
           ;;

         --selftest)
            echo "Testing function [$__fn]..."
            echo -e "$ \033[1m$__fn --help\033[22m"
            local __stdout __rc
            __stdout="$($__fn --help)"; __rc=$?
            if [[ $__rc != 0 ]]; then echo -e "--> \033[31mFAILED\033[0m - exit code [$__rc] instead of expected [0]."; return 64; fi
            echo -e "--> \033[32mOK\033[0m"
            echo "Testing function [$__fn]...DONE"
            return 0
           ;;

         --)
            __optionWithValue="--"
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

####### test-all-memory ####### START
${BASH_FUNK_PREFIX:--}alloc-mem --selftest && echo || return 1
if [ -e /proc/meminfo ]; then ${BASH_FUNK_PREFIX:--}memfree --selftest && echo || return 1; fi
if [ -e /proc/meminfo ]; then ${BASH_FUNK_PREFIX:--}meminfo --selftest && echo || return 1; fi
if [ -e /proc/meminfo ]; then ${BASH_FUNK_PREFIX:--}memtotal --selftest && echo || return 1; fi
${BASH_FUNK_PREFIX:--}procmem --selftest && echo || return 1
####### test-all-memory ####### END
}
function __complete-test-all-memory() {
   local curr=${COMP_WORDS[COMP_CWORD]}
   if [[ ${curr} == -* ]]; then
      local options=" --help "
      for o in "${COMP_WORDS[@]}"; do options=${options/ $o / }; done
      COMPREPLY=($(compgen -o default -W '$options' -- $curr))
   else
      COMPREPLY=($(compgen -o default -- $curr))
   fi
}
complete -F __complete${BASH_FUNK_PREFIX:--}test-all-memory -- ${BASH_FUNK_PREFIX:--}test-all-memory


function -help-memory() {
   local p="\033[1m${BASH_FUNK_PREFIX:--}"
   echo -e "${p}alloc-mem MEMORY_IN_MB\033[0m  -  Allocates the given amount of RAM."
   echo -e "${p}memfree [MEMORY_UNIT]\033[0m  -  Prints the free memory (in KB by default)."
   echo -e "${p}meminfo\033[0m  -  Prints memory information from /proc/meminfo."
   echo -e "${p}memtotal [MEMORY_UNIT]\033[0m  -  Prints the total memory (in KB by default)."
   echo -e "${p}procmem\033[0m  -  Prints memory consumption information of all running processes."
   echo -e "${p}test-all-memory\033[0m  -  Performs a selftest of all functions of this module by executing each function with option '--selftest'."
}
if [ -e /proc/meminfo ]; then __BASH_FUNK_FUNCS+=( memfree ); fi
if [ -e /proc/meminfo ]; then __BASH_FUNK_FUNCS+=( meminfo ); fi
if [ -e /proc/meminfo ]; then __BASH_FUNK_FUNCS+=( memtotal ); fi
__BASH_FUNK_FUNCS+=( alloc-mem procmem test-all-memory )
