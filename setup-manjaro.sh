# Update
sudo pacman -Syyu --noconfirm

# Install packages
sudo pacman -S --noconfirm --needed base-devel
sudo pacman -Syu --noconfirm $(cat ./packages/manjaro/pacman.txt)
yay -S --noconfirm $(cat ./packages/manjaro/yay.txt)

# Install node
./scripts/install-node.sh

# Install docker
./scripts/install-docker.sh

# Configure git
./scripts/setup-git.sh "Matheus Marciano" "mm.leitea@outlook.com"

# Install oh-my-zsh
./scripts/install-omzsh.sh

# Install vscode extensions
./scripts/setup-vscode.sh
