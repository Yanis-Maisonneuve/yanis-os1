
#!/usr/bin/env bash

set -euo pipefail

print_header() {
    local color="$1"
    local title="$2"
    printf "%b%s%b\n" "${color}" "[+] ${title}:" "\033[0m"
}

print_section() {
    printf "    %s\n" "$1"
}

get_distribution() {
    if [ -r /etc/os-release ]; then
        # shellcheck source=/etc/os-release
        source /etc/os-release
        printf "%s %s" "${NAME:-Unknown}" "${VERSION:-}" | sed 's/ $//'
    else
        uname -s
    fi
}

print_header "\033[1;32m" "Operating System & Kernel Version"
print_section "Distribution: $(get_distribution)"
print_section "Kernel Version: $(uname -r)"
print_section "Full Details: $(uname -a)"

echo "--------------------------------------------------"

print_header "\033[1;34m" "Current Logged-in User"
print_section "Username: $(whoami)"

echo "--------------------------------------------------"

print_header "\033[1;35m" "Current Working Directory"
print_section "Path: $(pwd)"

echo "=================================================="
