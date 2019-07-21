#!/usr/bin/env bash


echo "=====> Start deploying <====="
$(apt-get update)
$(apt-get install make git zlib1g-dev libssl-dev gperf php cmake g++)
cd ../
$(git clone https://github.com/tdlib/td.git)
cd td
rm -rf build
mkdir build
cd build
export CXXFLAGS=""
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib ..
cmake --build . --target install
cd ../../
ls -l td/tdlib
npm i
echo "=====> Finish deploying <====="
