#!/bin/bash


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
# Flatpak (Universal Linux)
install_package_flatpak() {
    sudo flatpak update -y
    sudo flatpak install -y flathub org.gitlab.GitLab git 
    sudo flatpak install -y flathub org.gnu.wget wget
}

## Check installed package manager
check_package_manager() {
    for package_manager in apk apt apt-get dnf pacman xbps yum zypper flatpak; do
        if command -v "$package_manager" &> /dev/null; then
            echo "$package_manager"
            return 0
        fi
    done
    return 1
}



