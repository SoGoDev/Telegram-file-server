#!/usr/bin/env bash

echo "=====> Start deploying <====="
sudo apt-get update
sudo apt-get upgrade
sudo apt update
sudo apt-get install --assume-yes make git zlib1g-dev libssl-dev gperf php cmake g++
git clone https://github.com/tdlib/td.git
cd td
rm -rf build
mkdir build
cd build
export CXXFLAGS=""
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib ..
cmake --build . --target install
cd ../../
ls -l td/tdlib
sudo apt-get install nodejs-dev node-gyp libssl1.0-dev
sudo apt-get --assume-yes install nodejs
sudo apt install --assume-yes npm
npm i
echo "=====> Finish deploying <====="
