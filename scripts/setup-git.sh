git config --global user.name "$1"
git config --global user.email $2

git config --global init.defaultBranch main

echo "git configured with name '$1' and email '$2'"
