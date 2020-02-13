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

cd $HOME/.ssh && vi id_rsa && chmod 400 id_rsa
cd $HOME
git clone git@github.com:cesarmira/dotfiles.git

echo "rcup up"
cp ~/dotfiles/rcrc ~/.rcrc
rcup -d ~/dotfiles