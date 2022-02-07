#!/bin/bash

# defined colors
readonly COLOR_GREEN=$(printf "\033[38;5;2m")
readonly COLOR_OFF=$(printf "\033[m")

# determine a place of installation
cat << EOM
Creating a directory(you will name it) under \$HOME.
And then, installing the commands under that directory.

EOM
read -p "${COLOR_GREEN}enter dir name > ${COLOR_OFF}" ROOT_DIR
readonly TARGET_DIR="$HOME/$ROOT_DIR"

# paths of command files that will install
readonly DIR=$(cd $(dirname $0); pwd)
COMMAND_FILES="$DIR/tools/show256 "
COMMAND_FILES+="$DIR/tools/peco-commands/gg "
COMMAND_FILES+="$DIR/tools/peco-commands/pbr "
COMMAND_FILES+="$DIR/tools/peco-commands/pco "
COMMAND_FILES+="$DIR/tools/peco-commands/pf "

# install commands under TARGET_DIR
echo ""
echo ">> Installing commands under $TARGET_DIR ..."
install -d -m 0755 $TARGET_DIR
install -m 0755 $COMMAND_FILES $TARGET_DIR
echo ">> done"
cat << EOM

Now you can use the commands.
e.g. > $TARGET_DIR/show256

If you write the following setting in your shell configuration file(like .bashrc, .zshrc),
you can execute the command without specifying the path.
===
PATH=\$HOME/$ROOT_DIR:\$PATH
===

That's it!
Enjoy your terminal life!!
EOM

