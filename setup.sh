#!/bin/bash

# For setup this lesson:
#
#     $ ./setup.sh
#
# For clean the repository for another lesson:
#
#     $ ./setup.sh clean

if $(test "$1" = 'clean')
then
    # clean the repository
    rm -rf .mummy/.git
    rm -rf .mummy-bare
    rm -rf dracula
    rm -rf wolfman
else
    # Create Mummy bare repository.
    cd .mummy
    git init -q
    git config user.name Mummy
    git config user.email mummy@software-carpentry.org
    git add *
    git commit -q -m 'Stable version'
    cd ..
    git clone -q --bare .mummy .mummy-bare

    # Create Dracula repository
    git clone -q .mummy-bare dracula
    cp .bashrc_dracula dracula/bashrc
    cd dracula
    git config user.name Dracula
    git config user.email dracula@software-carpentry.org
    git config alias.graph 'log --abbrev-commit --graph --decorate --all'
    cd ..

    # Create Wolfman repository
    git clone -q .mummy-bare wolfman
    cp .bashrc_wolfman wolfman/bashrc
    cd wolfman
    git config user.name Wolfman
    git config user.email wolfman@software-carpentry.org
    git config alias.graph 'log --abbrev-commit --graph --decorate --all'
    cd ..
fi
