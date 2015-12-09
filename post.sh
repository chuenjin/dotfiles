#!/usr/bin/env bash

# Ask for the administrator password upfront
#sudo -v

###############################################################################
# Karabiner                                                                   #
###############################################################################

# Install private.xml
cp -r init/private.xml ~/Library/Application\ Support/Karabiner/private.xml 2> /dev/null

# restore settings
sh init/karabiner-import.sh

# relaunch karabiner
karabiner relaunch


###############################################################################
# Seil                                                                        #
###############################################################################

# restore settings
sh init/seil-import.sh

# relaunch seil
seil relaunch



