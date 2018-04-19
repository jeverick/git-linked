#!/bin/bash

git () {

    # do the git command
    command git "$@"

    local audioFile

    # git status or git log
    if [[ $@ == status* || $@ == log* ]] ;
    then
        audioFile=~/.git-linked/zelda-secret.mp3
    fi

    # git commit
    if [[ $@ == commit* ]] ;
    then
        audioFile=~/.git-linked/zelda-small-item.mp3
    fi

    # git push
    if [[ $@ == push* ]] ;
    then
        audioFile=~/.git-linked/zelda-item.mp3
    fi

    # git pull (or up)
    if [[ $@ == pull* || $@ == up* ]] ;
    then
        audioFile=~/.git-linked/zelda-heart-container.mp3
    fi

    # git clone
    if [[ $@ == clone* ]] ;
    then
        audioFile=~/.git-linked/zelda-spirit-orb.mp3
    fi

    # play sound based on OS
    if [[ "$OSTYPE" == "darwin"* ]] ;
    then 
        (Afplay ${audioFile} &)
    else 
        (ffplay -autoexit -nodisp -nostats -loglevel 0 ${audioFile} &)
    fi
}
