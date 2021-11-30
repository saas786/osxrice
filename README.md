# The macOSrice (Worthyox's dotfiles)

This repository contains my personal dotfiles. They are stored here for
convenience so that I may quickly access them on new machines or new installs.
Also, others may find some of my configurations helpful in customizing their
own dotfiles.

- Very useful scripts are in `~/.local/bin/`
- Settings for:
	- alacritty (terminal emulator)
	- vim (text editor)
	- zsh (shell)
	- lf (file manager)
	- zathura (pdf viewer)
	- newsboat (rss reader)
	- other stuff like inputrc and more, etc.
- I try to minimize what's directly in `~` so:
	- All configs that can be in `~/.config/` are.
	- Some environmental variables have been set in `~/.zshenv` to move configs into `~/.config/`


## Install these dotfiles and all dependencies

This repo is managed by a makefile. Run `make` with no arguments to get a list
of all commands that could be executed.

Use Makefile to deploy everything:

```
make init
```

