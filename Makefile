fire:
	cp ./.gitconfig ~/.gitconfig
	cp ./.gitignore ~/.gitignore
	cp ./.npmrc ~/.npmrc
	cp ./.vimrc ~/.vimrc
	cp ./config.fish ~/.config/fish/config.fish
	cp ./fish_greeting.fish ~/.config/fish/functions/fish_greeting.fish
	curl -sSL https://raw.githubusercontent.com/brigand/fast-nvm-fish/master/nvm.fish > ~/.config/fish/functions/nvm.fish
	curl -L https://get.oh-my.fish | fish
	omf install bobthefish
copy:
	cp ~/.gitconfig ./.gitconfig
	cp ~/.gitignore ./.gitignore
	cp ~/.npmrc ./.npmrc
	cp ~/.vimrc ./.vimrc
	cp ~/.config/fish/config.fish ./config.fish
	cp ~/.config/fish/functions/fish_greeting.fish ./fish_greeting.fish
