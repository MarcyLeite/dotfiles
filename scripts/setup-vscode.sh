# ~/.config/Code/User

mkdir -p ~/.config/Code/User

echo '{
    "workbench.colorTheme": "Monokai Pro (Filter Octagon)",
    "workbench.iconTheme": "material-icon-theme",
    "editor.insertSpaces": false
}' > ~/.config/Code/User/settings.json

echo "[
	{
		\"key\": \"ctrl+shift+'\",
		\"command\": \"workbench.action.terminal.new\"
	}
]" > ~/.config/Code/User/keybindings.json

cat ./packages/vscode-extensions.txt |
	while read in; do
		code --install-extension $in	
	done

