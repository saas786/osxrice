# inspired by this video
# https://www.youtube.com/watch?v=aP8eggU2CaU

BASE = $(PWD)
SCRIPTS = $(HOME)/.scripts
MKDIR = mkdir -p
LN = ln -vsf
LNDIR = ln -vs
SUDO = doas
PKGINSTALL = $(SUDO) pacman -Sy --noconfirm

doas: ## Configure doas
	$(SUDO) echo "permit persist keepenv $(whoami) as root" >> /etc/doas.conf

sudo: # stop asking for password when using sudo
	$(SUDO) echo "## Prevents entering password in new windows\nDefaults \!tty_tickets" >> /etc/sudoers

scripts:
	make -s $(HOME)/.scripts

$(HOME)/.scripts:
	@test -d $(SCRIPTS) || git clone https://github.com/worthyox/scripts $(SCRIPTS)

updatescripts:
	cd $(HOME)/.scripts:\
		git pull

pass:
	git clone https://github.com/worthyox/pass $(HOME)/.password-store

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
	rm -rf $(HOME)/.config/alacritty
	$(LNDIR) $(PWD)/.config/alacritty $(HOME)/.config/alacritty
	rm -rf $(HOME)/.config/lf
	$(LNDIR) $(PWD)/.config/lf $(HOME)/.config/lf
	rm -rf $(HOME)/.config/mpd
	$(LNDIR) $(PWD)/.config/mpd $(HOME)/.config/mpd
	rm -rf $(HOME)/.config/mpv
	$(LNDIR) $(PWD)/.config/mpv $(HOME)/.config/mpv
	rm -rf $(HOME)/.config/ncmpcpp
	$(LNDIR) $(PWD)/.config/ncmpcpp $(HOME)/.config/ncmpcpp
	rm -rf $(HOME)/.config/newsboat
	$(LNDIR) $(PWD)/.config/newsboat $(HOME)/.config/newsboat
	rm -rf $(HOME)/.config/startpage
	$(LNDIR) $(PWD)/.config/startpage $(HOME)/.config/startpage
	rm -rf $(HOME)/.config/wget
	$(LNDIR) $(PWD)/.config/wget $(HOME)/.config/wget
	rm -rf $(HOME)/.config/X11
	$(LNDIR) $(PWD)/.config/X11 $(HOME)/.config/X11
	rm -rf $(HOME)/.config/zathura
	$(LNDIR) $(PWD)/.config/zathura $(HOME)/.config/zathura
	rm -rf $(HOME)/.config/zsh
	$(LNDIR) $(PWD)/.config/zsh $(HOME)/.config/zsh
	$(LN) $(PWD)/.config/starship.toml $(HOME)/.config/starship.toml
	rm -rf $(HOME)/.qutebrowser
	$(LNDIR) $(PWD)/.config/qutebrowser $(HOME)/.qutebrowser

initarch: ## Inital deploy dotfiles
	$(LN) $(PWD)/.bash_profile $(HOME)/.bash_profile
	$(LN) $(PWD)/.bashrc $(HOME)/.bashrc
	$(LN) $(PWD)/.profile $(HOME)/.profile
	$(LN) $(PWD)/.vimrc $(HOME)/.vimrc
	$(LN) $(PWD)/.zshenv $(HOME)/.zshenv
	rm -rf $(HOME)/.config/alacritty
	$(LNDIR) $(PWD)/.config/alacritty $(HOME)/.config/alacritty
	rm -rf $(HOME)/.config/dunst
	$(LNDIR) $(PWD)/.config/dunst $(HOME)/.config/dunst
	rm -rf $(HOME)/.config/fontconfig
	$(LNDIR) $(PWD)/.config/fontconfig $(HOME)/.config/fontconfig
	rm -rf $(HOME)/.config/lf
	$(LNDIR) $(PWD)/.config/lf $(HOME)/.config/lf
	rm -rf $(HOME)/.config/mpd
	$(LNDIR) $(PWD)/.config/mpd $(HOME)/.config/mpd
	rm -rf $(HOME)/.config/mpv
	$(LNDIR) $(PWD)/.config/mpv $(HOME)/.config/mpv
	rm -rf $(HOME)/.config/ncmpcpp
	$(LNDIR) $(PWD)/.config/ncmpcpp $(HOME)/.config/ncmpcpp
	rm -rf $(HOME)/.config/newsboat
	$(LNDIR) $(PWD)/.config/newsboat $(HOME)/.config/newsboat
	rm -rf $(HOME)/.config/openbox
	$(LNDIR) $(PWD)/.config/openbox $(HOME)/.config/openbox
	rm -rf $(HOME)/.config/qutebrowser
	$(LNDIR) $(PWD)/.config/qutebrowser $(HOME)/.config/qutebrowser
	rm -rf $(HOME)/.config/rofi
	$(LNDIR) $(PWD)/.config/rofi $(HOME)/.config/rofi
	rm -rf $(HOME)/.config/startpage
	$(LNDIR) $(PWD)/.config/startpage $(HOME)/.config/startpage
	rm -rf $(HOME)/.config/sxiv
	$(LNDIR) $(PWD)/.config/sxiv $(HOME)/.config/sxiv
	rm -rf $(HOME)/.config/tint2
	$(LNDIR) $(PWD)/.config/tint2 $(HOME)/.config/tint2
	rm -rf $(HOME)/.config/wget
	$(LNDIR) $(PWD)/.config/wget $(HOME)/.config/wget
	rm -rf $(HOME)/.config/X11
	$(LNDIR) $(PWD)/.config/X11 $(HOME)/.config/X11
	rm -rf $(HOME)/.config/xarchiver
	$(LNDIR) $(PWD)/.config/xarchiver $(HOME)/.config/xarchiver
	rm -rf $(HOME)/.config/zathura
	$(LNDIR) $(PWD)/.config/zathura $(HOME)/.config/zathura
	rm -rf $(HOME)/.config/zsh
	$(LNDIR) $(PWD)/.config/zsh $(HOME)/.config/zsh
	$(LN) $(PWD)/.config/mimeapps.list $(HOME)/.config/mimeapps.list
	$(LN) $(PWD)/.config/starship.toml $(HOME)/.config/starship.toml
	$(LN) $(PWD)/.config/user-dirs.dirs $(HOME)/.config/user-dirs.dirs
	#$(MKDIR) $(HOME)/.local/share/
	#rm -rf $(HOME)/.local/share/applications
	#$(LNDIR) $(PWD)/.local/share/applications $(HOME)/.local/share/applications

