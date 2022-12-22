#/usr/bin/env bash

# The following script is based on the following installation tutorial: https://docs.requarks.io/install/linux

check_install_package () {
    if [ $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") -eq 0 ];
    # Credit: https://stackoverflow.com/questions/1298066/how-can-i-check-if-a-package-is-installed-and-install-it-if-not
    then
        sudo apt install -y $1;
    fi
}

# Main script

echo "Checking if required packages are installed..."
check_install_package wget
check_install_package npm
check_install_package sqlite3

echo "Downloading installation files for Wiki.js..."
wget https://github.com/Requarks/wiki/releases/latest/download/wiki-js.tar.gz

echo "Decompressing the archive..."
mkdir wiki_temp
tar xzf wiki-js.tar.gz -C ./wiki_temp
cd wiki_temp

echo "Creating the directories..."
sudo mkdir /var/wiki/
npm rebuild sqlite3

echo "Moving the files to the right directory..."
cd ..
sudo mv wiki_temp /var/wiki
sudo mkdir /var/wiki/sqlite