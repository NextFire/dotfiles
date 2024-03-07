function secrets-restore
  set PRE_PWD (pwd)
  cd $HOME
  age -d -i ~/.dotfiles.key.age .secrets.tar.gz.age > .secrets.tar.gz
  tar xvf .secrets.tar.gz
  rm .secrets.tar.gz
  tree -a .secrets/
  cd $PRE_PWD
end
