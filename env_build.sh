#!/bin/bash
#sudo apt-get update
#sudo apt-get -y install openjdk-8-jdk
#sudo update-alternatives --config javac
#sudo update-alternatives --config java

#sudo apt install -y libcanberra-gtk-module

#sudo apt-get install -y gcc-multilib mtd-utils:i386 subversion patch patchutils bison libc6-dev libxml-dom-perl zlib1g zlib1g-dev libcurl4-openssl-dev libncurses5:i386 python-numpy doxygen python-apt dmsetup python-svn libpcre3-dev netpbm sqlite3 gawk graphviz u-boot-tools automake pkg-config libc6-armel-cross libc6-dev-armel-cross binutils-arm-linux-gnueabi libncurses5-dev
#sudo apt-get install -y gcc-arm-linux-gnueabi g++-arm-linux-gnueabi

#sudo apt-get install -y php-cli

#NOT IN MDS installation guide
#sudo apt install python-pip

#pip install setuptools
#sudo apt-get -y install squashfs-tools
#sudo apt-get -y install flex

#MUST VERSION 2.0.5
#####sudo apt-get -y install luajit
wget http://luajit.org/download/LuaJIT-2.0.5.tar.gz
tar xzvf LuaJIT-2.0.5.tar.gz
cd LuaJIT-2.0.5/
make
sudo make install
cd ..
rm -fr LuaJIT-2.0.5
rm LuaJIT-2.0.5.tar.gz



#sudo apt-get install -y curl

#DONT DO following
###########curl sL https://deb.nodesource.com/setup_10.x | sudo bash -

#sudo apt-get install -y nodejs

#FIX  npm : Depends: node-gyp (>= 0.10.9) but it is not going to be installed
#sudo apt-get install nodejs-dev node-gyp libssl1.0-dev

#sudo apt-get install -y npm

sudo apt-get install -y cppcheck
sudo apt-get install -y ssh-askpass

#select NO
sudo dpkg-reconfigure dash


sudo apt-get install -y libtool

sudo apt-get install -y git
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install -y git-lfs

sudo apt-get install -y python-pip
sudo python2 -m pip install gitpython

sudo apt-get install -y python3-pip
sudo python3 -m pip install gitpython

pip install sentry_sdk


#NEED when build libluaturbo-src
sudo apt-get install -y rename

#NEED when build webui_scaffold-src
sudo npm install -g beautifier --save-dev


#NEED for build libipmi_sw-6.10.0.0.0-ANY (ARM)
sudo apt install -y gcc-aarch64-linux-gnu



sudo groupadd bmc
sudo usermod -a -G bmc colin
sudo visudo
##  %bmc ALL=(root) NOPASSWD: ALL



sudo apt-get install -y meld
sudo apt-get install -y vim
sudo apt-get install -y schroot
sudo apt-get install -y nfs-kernel-server
sudo apt-get install -y tftpd-hpa
sudo apt-get install -y minicom
sudo apt-get install -y tasksel
sudo tasksel install samba-server
sudo tasksel install openssh-server
sudo apt-get install -y ipmitool
sudo pip3 install redfishtool







