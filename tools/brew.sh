# dump brew packages and casks to Brewfile
brew bundle dump --formula --cask --tap --describe --file=Brewfile --force

# install brew packages and casks from Brewfile
brew bundle --file=Brewfile

# cleanup
brew cleanup

# install package from brew
brew install zsh

# install package from brew cask
brew install --cask google-chrome

# remove package or cask from brew
brew uninstall zsh

# remove other dependencies
brew autoremove

# list all installed packages
brew list

# list all installed casks
brew list --cask

# list all outdated packages
brew outdated

# upgrade all outdated packages
brew upgrade

# upgrade specific package
brew upgrade zsh