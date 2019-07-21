#!/usr/bin/env bash

echo "=====> Start deploying <====="
apt-get update
sudo apt-get upgrade
sudo apt-get install make git zlib1g-dev libssl-dev gperf php cmake g++
git clone https://github.com/tdlib/td.git
cd td
rm -rf build
mkdir build
cd build
export CXXFLAGS=""
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib ..
cmake --build . --target install
cd ..
cd ..
ls -l td/tdlib
npm i
echo "=====> Finish deploying <====="
