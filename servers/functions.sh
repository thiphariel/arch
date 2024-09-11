get_required_input() {
    local prompt="$1"
    local input=""

    while [ -z "$input" ]; do
        read -p "$prompt: " input
        if [ -z "$input" ]; then
            echo "Input is required. Please try again." >&2
        fi
    done

    echo "$input"
}

export -f get_required_input
