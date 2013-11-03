#!/bin/bash

# This is a setup for my lesson.

# Create Mummy bare repository.
cd .mummy
git init -q
git add *
git commit -q -m 'Stable version'
cd ..
git clone -q --bare .mummy .mummy-bare

# Create Dracula repository
git clone .mummy-bare dracula

# Create Wolfman repository
git clone .mummy-bare wolfman
