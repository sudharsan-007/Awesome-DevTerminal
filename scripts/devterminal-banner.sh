#!/bin/bash

# This script creates a stylish DevTerminal banner
# Dependencies: figlet, lolcat (optional for color)

# Check if figlet is installed
if ! command -v figlet &> /dev/null; then
    echo "This script requires figlet. Please install it first."
    echo "On Ubuntu/Debian: sudo apt install figlet"
    echo "On MacOS with Homebrew: brew install figlet"
    exit 1
fi

# Check if lolcat is installed (optional)
HAS_LOLCAT=false
if command -v lolcat &> /dev/null; then
    HAS_LOLCAT=true
fi

clear

# Function to center text
center_text() {
    text="$1"
    width=$(tput cols)
    padding=$(( (width - ${#text}) / 2 ))
    printf "%${padding}s%s\n" "" "$text"
}

# Create a divider line
divider() {
    width=$(tput cols)
    printf "%${width}s\n" | tr " " "─"
}

# Banner with bold ANSI colors if no lolcat
if [ "$HAS_LOLCAT" = false ]; then
    echo -e "\033[1;36m"
    figlet -f slant "DevTerminal"
    echo -e "\033[0m"
    
    # Add slogan with bold green
    echo
    center_text "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo
    echo -e "\033[1;32m$(center_text "Your Command Line Arsenal")\033[0m"
    echo -e "\033[0;37m$(center_text "166 powerful tools to transform your terminal workflow")\033[0m"
    echo
else
    # Use lolcat for rainbow effect
    figlet -f slant "DevTerminal" | lolcat -a -d 1 -s 50
    
    # Add slogan
    echo
    center_text "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat -a -d 1
    echo
    center_text "Your Command Line Arsenal" | lolcat -a -d 1
    center_text "166 powerful tools to transform your terminal workflow" | lolcat -a -d 1 -s 10
    echo
fi

# Command prompt suggestion
echo
echo -e "\033[0;90m$(center_text "press any key to continue...")\033[0m"
read -n 1 -s
clear