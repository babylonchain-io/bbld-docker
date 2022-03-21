#! /bin/bash
### ==== Installs bbld =====

## --- bbld preparation ---

# Get environment variables
source ~/.bashrc

# download source code
git clone https://github.com/babylonchain-io/bbld.git $GOPATH/src/github.com/bbld
cd $GOPATH/src/github.com/bbld

# HACK: necessary configuration changes
sed -i -e '/defaultGenerate/s/false/true/' config.go
sed -i -e '/defaultHomeDir/s/btcd/bbld/' config.go

# compile and install
make
GO111MODULE=on go install -v . ./cmd/...

## --- btcwallet preparation ---

# download source code
git clone https://github.com/btcsuite/btcwallet $GOPATH/src/github.com/btcsuite/btcwallet
cd $GOPATH/src/github.com/btcsuite/btcwallet

# HACK: necessary configuration changes
sed -i -e '/btcdDefaultCAFile/s/btcd/bbld/' config.go

#compile and install
make
GO111MODULE=on go install -v . ./cmd/...