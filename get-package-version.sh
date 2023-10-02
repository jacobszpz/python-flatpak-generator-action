#!/bin/bash

get_package_version() {
    local package_name="$1"
    grep -oP "${package_name}==\K[^;]+" requirements.txt | sed 's/^/v/'
}

# Check if an argument is provided
if [ $# -eq 1 ]; then
    get_package_version "$1"  # Call the function with the provided argument
else
    echo "Usage: $0 <source_name>"
    exit 1
fi
