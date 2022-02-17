#!/bin/zsh -e

# defined colors
readonly COLOR_GREEN=$(printf "\033[38;5;2m")
readonly COLOR_OFF=$(printf "\033[m")

# determine a place of installation
cat << EOM
Creating a directory \$HOME/.utils
And then, installing the commands under that directory.

EOM
readonly TARGET_DIR="$HOME/.utils"

# paths of command files that will install
readonly CURRENT_DIR=$(cd $(dirname $0); pwd)
readonly DIR=$(cd $(dirname $0)/tools; pwd)
COMMAND_FILES="$DIR/_insert-command-line "
COMMAND_FILES+="$DIR/show256 "
COMMAND_FILES+="$DIR/google "
COMMAND_FILES+="$DIR/peco-commands/gcd "
COMMAND_FILES+="$DIR/peco-commands/gg "
COMMAND_FILES+="$DIR/peco-commands/pbr "
COMMAND_FILES+="$DIR/peco-commands/pco "
COMMAND_FILES+="$DIR/peco-commands/pf "

# optional script
readonly OPTIONAL_SCRIPT=$(
cat << EOM
# utils init
FPATH=\$HOME/.utils:\$FPATH
autoload -Uz utils-entory-point && utils-entory-point
## bindkey
bindkey '^g' gcd
EOM
)

# install commands under TARGET_DIR
echo ">> Installing commands under $TARGET_DIR ..."
install -d -m 0755 $TARGET_DIR
install -m 0755 $CURRENT_DIR/utils-entory-point $TARGET_DIR
install -d -m 0755 $TARGET_DIR/tools
install -m 0755 $(echo $COMMAND_FILES) $TARGET_DIR/tools
echo ">> done"
cat << EOM

Now you can use the commands.
e.g. > $TARGET_DIR/show256

If you write the following setting in your .zshrc,
you can execute the command without specifying the path.

$OPTIONAL_SCRIPT

EOM

printf "${COLOR_GREEN}add the above to \$HOME/.zshrc ? [y/n] > ${COLOR_OFF}"
if read -q; then
    echo $OPTIONAL_SCRIPT >> $HOME/.zshrc
    echo ""
fi
echo ""
echo "That's it!"
echo "Enjoy your terminal life!!"

