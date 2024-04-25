checkCommand() {
    if ! (type $1 > /dev/null 2>&1); then
        echo "Installing $1"
        return 1
    else
        echo "$1 already installed"
        return 0
    fi
}

checkDirectory() {
    if [ ! -d "$1" ]; then
        echo "Directory $1 does not exist"
        return 1
    else
        echo "Directory $1 already exists"
        return 0
    fi
}

checkFile() {
    if [ ! -f "$1" ]; then
        echo "File $1 does not exist"
        return 1
    else
        echo "File $1 already exists"
        return 0
    fi
}