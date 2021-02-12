export OS_NAME=$(grep '^NAME=' /etc/os-release | cut -c 6-)
export OS_ID=$(grep '^ID=' /etc/os-release | cut -c 4-)
export OS_VERSION_ID=$(grep '^VERSION_ID=' /etc/os-release | cut -c 12-)
export OS_VERSION_CODENAME=$(grep '^VERSION_CODENAME=' /etc/os-release | cut -c 18-)

echo "OS_NAME = $(printenv OS_NAME)"
echo "OS_ID = $(printenv OS_ID)"
echo "OS_VERSION_ID = $(printenv OS_VERSION_ID)"
echo "OS_VERSION_CODENAME = $(printenv OS_VERSION_CODENAME)"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    if [[ "$OS_ID" == "ubuntu" ]]; then
        if [[ "$OS_VERSION_ID" == "\"16.04\"" ]]; then 
            echo "hit 1604"   
        elif [[ "$OS_VERSION_ID" == "\"18.04\"" ]]; then
            echo "hit 1804"   
        elif [[ "$OS_VERSION_ID" == "\"20.04\"" ]]; then
            echo "hit 2004"   
        fi
    elif [[ "$OS_ID" == "debian" ]]; then
        if [[ "$OS_VERSION_ID" == "\"10\"" ]]; then
            echo "hit debian 10"   
        fi
    fi
elif [[ "$OSTYPE" == "linux-gnueabihf" ]]; then
    if [[ "$OS_ID" == "raspbian" ]]; then
        echo "hit raspbian"   
    fi
else
    echo "Microsoft has no packages for this operating system."
fi