SHELL=/bin/bash
DOTFILES_DIR := $()
export XDG_CONFIG_HOME := $(HOME)/.config
export STOW_DIR := $(DOTFILES_DIR)

all: update yay install-packages link

update-packages:
	pacman -Syu

yay:
	git clone https://aur.archlinux.org/yay.git
	cd yay & makepkg -si

install-packages:
	./install/install-packages.sh

setup:
	xdg-user-dirs-update

link:
	for FILE in $$(\ls -A runcom); do if [ -f $(HOME)/$$FILE -a ! -h $(HOME)/$$FILE ]; then mv -v $(HOME)/$$FILE{,.bak}; fi; done
	#sudo -- sh -c "for FILE in $$(\ls -A systemConfig); do if [ -f /etc/$$FILE -a ! -h /etc/$$FILE ]; then mv -v /etc/$$FILE{,.bak}; fi; done"
	mkdir -p $(XDG_CONFIG_HOME)
	stow -t $(HOME) runcom
	stow -t $(XDG_CONFIG_HOME) config
	sudo stow -t /etc/ systemConfig
	sudo stow -t /usr/ systemUsr

unlink:
	stow --delete -t $(HOME) runcom
	stow --delete -t $(XDG_CONFIG_HOME) config
	sudo stow --delete -t /etc/ systemConfig
	sudo stow --delete -t /usr/ systemUsr
	for FILE in $$(\ls -A runcom); do if [ -f $(HOME)/$$FILE.bak ]; then mv -v $(HOME)/$$FILE.bak $(HOME)/$${FILE%%.bak}; fi; done
	#sudo -- sh -c "for FILE in $$(\ls -A systemConfig); do if [ -f /etc/$$FILE.bak ]; then mv -v /etc/$$FILE.bak /etc/$${FILE%%.bak}; fi; done"
