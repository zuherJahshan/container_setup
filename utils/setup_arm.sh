#!/bin/bash
# This script should be run whenever you create the docker container. It sets up neovim, bashrc and downloads some one-time packages.
# Check if the init.vim exists in the current directory and move it to its correct location
if [ -f init.vim ]; then
  cp init.vim ~/.config/nvim/init.vim
fi

sudo mv /usr/bin/curl /usr/bin/curl-original
sudo bash -c 'echo -e "#!/bin/sh\nexec /usr/bin/curl-original -k \"\$@\"" > /usr/bin/curl'
sudo chmod +x /usr/bin/curl

mkdir -p ~/downloads
pushd ~/downloads
curl -O https://nodejs.org/dist/v22.14.0/node-v22.14.0-linux-arm64.tar.xz
tar -xf node-v22.14.0-linux-arm64.tar.xz
sudo mv node-v22.14.0-linux-arm64 /usr/local/nodejs22
echo 'export PATH=/usr/local/nodejs22/bin:$PATH' >> ~/.bashrc

echo 'export NODE_TLS_REJECT_UNAUTHORIZED=0' >> ~/.bashrc

# Install nodejs version 22
#curl -k -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh
#sudo -E bash nodesource_setup.sh
#sudo yum install -y nodejs
# Remove the setup file
#rm nodesource_setup.sh

sudo locale-gen en_US en_US.UTF-8
# Install latest version of neovim
pushd ~/downloads
curl -LO https://github.com/neovim/neovim/releases/download/v0.11.0/nvim-linux-arm64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-arm64.tar.gz
# Add this export to the ~/.bashrc file
echo export PATH="$PATH:/opt/nvim-linux-arm64/bin" >>~/.bashrc
popd
# Download lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
# copy the copilot.lua file to the correct location
mkdir -p ~/.config/nvim/lua/plugins/
cp copilot.lua ~/.config/nvim/lua/plugins/
cp keymaps.lua ~/.config/nvim/lua/config/

source ~/.bashrc
