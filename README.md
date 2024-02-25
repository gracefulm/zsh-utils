# zsh-utils

This repository manages handy command line tools.

## Dependent tools

First of all, it is assumed that your terminal is running in `zsh`.
Second of all, you need to install below in advance.

- bat
- cdr
- docker
- ghq
- peco
- tmux
- vim

## Contents of tools

- functions with peco
  - **gcd**
    - gcd is a function that enable to move  efficiently to a project managed by ghq
  - **gg**
    - gg is a function that can search with git grep and use peco to perform actions such as editing and browsing on the selected files
  - **pbr**
    - pbr is a function that enable to operate git branch efficiently
  - **pcd**
    - pcd is a function that execute cd command with peco
  - **pcdr**
    - pcdr is a function that can easily move to the directory that you moved in the past
  - **pco**
    - pco is a function that enable to do git checkout easily
  - **pdi**
    - pdi is a function that enable to do some actions to docker images
  - **pe**
    - pe is a function that enable to enter the selected container
  - **pf**
    - pf is a function that enable to operate selected file/directory
    - pf has some options

    ```shell
    Usage: pf [-h | --help] [-f] [-d]
    -h | --help      Display this command usage
    -f               Search for files under the current directory
    -d               Search for directories under the current directory
    ```

  - **pgl**
    - pgl is a function that enable to show git log and do some actions on selected commit
  - **phis**
    - phis is a function that enable to select a command that was executed in the past
  - **pk**
    - pk is a function that kill or just output selected processes
  - **pt**
    - pt is a function that can be attached to tmux session
- other functions
  - **google**
    - Search key words on Google Chrome
  - **show256**
    - Show 256 colors

## Installation

```shell
git clone https://github.com/masaki-miura/zsh-utils.git
cd zsh-utils
./install.sh
```
