curl -o- https://fnm.vercel.app/install | bash

/home/$USER/.local/share/fnm/fnm install --lts

# Install npm globals
npm install -g $(cat ./packages/npm-global.txt)
