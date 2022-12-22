#/usr/bin/env bash

# The following script is based on the following installation tutorial: https://docs.requarks.io/install/linux

check_install_package () {
    if [ $(dpkg-query -W -f='${Status}' $1 2>/dev/null | grep -c "ok installed") -eq 0 ];
    then
        sudo apt install -y $1;
    fi
}

# Main script

echo "Checking if required packages are installed..."
check_install_package wget
check_install_package npm
check_install_package sqlite3