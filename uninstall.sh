#!/bin/zsh -e

# defined colors
readonly COLOR_GREEN=$(printf "\033[38;5;2m")
readonly COLOR_OFF=$(printf "\033[m")

# determine a place of installation
cat << EOM
Removing the directory \$HOME/.zsh-utils

EOM
readonly TARGET_DIR="$HOME/.zsh-utils"

# remove the directory
printf "${COLOR_GREEN}Are you sure you want to remove the directory \$HOME/.zsh-utils ? [y/n] > ${COLOR_OFF}"
if read -q; then
    rm -rf $TARGET_DIR
    echo ""
    echo ">> done"
else
    echo ""
    echo ">> canceled"
fi
