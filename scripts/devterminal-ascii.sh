#!/bin/bash

# Improved DevTerminal ASCII Art Banner
# No dependencies required, pure bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
NC='\033[0m' # No Color

clear

# Super-simple and reliable ASCII art that should work in any terminal
echo -e "${CYAN}"
cat << "EOF"
 ____             _____                   _             _ 
|  _ \  _____   _|_   _|__ _ __ _ __ ___ (_)_ __   __ _| |
| | | |/ _ \ \ / / | |/ _ \ '__| '_ ` _ \| | '_ \ / _` | |
| |_| |  __/\ V /  | |  __/ |  | | | | | | | | | | (_| | |
|____/ \___| \_/   |_|\___|_|  |_| |_| |_|_|_| |_|\__,_|_|
EOF
echo -e "${NC}"

# Function to center text
center() {
    width=$(tput cols)
    padding=$(( (width - ${#1}) / 2 ))
    printf "%${padding}s%s\n" "" "$1"
}

# Draw a terminal window frame around the content
draw_terminal_frame() {
    # Fixed width to ensure consistent display
    width=78
    
    # Top border
    echo -e "${WHITE}┌$( printf '─%.0s' $(seq 1 $((width-2))) )┐${NC}"
    
    # Title bar
    title=" ● DevTerminal "
    echo -e "${WHITE}│${RED}$title${WHITE}$( printf ' %.0s' $(seq 1 $((width - ${#title} - 2))) )│${NC}"
    
    # Separator
    echo -e "${WHITE}├$( printf '─%.0s' $(seq 1 $((width-2))) )┤${NC}"
    
    # Content (passed as arguments) - left aligned with fixed padding
    for line in "$@"; do
        # Strip ANSI color codes for width calculation
        plain_line=$(echo -e "$line" | sed 's/\x1B\[[0-9;]*[JKmsu]//g')
        right_padding=$(( width - ${#plain_line} - 4 ))  # 4 spaces from left + content width
        
        if [ $right_padding -lt 0 ]; then right_padding=0; fi
        
        # Left align with 2 spaces of padding
        echo -e "${WHITE}│  ${NC}${line}${WHITE}$( printf ' %.0s' $(seq 1 $right_padding) )│${NC}"
    done
    
    # Bottom border
    echo -e "${WHITE}└$( printf '─%.0s' $(seq 1 $((width-2))) )┘${NC}"
}

# Terminal prompt styling
show_prompt() {
    echo
    echo -ne "${GREEN}➜ ${BLUE}~/dev ${PURPLE}git:(${YELLOW}master${PURPLE}) ${NC}"
    
    # Simulate typing "devterminal"
    for (( i=0; i<11; i++ )); do
        local chars=("d" "e" "v" "t" "e" "r" "m" "i" "n" "a" "l")
        echo -n "${chars[$i]}"
        sleep 0.1
    done
    sleep 0.3
    echo -n " --help"
    sleep 1
    echo
    echo
}

# Main content
slogan="${YELLOW}Your Command Line Arsenal${NC}"
description="${CYAN}166 powerful tools to transform your terminal workflow${NC}"

# Display everything in a terminal-like frame
draw_terminal_frame \
    "" \
    "$slogan" \
    "" \
    "$description" \
    "" \
    "${GREEN}Elevate your development workflow with carefully curated CLI tools${NC}" \
    ""

# Show a simulated prompt at the bottom
show_prompt