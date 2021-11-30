# The macOSrice (worthyox's dotfiles)

This repository contains my personal dotfiles. They are stored here for
convenience so that I may quickly access them on new machines or new installs.
Also, others may find some of my configurations helpful in customizing their
own dotfiles.

- Useful scripts are in `~/.local/bin/`
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

This repo is managed by a makefile. Run `make` with no arguments to list
all commands that could be executed.

Use Makefile to deploy everything:

```
make init
```

## Window manager situation

Currently, I alternate between
[Amethyst](https://github.com/ianyh/Amethyst) and
[Rectangle](https://github.com/rxhanson/Rectangle), depending on the task.
Normally, I live in a tiling window manager, but change to a "regular" window
manager when the tiling gets in the way.

### Universal settings

No matter what window manager I am using, I have these shortcuts set in System
Preferences. These actions are not handled by both the window managers, so I
set them universally. To get a setup similar to mine, go to System `Preferences
-> Keyboard -> Shortcuts -> Mission Control` and set the following

I use the following modifier key

| Shortcut | Description |
|---|---|
| `mod` | Shift + Option |

to define the following commands

| Shortcut | Description |
|---|---|
| `mod + <-` | Move left a space |
| `mod + ->` | Move right a space |
| `mod + 1` | Switch to Desktop 1 |
| `mod + 2` | Switch to Desktop 2 |
| `mod + 3` | Switch to Desktop 3 |
| `mod + 4` | Switch to Desktop 4 |
| `mod + 5` | Switch to Desktop 5 |
| `mod + 6` | Switch to Desktop 6 |
| `mod + 7` | Switch to Desktop 7 |
| `mod + 8` | Switch to Desktop 8 |
| `mod + 9` | Switch to Desktop 9 |

Both window managers use a `.plist` file for configuration.

### Manual setup

#### Amethyst Setup

Copy Amethyst.plist file to ~/Library/Preferences using the following command

```
cp ~/.config/amethyst/com.amethyst.Amethyst.plist ~/Library/Preferences/com.amethyst.Amethyst.plist
```

#### Rectangle Setup

Copy Rectangle.plist file to ~/Library/Preferences using the following command

```
cp ~/Library/Preferences/com.knollsoft.Rectangle.plist ~/.config/rectangle/com.knollsoft.Rectangle.plist
```
