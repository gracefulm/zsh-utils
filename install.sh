#!/bin/zsh -e

# defined colors
readonly COLOR_GREEN=$(printf "\033[38;5;2m")
readonly COLOR_OFF=$(printf "\033[m")

function usage() {
    cat << EOM
Usage: $0 [-h | --help] [--peco-primary]
    -h | --help      Display this command usage
    --peco-primary   Use peco as the primary prompt (default fzf is used)
EOM
    exit 0
}

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    usage
fi


# determine a place of installation
cat << EOM
Creating a directory \$HOME/.zsh-utils
And then, installing the commands under that directory.

EOM
readonly TARGET_DIR="$HOME/.zsh-utils"

# paths of command files that will install
readonly CURRENT_DIR=$(cd $(dirname $0); pwd)
readonly DIR=$(cd $(dirname $0)/tools; pwd)
COMMAND_FILES="$DIR/_echo "
COMMAND_FILES+="$DIR/_exec-command "
COMMAND_FILES+="$DIR/_insert-command "
COMMAND_FILES+="$DIR/_print-error-message "
COMMAND_FILES+="$DIR/_write-stderror "
COMMAND_FILES+="$DIR/show256 "
COMMAND_FILES+="$DIR/google "
if [ "$1" = "--peco-primary" ]; then
    COMMAND_FILES+="$DIR/peco-commands/gcd "
    COMMAND_FILES+="$DIR/peco-commands/gg "
    COMMAND_FILES+="$DIR/peco-commands/phis "
    COMMAND_FILES+="$DIR/peco-commands/pbr "
    COMMAND_FILES+="$DIR/peco-commands/pcd "
    COMMAND_FILES+="$DIR/peco-commands/pcdr "
    COMMAND_FILES+="$DIR/peco-commands/pco "
    COMMAND_FILES+="$DIR/peco-commands/pdi "
    COMMAND_FILES+="$DIR/peco-commands/pe "
    COMMAND_FILES+="$DIR/peco-commands/pf "
    COMMAND_FILES+="$DIR/peco-commands/pgl "
    COMMAND_FILES+="$DIR/peco-commands/pk "
    COMMAND_FILES+="$DIR/peco-commands/pt "
else
    # default case: fzf is used as the primary prompt
    COMMAND_FILES+="$DIR/fzf-commands/gcd "
    COMMAND_FILES+="$DIR/fzf-commands/gg "
    COMMAND_FILES+="$DIR/fzf-commands/fbr "
    COMMAND_FILES+="$DIR/fzf-commands/fcdr "
    COMMAND_FILES+="$DIR/fzf-commands/fco "
    COMMAND_FILES+="$DIR/fzf-commands/fdi "
    COMMAND_FILES+="$DIR/fzf-commands/fe "
    COMMAND_FILES+="$DIR/fzf-commands/ff "
    COMMAND_FILES+="$DIR/fzf-commands/fgl "
    COMMAND_FILES+="$DIR/fzf-commands/fk "
    COMMAND_FILES+="$DIR/fzf-commands/ft "
fi


# optional script
OPTIONAL_SCRIPT=$(
cat << EOM
# zsh-utils init
FPATH=\$HOME/.zsh-utils:\$FPATH
autoload -Uz zsh-utils && zsh-utils
## bindkey
bindkey '^g' gcd
bindkey '^u' fcdr
bindkey 'LL' fgl
## fzf completion
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --style full --height ~50%"
EOM
)
if [ "$1" = "--peco-primary" ]; then
    OPTIONAL_SCRIPT=$(cat << EOM
# zsh-utils init
FPATH=\$HOME/.zsh-utils:\$FPATH
autoload -Uz zsh-utils && zsh-utils
## bindkey
bindkey '^g' gcd
bindkey '^u' pcdr
bindkey '^r' phis
bindkey 'LL' pgl
EOM
)
fi

# install commands under TARGET_DIR
echo ">> Installing commands under $TARGET_DIR ..."
install -d -m 0755 $TARGET_DIR
install -m 0755 $CURRENT_DIR/zsh-utils $TARGET_DIR
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
