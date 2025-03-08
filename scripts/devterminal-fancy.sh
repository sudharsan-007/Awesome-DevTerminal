#!/bin/bash

# DevTerminal Banner - Advanced Version
# Dependencies: figlet, lolcat, boxes (all optional but recommended)

# Terminal colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

# Check for dependencies
if ! command -v figlet &> /dev/null; then
    HAS_FIGLET=false
    echo "For best results, install figlet:"
    echo "Ubuntu/Debian: sudo apt install figlet"
    echo "MacOS: brew install figlet"
else
    HAS_FIGLET=true
fi

if ! command -v lolcat &> /dev/null; then
    HAS_LOLCAT=false
else
    HAS_LOLCAT=true
fi

if ! command -v boxes &> /dev/null; then
    HAS_BOXES=false
else
    HAS_BOXES=true
fi

clear

# Function to simulate typing
type_text() {
    text="$1"
    speed=${2:-0.03}
    
    for (( i=0; i<${#text}; i++ )); do
        echo -n "${text:$i:1}"
        sleep $speed
    done
    echo
}

# Choose a slogan (randomly select one)
slogans=(
    "Your Command Line Arsenal"
    "Elevate Your Terminal Experience"
    "166 Tools. Infinite Possibilities."
    "Power Up Your Command Line"
    "CLI Tools for the Modern Developer"
)
slogan=${slogans[$RANDOM % ${#slogans[@]}]}

# Generate the banner
banner_content=""

if [ "$HAS_FIGLET" = true ]; then
    if [ "$HAS_LOLCAT" = true ]; then
        banner_content=$(figlet -f slant "DevTerminal" | lolcat -f)
    else
        banner_content=$(figlet -f slant "DevTerminal")
    fi
else
    banner_content="
    ____                 ______                         _                   __
   / __ \  ___   _   __ /_  __/  ___    _____   ____ _ (_)  ____   ____ _  / /
  / / / / / _ \ | | / /  / /    / _ \  / ___/  / __ \`// /  / __ \ / __ \`/ / / 
 / /_/ / /  __/ | |/ /  / /    /  __/ / /     / /_/ // /  / / / // /_/ / / /  
/_____/  \___/  |___/  /_/     \___/ /_/      \__,_//_/  /_/ /_/ \__,_/ /_/   
                                                                             
"
fi

# Add the slogan and description
description="A curated collection of $CYAN 166 $NC powerful CLI tools for developers"

# Display the banner with box (if available)
if [ "$HAS_BOXES" = true ]; then
    (echo "$banner_content"; echo; echo -e "$YELLOW$slogan$NC"; echo; echo -e "$description") | boxes -d stone -a c
else
    echo -e "$banner_content"
    echo
    echo -e "$YELLOW$slogan$NC"
    echo 
    echo -e "$description"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
fi

# Add a simulated command prompt at the bottom
echo
echo -ne "$GREEN➜ $BLUE~/dev $PURPLE git:($YELLOW master$PURPLE) $NC"
type_text "_ " 0.5

sleep 1