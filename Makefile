######################################################################
# @author      : hg
# @file        : Makefile
# @created     : Wed  7 Jul 11:14:15 2021
#
# inspired by this video
# https://www.youtube.com/watch?v=aP8eggU2CaU
######################################################################

BASE = $(PWD)
SCRIPTS = $(HOME)/.scripts
MKDIR = mkdir -p
LN = ln -vsf
LNDIR = ln -vs
SUDO = doas
PKGINSTALL = brew install
PROGINSTALL = brew install --cask

doas: ## Configure doas
	$(SUDO) echo "permit persist keepenv $(whoami) as root" >> /etc/doas.conf

scripts:
	make -s $(HOME)/.local/bin/scripts

$(HOME)/.local/bin/scripts:
	@test -d $(SCRIPTS) || git clone https://github.com/worthyox/scripts $(SCRIPTS)

updatescripts:
	cd $(HOME)/.scripts;\
		git pull

pass:
	git clone https://github.com/worthyox/pass $(HOME)/.password-store

bookmarks:
	git clone git@github.com:worthyox/bookmarks.git $(HOME)/local/share/bookmarks

vim: ## Init vim
	# requires vim
	git clone https://github.com/worthyox/dotvim $(HOME)/.vim
	cd $(HOME)/.vim && make -f $(HOME)/.vim/Makefile

vimupdate: ## Updates vim config
	cd $(HOME)/.vim;\
		git pull

testinit: ## Test initial deploy dotfiles
	rm -rf $(HOME)/.config/alacritty
	$(LNDIR) $(PWD)/.config/alacritty $(HOME)/.config/alacritty
	#rm -rf $(HOME)/.config/$@
	#$(LNDIR) $(PWD)/.config/$@ $(HOME)/.config/$@
	#$(PACMAN) $@
	#test -L $(HOME)/.config/$@/$@.mxl || rm -rf $(HOME)/.config/$@/$@.mxl
	#ln -vsf {$(PWD),$(HOME)}/.config/$@/$@.mxl

init: ## Inital deploy dotfiles on osx machine
	$(LN) $(PWD)/.bash_profile $(HOME)/.bash_profile
	$(LN) $(PWD)/.bashrc $(HOME)/.bashrc
	$(LN) $(PWD)/.profile $(HOME)/.profile
	$(LN) $(PWD)/.zshenv $(HOME)/.zshenv
	rm -rf $(HOME)/.config/zsh
	$(LNDIR) $(PWD)/.config/zsh $(HOME)/.config/zsh
	rm -rf $(HOME)/.config/brew
	$(LNDIR) $(PWD)/.config/brew $(HOME)/.config/brew
	rm -rf $(HOME)/.config/alacritty
	$(LNDIR) $(PWD)/.config/alacritty $(HOME)/.config/alacritty
	rm -rf $(HOME)/.config/lf
	$(LNDIR) $(PWD)/.config/lf $(HOME)/.config/lf
	rm -rf $(HOME)/.config/sc-im
	$(LNDIR) $(PWD)/.config/sc-im $(HOME)/.config/sc-im
	rm -rf $(HOME)/.config/mpv
	$(LNDIR) $(PWD)/.config/mpv $(HOME)/.config/mpv
	rm -rf $(HOME)/.config/mpd
	$(LNDIR) $(PWD)/.config/mpd $(HOME)/.config/mpd
	rm -rf $(HOME)/.config/ncmpcpp
	$(LNDIR) $(PWD)/.config/ncmpcpp $(HOME)/.config/ncmpcpp
	rm -rf $(HOME)/.config/newsboat
	$(LNDIR) $(PWD)/.config/newsboat $(HOME)/.config/newsboat
	rm -rf $(HOME)/.config/startpage
	$(LNDIR) $(PWD)/.config/startpage $(HOME)/.config/startpage
	rm -rf $(HOME)/.config/htop
	$(LNDIR) $(PWD)/.config/htop $(HOME)/.config/htop
	rm -rf $(HOME)/.config/btop
	$(LNDIR) $(PWD)/.config/btop $(HOME)/.config/btop
	rm -rf $(HOME)/.config/wget
	$(LNDIR) $(PWD)/.config/wget $(HOME)/.config/wget
	rm -rf $(HOME)/.config/zathura
	$(LNDIR) $(PWD)/.config/zathura $(HOME)/.config/zathura
	$(LN) $(PWD)/.config/starship.toml $(HOME)/.config/starship.toml
	rm -rf $(HOME)/.config/bat
	$(LNDIR) $(PWD)/.config/bat $(HOME)/.config/bat
	rm -rf $(HOME)/.config/rectangle
	$(LNDIR) $(PWD)/.config/rectangle $(HOME)/.config/rectangle
	rm -rf $(HOME)/.config/amethyst
	$(LNDIR) $(PWD)/.config/amethyst $(HOME)/.config/amethyst
	rm -rf $(HOME)/.qutebrowser
	$(LNDIR) $(PWD)/.config/qutebrowser $(HOME)/.qutebrowser
	rm -rf $(HOME)/.local/bin
	$(LNDIR) $(PWD)/.local/bin $(HOME)/.local/bin
	rm -rf $(HOME)/.local/share/groff
	$(LNDIR) $(PWD)/.local/share/groff $(HOME)/.local/share/groff

wm: ## Setup files for window managers
	$(MKDIR) $(HOME)/.config/amethyst
	$(LN) $(PWD)/.config/amethyst/com.amethyst.Amethyst.plist $(HOME)/.config/amethyst/com.amethyst.Amethyst.plist
	$(MKDIR) $(HOME)/.config/rectangle
	$(LN) $(PWD)/.config/rectangle/com.knollsoft.Rectangle.plist $(HOME)/.config/rectangle/com.knollsoft.Rectangle.plist

