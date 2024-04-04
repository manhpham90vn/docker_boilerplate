debugPrint() {
    bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/info.sh "$1"
}

checkApp() {
    if ! [ -x "$(command -v $1)" ]; then
        debugPrint "$1 is not installed"
        return 1
    fi
    debugPrint "$1 is installed"
    return 0
}

checkDir() {
    if [ -d "$1" ]; then
        debugPrint "$1 exists"
        return 0
    fi
    debugPrint "$1 does not exist"
    return 1
}

checkFile() {
    if [ -f "$1" ]; then
        debugPrint "$1 exists"
        return 0
    fi
    debugPrint "$1 does not exist"
    return 1
}

install() {
    bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/../install/$1.sh
}