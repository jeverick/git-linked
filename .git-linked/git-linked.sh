#!/bin/bash

git () {

    # do the git command
    command git "$@"
    
    # git status or git log
    if [[ $@ == status* || $@ == log* ]] ;
    then
        (Afplay ~/.git-linked/zelda-secret.mp3 &)
    fi

    # git commit
    if [[ $@ == commit* ]] ;
    then
        (Afplay ~/.git-linked/zelda-small-item.mp3 &)
    fi

    # git push
    if [[ $@ == push* ]] ;
    then
        (Afplay ~/.git-linked/zelda-item.mp3 &)
    fi

    # git pull (or up)
    if [[ $@ == pull* || $@ == up* ]] ;
    then
        (Afplay ~/.git-linked/zelda-heart-container.mp3 &)
    fi

    # git clone
    if [[ $@ == clone* ]] ;
    then
        (Afplay ~/.git-linked/zelda-spirit-orb.mp3 &)
    fi

}