X: ## Setup files for xorg
	$(MKDIR) $(HOME)/.config/X11
	$(LN) $(PWD)/.config/X11/xinitrc $(HOME)/.config/X11/xinitrc
	$(LN) $(PWD)/.config/X11/xresources $(HOME)/.config/X11/xresources
	$(LN) $(PWD)/.config/X11/xserverrc $(HOME)/.config/X11/xserverrc
	$(MKDIR) $(HOME)/.config/picom
	$(LN) $(PWD)/.config/picom/picom.conf $(HOME)/.config/picom/picom.conf
	$(MKDIR) $(HOME)/.config/fontconfig
	$(LN) $(PWD)/.config/fontconfig/fonts.conf $(HOME)/.config/fontconfig/fonts.conf
	$(MKDIR) $(HOME)/.config/dunst
	$(LN) $(PWD)/.config/dunst/critical.png $(HOME)/.config/dunst/critical.png
	$(LN) $(PWD)/.config/dunst/dunstrc $(HOME)/.config/dunst/dunstrc
	$(LN) $(PWD)/.config/dunst/normal.png $(HOME)/.config/dunst/normal.png
	$(MKDIR) $(HOME)/.config/zathura
	$(LN) $(PWD)/.config/zathura/zathurarc $(HOME)/.config/zathura/zathurarc
	$(MKDIR) $(HOME)/.config/qutebrowser/bookmarks
	$(LN) $(PWD)/.config/qutebrowser/config.py $(HOME)/.config/qutebrowser/config.py
	$(LN) $(PWD)/.config/bookmarks $(HOME)/.config/qutebrowser/bookmarks/urls
	$(MKDIR) $(HOME)/.config/sxiv/exec
	$(LN) $(PWD)/.config/sxiv/exec/key-handler $(HOME)/.config/sxiv/exec/key-handler
	$(LN) $(PWD)/.config/mimeapps.list $(HOME)/.config/mimeapps.list
	$(LN) $(PWD)/.config/starship.toml $(HOME)/.config/starship.toml
	$(LN) $(PWD)/.config/user-dirs.dirs $(HOME)/.config/user-dirs.dirs

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

jot: ## install jot a markdown style  preprocessor for note-taking in groff
	$(MKDIR) $(TMPDIR)
	git clone https://gitlab.com/rvs314/jot.git $(TMPDIR)/$<
	rm -rf $(TMPDIR)

# grap can be found here: https://www.lunabase.org/-faber/Vault/software/grap/

base: ## Install base and base-devel package plus doas because sudo is bloated
	$(PKGINSTALL) filesystem gcc-libs glibc bash coreutils file findutils gawk \
		grep procps-ng sed tar gettext pciutils psmisc shadow util-linux bzip2 gzip \
		xz licenses pacman systemd systemd-sysvcompat iputils iproute2 autoconf sudo \
		automake binutils bison fakeroot flex gcc groff libtool m4 make patch pkgconf \
		texinfo which opendoas

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

backup: ## Backup arch linux packages
	$(MKDIR) $(PWD)/pkg
	#pacman -Qnq > ${PWD}/pkg/pacmanlist
	pacman -Qeq > $(PWD)/pkg/pacmanlist
	pacman -Qqem > $(PWD)/pkg/aurlist

update: ## Update arch linux packages and save packages cache 3 generations
	yay -Syu

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

osxinstall: base install vim installsuckless paru yay tlp init networkmanager pacmancolors doas sudo suspend aur scripts X

allinstall: install init paru yay tlp aur

allupdate: update vimupdate scriptsupdate sucklessupdate

allbackup: backup

.DEFAULT_GOAL := help
.PHONY: allinstall allupdate allbackup

help: ## Prints out Make help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sort \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
