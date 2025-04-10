curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh || echo 'I think oh-my-zsh already exists'
curl -o ${HOME}/.oh-my-zsh/themes/flower-dance.zsh-theme https://raw.githubusercontent.com/MarcyLeite/flower-dance-omzsh/main/flower-dance.zsh-theme
cp ./home/.zshrc ${HOME}/.zshrc

chsh -s /bin/zsh