alacritty: ## Setup files for alacritty
	$(MKDIR) $(HOME)/.config/alacritty
	$(LN) $(PWD)/.config/alacritty/alacritty.yml $(HOME)/.config/alacritty/alacritty.yml

lf: ## Setup files for lf
	$(MKDIR) $(HOME)/.config/lf
	$(LN) $(PWD)/.config/lf/cleaner $(HOME)/.config/lf/cleaner
	$(LN) $(PWD)/.config/lf/lfrc $(HOME)/.config/lf/lfrc
	$(LN) $(PWD)/.config/lf/preview $(HOME)/.config/lf/preview

mpv: ## Setup files for mpv
	$(MKDIR) $(HOME)/.config/mpv
	$(LN) $(PWD)/.config/mpv/input.conf $(HOME)/.config/mpv/input.conf
	$(LN) $(PWD)/.config/mpv/mpv.conf $(HOME)/.config/mpv/mpv.conf

mpd: ## Setup files for mpd
	$(MKDIR) $(HOME)/.config/mpd/mpd.conf
	$(LN) $(PWD)/.config/mpd/mpd.conf $(HOME)/.config/mpd/mpd.conf

ncmpcpp: ## Setup files for ncmpcpp
	$(MKDIR) $(HOME)/.config/ncmpcpp
	$(LN) $(PWD)/.config/ncmpcpp/bindings $(HOME)/.config/ncmpcpp/bindings
	$(LN) $(PWD)/.config/ncmpcpp/config $(HOME)/.config/ncmpcpp/config

PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man
TMPDIR = $(PWD)/tmp

walk: ## installs plan9 find SUDO NEEDED
	$(MKDIR) $(TMPDIR)
	git clone https://github.com/google/walk.git $(TMPDIR)/walk
	cd $(TMPDIR)/walk && make
	$(MKDIR) $(DESTDIR)$(PREFIX)/bin
	# installing walk
	cp -f     $(TMPDIR)/walk/walk   $(DESTDIR)$PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/walk
	cp -f     $(TMPDIR)/walk/walk.1 $(DESTDIR)$(MANPREFIX)/man1/walk.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/walk.1
	# installing sor
	cp -f     $(TMPDIR)/walk/sor   $(DESTDIR)$PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/sor
	cp -f     $(TMPDIR)/walk/sor.1 $(DESTDIR)$(MANPREFIX)/man1/sor.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/sor.1

jot: ## install jot a markdown style preprocessor for note-taking in groff
	$(MKDIR) $(TMPDIR)
	git clone https://gitlab.com/rvs314/jot.git $(TMPDIR)/$<
	rm -rf $(TMPDIR)

# grap can be found here: https://www.lunabase.org/-faber/Vault/software/grap/

pkg_base: ## Install base packages plus doas because sudo is bloat
	$(PKGINSTALL) coreutils cmake groff grap bat fortune cowsay ffmpeg gcc fzf \
		gnupg exa exiftool figlet htop imagemagick lf make mas neofetch neovim newsboat \
		pandoc pass pfetch sc-im speedtest-cli smartmontools trash-cli wifi-password wget \
		xpdf youtube-dl zsh-autosuggestions zsh-syntax-highlighting m4 make python@3.9

prog_base: ## Install base programs
	$(PROGINSTALL) keepassxc lulu alacritty amethyst librewolf cryptomator firefox mactex \
		hiddenbar keepingyouawake macfuse mpv qutebrowser rectangle skim signal thunderbird \
		veracrypt vscodium vmware-horizon-client

base: ## Install base system
	pkg_base prog_base

docker: ## Docker initial setup
	$(SUDO) pacman -S docker
	$(SUDO) usermod -aG docker $(USER)
	$(MKDIR) $(HOME)/.docker
	$(LN) $(PWD)/.docker/config.json $(HOME)/.docker/config.json
	$(SUDO) systemctl enable docker.service
	$(SUDO) systemctl start docker.service

install: ## Install arch linux packages using pacman
	$(PKGINSTALL) --needed - < $(PWD)/pkg/pacmanlist
	#$(PKG) pkgfile --update
	$(SUDO) pacman -Fy

backup: ## Backup macOS packages using brew
	$(MKDIR) $(PWD)/pkg
	brew list -1 --full-name > $(PWD)/pkg/brewlist.txt

update: ## Update macOS packages and save packages cache
	brew upgrade -v;\
		cd $(HOME)/.config/brew;\
		brew bundle -v;\
		brew cu -afyv;\
		cd; brew doctor -v

pip: ## Install python packages
	pip install --user --upgrade pip
	pip install --user 'python-language-server[all]'

pipbackup: ## Backup python packages
	$(MKDIR) $(PWD)/pkg
	pip freeze > $(PWD)/pkg/piplist.txt

pipupdate: ## Update python packages
	pip list --user | cut -d" " -f 1 | tail -n +3 | xargs pip install -U --user

testpath: ## ECHO PATH
	PATH=$$PATH
	@echo $$PATH
	echo $(PWD)
	PWD=$(PWD)
	echo $(HOME)
	HOME=$(HOME)

osxinstall: base init doas sudo suspend scripts vim vm

allinstall: base init

allupdate: update vimupdate scriptsupdate

allbackup: backup

.DEFAULT_GOAL := help
.PHONY: allinstall allupdate allbackup

help: ## Prints out Make help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
