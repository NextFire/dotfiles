function secrets-restore
  set PRE_PWD (pwd)
  cd $HOME
  gpg -do .secrets.tar.gz .secrets.tar.gz.gpg
  tar xvf .secrets.tar.gz
  rm .secrets.tar.gz
  tree -a .secrets/
  cd $PRE_PWD
end
