# git-linked
Plays sound clips from Zelda BOTW when common git commands are used

# Setup

Copy the sound clips to your home directory
```
cp -r .git-linked ~/.git-linked
```

Add the following to your `~/.bash_profile`:
```
git () {

    # do the git command
    command git "$@"
    
    if [[ $? != 0 ]] ;
    then
        (Afplay ~/.git-linked/zelda-link-hurt.mp3 &)
        return
    fi    

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
```
