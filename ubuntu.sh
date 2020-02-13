## Dotfiles
wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | sudo apt-key add -
echo "deb https://apt.thoughtbot.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/thoughtbot.list
## END Dotfiles

sudo apt-get -qy remove docker docker-engine docker.io
sudo apt-get -qy update

sudo apt install -qy docker.io silversearcher-ag tmux moreutils golang automake gpg ssh rcm zsh direnv awscli  


echo "ssl-agent eval"
eval `ssh-agent -s`
ssh-add

# docker config
echo "docker config"
sudo systemctl start docker
sudo systemctl enable docker
sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker


# rcup up
echo "rcup up"
rcup -d ~/dotfiles/

# Installing o my zsh
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
