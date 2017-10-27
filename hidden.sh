#!/bin/bash

arg=$1
STATUS=`defaults read com.apple.finder AppleShowAllFiles`

#no args
if [ $# -eq 0 ];
then
    if [ $STATUS == YES ];
    then
        echo "Hidden files are SHOWN"
    else
        echo "Hidden files are HIDDEN"
    fi
    exit 0
fi

#help
if [ $arg == "--help" ];
then
    echo ""
    echo "--USAGE--"
    echo ""
    echo "hidden [-s][-h][-t][--help]"
    echo ""
    echo "hidden: Show hidden status"
    echo "hidden -s: Show hidden files"
    echo "hidden -h: Hide hidden files"
    echo "hidden -t: Toggle hidden files on/off"
    echo "hidden --help: Show help"
    echo ""
    exit 0
fi

#toggle
if [ $arg == "-t" ];
then
    if [ $STATUS == YES ];
    then
        defaults write com.apple.finder AppleShowAllFiles NO
        echo "Hidden files now HIDDEN"
    else
        defaults write com.apple.finder AppleShowAllFiles YES
        echo "Hidden files now SHOWN"
    fi
fi

#show
if [ $arg == "-s" ];
 
then
    defaults write com.apple.finder AppleShowAllFiles YES
    echo "Hidden files now SHOWN"
fi

#hide
if [ $arg == "-h" ];
then
    defaults write com.apple.finder AppleShowAllFiles NO
    echo "Hidden files now HIDDEN"
fi

#relaunch Finder
echo "Relaunching Finder..."
killall Finder
