#!/bin/bash

git () {

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

    # if we have an audio file, play it
    if [[ -n "${audio_file}" ]] ;
    then
        # play sound based on OS
        if [[ "$OSTYPE" == "darwin"* ]] ;
        then 
            (Afplay "${audio_file}" &)
        else 
            (ffplay -autoexit -nodisp -nostats -loglevel 0 ${audio_file} &)
        fi
    fi

    # do the git command
    command git "$@"

    # command failed
    if [ $? -ne 0 ] ;
    then
        audio_file=~/.git-linked/zelda-link-hurt.mp3
         # play sound based on OS
        if [[ "$OSTYPE" == "darwin"* ]] ;
        then
            (Afplay "${audio_file}" &)
        else
            (ffplay -autoexit -nodisp -nostats -loglevel 0 ${audio_file} &)
        fi

    fi
}
