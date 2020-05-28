up:
	cp ./.gitignore ~/.gitignore
	cp ./.npmrc ~/.npmrc
	cp ./.vimrc ~/.vimrc
	cp ./config.fish ~/.config/fish/config.fish
	curl -sSL https://raw.githubusercontent.com/brigand/fast-nvm-fish/master/nvm.fish > ~/.config/fish/functions/nvm.fish
