#!/usr/bin/env bash


echo "PRESS 1 - macOs"
echo "PRESS 2 - ubuntu 16"
echo "PRESS 3 - ubuntu 18"
#echo "PRESS 4 - ubuntu 14"

read -p "Choose your system: "  system

if [ $system -eq 1 ]
then
    echo "macos"
    ls
    chmod +x ./macos.sh
    sh_deploy_scripts/macos.sh
elif [ $system -eq 2 ]
then
    echo "ubuntu 16"
    ls
    chmod +x ./ubuntu_16.sh
    sh_deploy_scripts/ubuntu_16.sh
elif [ $system -eq 3 ]
then
    echo "ubuntu 18"
    ls
    chmod +x ./ubuntu_18.sh
    sh_deploy_scripts/ubuntu_18.sh
#elif [ $system -eq 4 ]
#then
#     echo "ubuntu 14"
#    ls
#    chmod +x ./ubuntu_14.sh
#    ./ubuntu_14
fi
