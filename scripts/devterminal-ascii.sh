#!/bin/bash

# DevTerminal ASCII Art Banner
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

# Pure ASCII art version that doesn't require figlet
echo -e "${CYAN}"
cat << "EOF"
 ______                _____                       _                _ 
|_   _ \              |_   _|                     (_)              | |
  | | \ \  ______   __  | | ______  .---.  _ .--.  _  _ .--.   ____| |
  | |  | ||______| [  | | ||______|/ /__\\[ `.-. | [ |[ '/'`\ |/  _' |
 _| |_.' /          | |_| |_       | \__., | | | |  | || \__/ |  \_| |
|______.'          |_______|       '.__.'[___||__][___]'.__.' '.___.'
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
    width=$(tput cols)
    if [ $width -gt 80 ]; then width=80; fi
    
    # Top border
    echo -e "${WHITE}┌$( printf '─%.0s' $(seq 1 $((width-2))) )┐${NC}"
    
    # Title bar
    title=" ● DevTerminal "
    padding=$(( (width - ${#title} - 2) ))
    echo -e "${WHITE}│${RED}$title${WHITE}$( printf ' %.0s' $(seq 1 $padding) )│${NC}"
    
    # Separator
    echo -e "${WHITE}├$( printf '─%.0s' $(seq 1 $((width-2))) )┤${NC}"
    
    # Content (passed as arguments)
    for line in "$@"; do
        padding=$(( (width - ${#line} - 2) ))
        if [ $padding -lt 0 ]; then padding=0; fi
        half_padding=$(( padding / 2 ))
        echo -e "${WHITE}│$( printf ' %.0s' $(seq 1 $half_padding) )${NC}${line}${WHITE}$( printf ' %.0s' $(seq 1 $((padding - half_padding))) )│${NC}"
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