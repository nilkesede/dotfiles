# dotfiles

```bash
# mount ntfs disk on fstab
sudo blkid
sudo vi /etc/fstab
# UUID=2AAA5C23775CD1AA /mnt/files ntfs-3g rw,uid=1000,gid=1000,dmask=0002,fmask=0003 0 0
sudo mount -a

wget -O ~/Pictures/bg.jpg https://www.solidbackgrounds.com/images/1920x1080/1920x1080-black-solid-color-background.jpg

sudo hostnamectl set-hostname zurg
sudo timedatectl set-local-rtc 1 --adjust-system-clock
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
wget -O dbeaver.rpm https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm
sudo dnf install -y ./dbeaver.rpm
rm ./dbeaver.rpm
```

### mysql
```bash
sudo dnf install -y https://dev.mysql.com/get/mysql80-community-release-fc34-1.noarch.rpm
sudo dnf check-update
sudo dnf install -y mysql-community-server
sudo systemctl start mysqld.service
sudo systemctl enable mysqld.service
sudo grep 'A temporary password' /var/log/mysqld.log |tail -1
mysql -uroot -p -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root'";
sudo mysql_secure_installation
sudo firewall-cmd --add-service=mysql --permanent
sudo firewall-cmd --reload
```

### mongo
```bash
cat <<EOF | sudo tee /etc/yum.repos.d/mongodb.repo
[mongodb-4.4]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/8/mongodb-org/4.4/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.4.asc
EOF

sudo dnf -y install mongodb-org

mongo -version
```

### docker
```bash
sudo dnf install -y grubby
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
sudo sed -i -e 's/SELINUX=/SELINUX=disabled #/g' /etc/selinux/config

sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce

sudo firewall-cmd --permanent --zone=trusted --add-interface=docker0
sudo firewall-cmd --permanent --zone=docker --change-interface=docker0
sudo firewall-cmd --reload
sudo usermod -aG docker $(whoami)
sudo systemctl enable --now docker
```

### gh
```bash
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install -y gh
```

```bash
sudo dnf install -y dnf-plugins-core fish gnome-tweak-tool awscli filezilla nodejs snapd

sudo snap install android-studio --classic
sudo snap install postman

cp ./_files/.gitconfig ~/.gitconfig
cp ./_files/.gitignore ~/.gitignore
cp ./_files/.vimrc ~/.vimrc
cp ./_files/.wakatime.cfg ~/.wakatime.cfg
cp ./_files/.ssh ~/

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

mkdir -p ~/.config/fish/functions
cp ./_files/config.fish ~/.config/fish/config.fish
cp ./_files/fish_greeting.fish ~/.config/fish/functions/fish_greeting.fish
curl -L https://get.oh-my.fish | fish
omf install bobthefish

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
curl -sSL https://raw.githubusercontent.com/brigand/fast-nvm-fish/master/nvm.fish > ~/.config/fish/functions/nvm.fish

sudo dnf install -y util-linux-user
chsh -s /usr/bin/fish
```
