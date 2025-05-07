# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system:

1. Git: `brew install git`
2. Stow: `brew install stow`

## Installation

First, clone the dotfiles repo to your home directory:
```shell
git clone git@github.com:phlego/dotfiles.git
cd dotfiles
```

Then use GNU stow to create symlinks
```shell
stow .
```

## Reference

[Stow has forever changed the way I manage my dotfiles
](https://www.youtube.com/watch?v=y6XCebnB9gs)
