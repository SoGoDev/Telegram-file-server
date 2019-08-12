#!/usr/bin/env bash

echo "=====> Start deploying <====="
#$(xcode-select --install)
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install gperf cmake openssl
$(git clone https://github.com/tdlib/td.git)
cd td
echo $(ls)
rm -rf build
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DOPENSSL_ROOT_DIR=/usr/local/opt/openssl/ -DCMAKE_INSTALL_PREFIX:PATH=../tdlib ..
cmake --build . --target install
cd ../../
ls -l td/tdlib
npm install
echo "=====> Finish deploying <====="
