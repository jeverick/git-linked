#!/bin/bash

git () {

    # do the git command
    command git "$@"
    local command_status=$?

    local audio_file

    # git status or git log
    if [[ $@ == status* || $@ == log* ]] ;
    then
        audio_file=~/.git-linked/zelda-secret.mp3
    fi

    # git commit
    if [[ $@ == commit* ]] ;
    then
        audio_file=~/.git-linked/zelda-small-item.mp3
    fi

    # git push
    if [[ $@ == push* ]] ;
    then
        audio_file=~/.git-linked/zelda-item.mp3
    fi

    # git pull (or up)
    if [[ $@ == pull* || $@ == up* ]] ;
    then
        audio_file=~/.git-linked/zelda-heart-container.mp3
    fi

    # git clone
    if [[ $@ == clone* ]] ;
    then
        audio_file=~/.git-linked/zelda-spirit-orb.mp3
    fi

    # command failed 
    if [ $command_status -ne 0 ] ;
    then
        audio_file=~/.git-linked/zelda-link-hurt.mp3
    fi

    # play sound based on OS
    if [[ "$OSTYPE" == "darwin"* ]] ;
    then 
        (Afplay ${audioi_file} &)
    else 
        (ffplay -autoexit -nodisp -nostats -loglevel 0 ${audio_file} &)
    fi
}
