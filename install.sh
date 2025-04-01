#!/bin/bash

clear



### Init Functions

## Install/Update package need for install
# APK (Alpine Linux)
install_package_apk() {
    sudo apk update
    sudo apk add --no-cache git wget
}
# APT (Debian, Ubuntu)
install_package_apt() {
    sudo apt update 
    sudo apt install -y git wget
}
# APT-GET (Debian, Ubuntu)
install_package_aptget() {
    sudo apt-get update 
    sudo apt-get install -y git wget
}
# DNF (Fedora, CentOS 8+, RHEL 8+)
install_package_dnf() {
    sudo dnf makecache
    sudo dnf install -y git wget
}
# Pacman (Arch Linux, Manjaro) 
install_package_pacman() {
    sudo pacman -Sy --noconfirm git wget
}
# Xbps (Void Linux)
install_package_xbps() {
    sudo xbps-install -Sy git wget
}
# YUM (CentOS, RHEL)
install_package_yum() {
    sudo yum makecache
    sudo yum install -y git wget
}
# Zypper (openSUSE)
install_package_zypper() {
    sudo zypper refresh
    sudo zypper install -y git wget
}


## Check installed package manager
check_package_manager() {
    for package_manager in apk apt apt-get dnf pacman xbps yum zypper; do
        if command -v "$package_manager" &> /dev/null; then
            return 0
        fi
    done
    return 1
}





### Program

## Check and if need install packages
echo "INFO: Check installation 'git', 'wget' packages"
if ! command -v wget &> /dev/null || ! command -v git &> /dev/null; then
    echo "WARNING: Package 'git', 'wget' not found. Try install"

    echo "INFO: Check installing package manager"
    check_package_manager

    if [ $? == 0 ]; then
        echo "INFO: Found '$package_manager' package manager"
    else
        echo "ERROR: Package manager not found. Please install 'git', 'wget'"
        exit 1
    fi

    if [ "$package_manager" == "apk" ]; then
        install_package_apk
    elif [ "$package_manager" == "apt" ]; then
        install_package_apt
    elif [ "$package_manager" == "apt-get" ]; then
        install_package_aptget
    elif [ "$package_manager" == "dnf" ]; then
        install_package_dnf
    elif [ "$package_manager" == "pacman" ]; then
        install_package_pacman
    elif [ "$package_manager" == "xbps" ]; then
        install_package_xbps
    elif [ "$package_manager" == "yum" ]; then
        install_package_yum
    elif [ "$package_manager" == "zypper" ]; then
        install_package_zypper
    else
        echo "ERROR: Unknown error"
        exit 1
    fi
else
    echo "INFO: Package 'git', 'wget' found"
fi
