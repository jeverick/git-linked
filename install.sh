cp -r .git-linked ~
command='source ~/.git-linked/git-linked.sh' 
if [[ $SHELL == */zsh && -z $(grep "$command" ~/.zshrc) ]] ;
then
  echo "$command\n" >> ~/.zshrc
fi
if [[ $SHELL == */bash && -z $(grep "$command" ~/.bash_profile) ]] ;
then
  echo "$command\n" >> ~/.bash_profile
fi

