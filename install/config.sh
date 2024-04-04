source $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/../scripts/common.sh

debugPrint "Symlink zshrc and gitconfig"
rm -rf "$HOME/.zshrc" "$HOME/.gitconfig"
ln -s "$(pwd)/configs/.zshrc" "$HOME/.zshrc"
ln -s "$(pwd)/configs/.gitconfig" "$HOME/.gitconfig"