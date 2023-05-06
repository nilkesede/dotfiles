# dotfiles

```bash
wget -O ~/Pictures/bk.jpg https://www.solidbackgrounds.com/images/1920x1080/1920x1080-black-solid-color-background.jpg
wget -O ~/Pictures/bg.jpg https://i.imgur.com/TZiJlEy.jpg
sudo hostnamectl set-hostname zurg
sudo timedatectl set-local-rtc 1 --adjust-system-clock
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
```

### update packages
```bash
sudo dnf config-manager --setopt=fastestmirror=true --save
sudo dnf config-manager --setopt=max_parallel_downloads=10 --save
sudo dnf remove -y libreoffice* totem yelp
sudo dnf update -y
```

### nvidia drivers
```bash
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y kmod-nvidia
sudo reboot now
```

### brave
```bash
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install -y brave-browser
```

### code
```bash
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo cat <<EOF | sudo tee /etc/yum.repos.d/vscode.repo
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
sudo dnf install -y code
```

### dbeaver
```bash
sudo dnf install -y https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm
```

### docker
```bash
sudo dnf install moby-engine docker-compose

sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
sudo sed -i -e 's/SELINUX=/SELINUX=disabled #/g' /etc/selinux/config

sudo firewall-cmd --permanent --zone=trusted --add-interface=docker0
sudo firewall-cmd --permanent --zone=docker --change-interface=docker0
sudo firewall-cmd --reload
sudo usermod -aG docker $(whoami)
sudo systemctl enable --now docker
```

### mysql
```bash
docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql
sudo dnf install community-mysql
```

### gh
```bash
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install -y gh
```

```bash
sudo dnf install -y dnf-plugins-core fish gnome-tweak-tool nodejs snapd vim

sudo snap install postman

cp ./_files/.gitconfig ~/.gitconfig
cp ./_files/.gitignore ~/.gitignore
cp ./_files/.vimrc ~/.vimrc
cp ./_files/.wakatime.cfg ~/.wakatime.cfg
cp ./_files/postman.desktop ~/.local/share/applications/postman_postman.desktop

ssh-keygen -t ed25519 -C "email@email.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
# add to github
cat ~/.ssh/id_ed25519.pub
ssh -T git@github.com

mkdir -p ~/.config/fish/functions
cp ./_files/config.fish ~/.config/fish/config.fish
cp ./_files/fish_greeting.fish ~/.config/fish/functions/fish_greeting.fish
curl -L https://get.oh-my.fish | fish
omf install bobthefish

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
curl -sSL https://raw.githubusercontent.com/brigand/fast-nvm-fish/master/nvm.fish > ~/.config/fish/functions/nvm.fish

sudo dnf install -y util-linux-user
chsh -s /usr/bin/fish

https://github.com/source-foundry/Hack/releases
https://github.com/ryazh3nk4/keychron_function_keys_linux
```
