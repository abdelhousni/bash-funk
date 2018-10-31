# Bash-Funk "compression" module

[//]: # (THIS FILE IS GENERATED BY BASH-FUNK GENERATOR)

The following statements are automatically executed when this module loads:

```bash
alias -- -tgz="-tar-gz"
alias -- -tzst="-tar-zstd"
alias -- -utgz="-untar-gz"
alias -- -utzst="-untar-zstd"
```

The following commands are available when this module is loaded:

1. [-tar-gz](#-tar-gz)
1. [-tar-zstd](#-tar-zstd)
1. [-test-compression](#-test-compression)
1. [-untar-gz](#-untar-gz)
1. [-untar-zstd](#-untar-zstd)


## <a name="license"></a>License

Copyright 2015-2018 by Vegard IT GmbH, Germany, https://vegardit.com
SPDX-License-Identifier: Apache-2.0

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


## <a name="-tar-gz"></a>-tar-gz

```
Usage: -tar-gz [OPTION]... ARCHIVE PATH1 [PATH]...

Compresses the given files using tar and gzip displaying a real-time progress bar.

Requirements:
  + Command 'cut' must be available.
  + Command 'du' must be available.
  + Command 'tail' must be available.
  + Command 'tar' must be available.
  + Command 'gzip' must be available.

Parameters:
  ARCHIVE (required, file)
      The file path of the archive to create.
  PATH (1 or more required, path)
      Files and directories to compress.

Options:
    --checkpoint 
        Use tar's --checkpoint feature instead of pv for progress monitoring. This is considerably slower in Cygwin.
    -----------------------------
    --help 
        Prints this help.
    --selftest 
        Performs a self-test.
    --
        Terminates the option list.
```

*Implementation:*
```bash
if hash pv && [[ ! $_checkpoint ]]; then
    local total_bytes=$(du -csb "${_PATH[@]}" | tail -1 | cut -f1) &&
    tar -cf - "${_PATH[@]}" | pv -s $total_bytes | gzip > "$_ARCHIVE"
else
    printf '=> %s\n' "${_PATH[@]}"
    local total_kb=$(du -csk "${_PATH[@]}" | tail -1 | cut -f1) &&
    tar cfvz "${_ARCHIVE}" "${_PATH[@]}" --record-size=1K --checkpoint="$(($total_kb/100))" --checkpoint-action=exec=" printf '%3d/100%%\r' \$((100*\$TAR_CHECKPOINT/$total_kb)) " --totals
fi
```


## <a name="-tar-zstd"></a>-tar-zstd

```
Usage: -tar-zstd [OPTION]... ARCHIVE PATH1 [PATH]...

Compresses the given files using tar and zstd (https://github.com/facebook/zstd) displaying a real-time progress bar.

Requirements:
  + Command 'cut' must be available.
  + Command 'du' must be available.
  + Command 'tail' must be available.
  + Command 'tar' must be available.
  + Command 'zstd' must be available.

Parameters:
  ARCHIVE (required, file)
      The file path of the archive to create.
  PATH (1 or more required, path)
      Files and directories to compress.

Options:
    --checkpoint 
        Use tar's --checkpoint feature instead of pv for progress monitoring. This is considerably slower in Cygwin.
    -----------------------------
    --help 
        Prints this help.
    --selftest 
        Performs a self-test.
    --
        Terminates the option list.
```

*Implementation:*
```bash
if hash pv && [[ ! $_checkpoint ]]; then
    printf '=> %s\n' "${_PATH[@]}"
    local total_bytes=$(du -csb "${_PATH[@]}" | tail -1 | cut -f1) &&
    tar -cf - "${_PATH[@]}" | pv -s $total_bytes | zstd > "$_ARCHIVE"
else
    local total_kb=$(du -csk "${_PATH[@]}" | tail -1 | cut -f1) &&
    tar cfv "${_ARCHIVE}" "${_PATH[@]}" -Izstd --record-size=1K --checkpoint="$(($total_kb/100))" --checkpoint-action=exec=" printf '%3d/100%%\r' \$((100*\$TAR_CHECKPOINT/$total_kb)) " --totals
fi
```


## <a name="-test-compression"></a>-test-compression

```
Usage: -test-compression [OPTION]...

Performs a selftest of all functions of this module by executing each function with option '--selftest'.

Options:
    --help 
        Prints this help.
    --selftest 
        Performs a self-test.
    --
        Terminates the option list.
```

*Implementation:*
```bash
-tar-gz --selftest && echo || return 1
-tar-zstd --selftest && echo || return 1
-untar-gz --selftest && echo || return 1
-untar-zstd --selftest && echo || return 1
```


## <a name="-untar-gz"></a>-untar-gz

```
Usage: -untar-gz [OPTION]... ARCHIVE [TARGET_DIR]

Decompresses the given archive using gzip and tar displaying a real-time progress bar.

Requirements:
  + Command 'cut' must be available.
  + Command 'du' must be available.
  + Command 'tar' must be available.
  + Command 'gzip' must be available.

Parameters:
  ARCHIVE (required, file)
      Archive to decompress.
  TARGET_DIR (default: '.', directory)
      Decompress location.

Options:
    --checkpoint 
        Use tar's --checkpoint feature instead of pv for progress monitoring. This is considerably slower in Cygwin.
    -----------------------------
    --help 
        Prints this help.
    --selftest 
        Performs a self-test.
    --
        Terminates the option list.
```

*Implementation:*
```bash
if hash pv && [[ ! $_checkpoint ]]; then
    pv "${_ARCHIVE}" --interval 0.5 | tar xzfv - -C "$_TARGET_DIR"
else
    local total_kb=$(du -k "${_ARCHIVE}" | cut -f1) &&
    tar xzfv "${_ARCHIVE}" -C "$_TARGET_DIR" --record-size=1K --checkpoint="$(($total_kb/100))" --checkpoint-action=exec=" printf '%3d/100%%\r' \$((100*\$TAR_CHECKPOINT/$total_kb)) " --totals
fi
```


## <a name="-untar-zstd"></a>-untar-zstd

```
Usage: -untar-zstd [OPTION]... ARCHIVE [TARGET_DIR]

Decompresses the given archive using zstd (https://github.com/facebook/zstd) and tar displaying a real-time progress bar.

Requirements:
  + Command 'cut' must be available.
  + Command 'du' must be available.
  + Command 'tar' must be available.
  + Command 'zstd' must be available.

Parameters:
  ARCHIVE (required, file)
      Archive to decompress.
  TARGET_DIR (default: '.', directory)
      Decompress location.

Options:
    --checkpoint 
        Use tar's --checkpoint feature instead of pv for progress monitoring. This is considerably slower in Cygwin.
    -----------------------------
    --help 
        Prints this help.
    --selftest 
        Performs a self-test.
    --
        Terminates the option list.
```

*Implementation:*
```bash
if hash pv && [[ ! $_checkpoint ]]; then
    pv "${_ARCHIVE}" --interval 0.5 | zstd -d | tar xfv - -C "$_TARGET_DIR"
else
    local total_kb=$(du -k "${_ARCHIVE}" | cut -f1) &&
    tar xfv "${_ARCHIVE}" -C "$_TARGET_DIR" -Izstd --record-size=1K --checkpoint="$(($total_kb/100))" --checkpoint-action=exec=" printf '%3d/100%%\r' \$((100*\$TAR_CHECKPOINT/$total_kb)) " --totals
fi
```