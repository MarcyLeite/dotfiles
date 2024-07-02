install-manjaro: pacman-yay npm
pacman-yay:
	sudo pacman -Syu --noconfirm $$(cat ./packages/$(SYSTEM)/pacman.txt)
	sudo pacman -S --noconfirm --needed base-devel
	yay -S --noconfirm $$(cat ./packages/$(SYSTEM)/yay.txt)
npm:
	npm install -g $$(cat ./packages/npm-global.txt)

setup-manjaro: git oh-my-zsh monokai-terminal vscode
vscode:
	cp -r ./config/Code ${HOME}/.config/Code
	for x in $$(cat ./packages/vscode-extensions.txt); do code --install-extension $$x; done
git:
	cp ./home-files/.gitconfig ${HOME}/.gitconfig
oh-my-zsh:
	sudo chsh -s /bin/zsh ${USER}
	curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh || echo 'I think oh-my-zsh already exists'
	curl -o ${HOME}/.oh-my-zsh/themes/flower-dance.zsh-theme https://raw.githubusercontent.com/MarcyLeite/flower-dance-omzsh/main/flower-dance.zsh-theme
	cp ./home-files/.zshrc ${HOME}/.zshrc
monokai-terminal:
	sudo rm -r -f /temp/monokai-gnome-terminal
	sudo git clone https://github.com/0xComposure/monokai-gnome-terminal /temp/monokai-gnome-terminal
	/temp/monokai-gnome-terminal/install.sh
	sudo rm -r /temp/monokai-gnome-terminal
