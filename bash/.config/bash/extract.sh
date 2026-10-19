# Extract an archive next to itself (or into a given folder), avoiding Game/Game/files nesting
extract() {
    local archive="$1"
    local parent="${2:-$(dirname "$archive")}"
    [[ -f "$archive" ]] || { echo "extract: no such file: $archive" >&2; return 1; }
    mkdir -p "$parent"

    local name
    name=$(basename "$archive" | sed -E 's/\.(tar\.(gz|bz2|xz|zst)|tgz|tbz2|zip|7z|rar)$//')

    # Extract into a hidden temp folder first, then decide where it goes
    local tmp
    tmp=$(mktemp -d "$parent/.extract-XXXXXX") || return 1
    if ! bsdtar -xf "$archive" -C "$tmp"; then
        rm -rf "$tmp"; return 1
    fi

    local entries=("$tmp"/* "$tmp"/.[!.]*)
    local found=()
    for e in "${entries[@]}"; do [[ -e "$e" ]] && found+=("$e"); done

    local target
    if (( ${#found[@]} == 1 )) && [[ -d "${found[0]}" ]]; then
        target="$parent/$(basename "${found[0]}")"     # archive had its own top folder
        [[ -e "$target" ]] && { echo "extract: $target already exists, skipped" >&2; rm -rf "$tmp"; return 1; }
        mv "${found[0]}" "$target" && rmdir "$tmp"
    else
        target="$parent/$name"                          # loose files: make a folder for them
        [[ -e "$target" ]] && { echo "extract: $target already exists, skipped" >&2; rm -rf "$tmp"; return 1; }
        mv "$tmp" "$target"
    fi
    echo "Extracted to $target"
}
