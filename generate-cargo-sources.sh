#!/bin/bash

generate_cargo_source() {
    local source_name="$1"
    local tmp_dir="${source_name}-tmp"
    cd "${tmp_dir}"
    flatpak-cargo-generator.py Cargo.lock
    mv generated-sources.json "../${source_name}-generated-sources.json"
    cd ..
    rm -rf "${tmp_dir}"
}

# Check if an argument is provided
if [ $# -eq 1 ]; then
    generate_cargo_source "$1"  # Call the function with the provided argument
else
    echo "Usage: $0 <source_name>"
    exit 1
fi

