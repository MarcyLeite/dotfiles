install-manjaro: pacman-yay npm
install-ubuntu: ubuntu install-node npm install-docker-ubuntu

ubuntu:
	sudo apt update -y
	sudo apt upgrade -y
	sudo apt install -y $$(cat ./packages/$(SYSTEM)/apt.txt)

pacman-yay:
	sudo pacman -Syu --noconfirm $$(cat ./packages/$(SYSTEM)/pacman.txt)
	sudo pacman -S --noconfirm --needed base-devel
	yay -S --noconfirm $$(cat ./packages/$(SYSTEM)/yay.txt)
npm:
	npm install -g $$(cat ./packages/npm-global.txt)

install-node:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
	sh ${HOME}/.nvm/nvm.sh install --lts

install-docker-ubuntu:
	sudo echo \
		"deb [arch=$$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
		$$(. /etc/os-release && echo "$$VERSION_CODENAME") stable" | \
		sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt update -y
	sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

setup-manjaro: git oh-my-zsh monokai-terminal vscode docker
setup-ubuntu: git oh-my-zsh docker
vscode:
	cp -r ./config/Code ${HOME}/.config/Code
	for x in $$(cat ./packages/vscode-extensions.txt); do code --install-extension $$x; done
git:
	cp ./home-files/.gitconfig ${HOME}/.gitconfig
docker: 
	sudo systemctl start docker.service
	sudo systemctl enable docker.service
	sudo groupadd docker || echo "group 'docker' already exists"
	sudo usermod -aG docker ${USER}
	newgrp docker
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
