#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Install `wget` with IRI support.
brew install wget --with-iri

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
# brew install ringojs
# brew install narwhal

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz

# Install other useful binaries.
brew install ack
brew install dark-mode
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install links
brew install lua
# brew install luarocks
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install tree
brew install webkit2png
brew install zopfli
brew install youtube-dl
brew install weechat --with-aspell --with-curl --with-python --with-perl --with-ruby --with-lua --with-guile
brew install jrnl

# Install Applications
brew install caskroom/cask/brew-cask
brew cask install --appdir="/Applications" launchbar
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" transmit
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" hazel
brew cask install --appdir="/Applications" flash
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" sublime-text3
brew cask install --appdir="/Applications" vlc
brew cask install --appdir="/Applications" nvalt
brew cask install --appdir="/Applications" quicklook-json
brew cask install --appdir="/Applications" skype
brew cask install --appdir="/Applications" transmission
brew cask install --appdir="/Applications" cornerstone
brew cask install --appdir="/Applications" karabiner
brew cask install --appdir="/Applications" seil
brew cask install --appdir="/Applications" chatology
brew cask install --appdir="/Applications" calibre
brew cask install --appdir="/Applications" openemu
brew cask install --appdir="/Applications" textexpander
brew cask install --appdir="/Applications" audio-hijack-pro
brew cask install --appdir="/Applications" controlplane
brew cask install --appdir="/Applications" omniplan
brew cask install --appdir="/Applications" the-unarchiver
brew cask install --appdir="/Applications" steam
brew cask install --appdir="/Applications" handbrake
brew cask install --appdir="/Applications" handbrakecli
brew cask install --appdir="/Applications" adobe-creative-cloud
brew cask install --appdir="/Applications" google-hangouts
brew cask install --appdir="/Applications" daisydisk
brew cask install --appdir="/Applications" omnifocus
brew cask install --appdir="/Applications" textmate
brew cask install --appdir="/Applications" hammerspoon
brew cask install --appdir="/Applications" devonthink-pro-office
brew cask install --appdir="/Applications" dayone-cli
brew cask install --appdir="/Applications" sequel-pro
brew cask install --appdir="/Applications" flux
brew cask install --appdir="/Applications" adium


# install fonts
brew tap caskroom/fonts
brew cask install font-source-code-pro
brew cask install font-roboto

# Remove outdated versions from the cellar.
brew cleanup
