# git-linked
Plays sound clips from Zelda BOTW when common git commands are used

# Setup

Copy the sound clips to your home directory
```
cp -r zelda-clips ~
```

Add the following to your `~/.bash_profile`:
```
git () {

    # do the git command
    command git "$@"
    
    if [[ $? != 0 ]] ;
    then
        return
    fi    

    # git status or git log
    if [[ $@ == status* || $@ == log* ]] ;
    then
        (Afplay ~/zelda-clips/zelda-secret.mp3 &)
    fi

    # git commit
    if [[ $@ == commit* ]] ;
    then
        (Afplay ~/zelda-clips/zelda-small-item.mp3 &)
    fi

    # git push
    if [[ $@ == push* ]] ;
    then
        (Afplay ~/zelda-clips/zelda-item.mp3 &)
    fi

    # git pull (or up)
    if [[ $@ == pull* || $@ == up* ]] ;
    then
        (Afplay ~/zelda-clips/zelda-heart-container.mp3 &)
    fi

    # git clone
    if [[ $@ == clone* ]] ;
    then
        (Afplay ~/zelda-clips/zelda-spirit-orb.mp3 &)
    fi

}
```
