#!/bin/bash
# Install dev / build dependencies
apt-get update && apt-get upgrade && \
    apt-get install \
    build-essential \
    curl \
    chrpath \
    libssl-dev \
    libxft-dev \
    libfreetype6 \
    libfreetype6-dev \
    libfontconfig1 \
    libfontconfig1-dev \
    libhdf5-serial-dev \
    libpng-dev \
    libzmq3-dev \
    pkg-config \
    software-properties-common \
    rsync \
    unzip \
    zip \
    g++ \
    gcc \
    libc6-dev \
    gpg-agent \
    apt-utils \
    make \
    nano \
    wget \
    git \
    mysql-client \
    tzdata \
    gconf-service \
    chromium-browser \
    firefox \
    libheif-examples \
    exiftool

# Install RAW to JPEG converter
add-apt-repository ppa:pmjdebruijn/darktable-release && \
    apt-get update && \
    apt-get install darktable 
    # && \
    # apt-get upgrade && \
    # apt-get dist-upgrade

# Install & configure TensorFlow for C
#
# Please use other build if processor does not support AVX2:
# https://dl.photoprism.org/tensorflow/linux/
#
export LD_LIBRARY_PATH="/root/.local/lib:/usr/local/lib:/usr/lib:/lib"
export TF_CPP_MIN_LOG_LEVEL=0
curl -L \
   "https://dl.photoprism.org/tensorflow/linux/libtensorflow-linux-cpu-1.14.0.tar.gz" | \
   tar -C "/usr" -xz
ldconfig

# Install NodeJS
curl -sL https://deb.nodesource.com/setup_10.x | bash -
apt-get update && \
    apt-get install nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

npm install --unsafe-perm=true --allow-root -g npm testcafe chromedriver
npm config set cache ~/.cache/npm

export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:/usr/local/go/bin:/root/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export GO111MODULE=on
mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

# Download TensorFlow model and test files
BUILD_TAG=`date -u +%Y%m%d`
rm -rf /tmp/* && mkdir -p /tmp/photoprism
wget "https://dl.photoprism.org/tensorflow/nasnet.zip?${BUILD_TAG}" -O /tmp/photoprism/nasnet.zip
wget "https://dl.photoprism.org/fixtures/testdata.zip?${BUILD_TAG}" -O /tmp/photoprism/testdata.zip

# Install goimports and richgo (colorizes "go test" output)
export GO111MODULE="off /usr/local/go/bin/go get -u golang.org/x/tools/cmd/goimports"
export GO111MODULE="off /usr/local/go/bin/go get -u github.com/kyoh86/richgo"
echo "alias go=richgo" > /root/.bash_aliases

mkdir -p /go/src/github.com/photoprism/
cd /go/src/github.com/photoprism/

git clone https://github.com/photoprism/photoprism.git
cd photoprism
make all
make test
./photoprism start