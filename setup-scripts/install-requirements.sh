#! /bin/bash
# ==== Installs requirements for bbld =====

# download golang package
wget https://go.dev/dl/go1.17.7.linux-amd64.tar.gz
chmod +777 go1.17.7.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.17.7.linux-amd64.tar.gz

# create symbolic links
ln -s /usr/local/go/bin/* /usr/bin/

# setup Golang work space
mkdir $HOME/go
mkdir $HOME/go/src
mkdir $HOME/go/bin

# add Golang environment
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOBIN=$GOROOT/bin' >> ~/.bashrc
echo 'export GOTOOLS=$GOROOT/pkg/tool' >> ~/.bashrc
echo 'export PATH=$PATH:$GOBIN:$GOTOOLS:$GOPATH' >> ~/.bashrc
source ~/.bashrc
