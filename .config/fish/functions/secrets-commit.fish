function secrets-commit
  set PRE_PWD (pwd)
  cd $HOME
  tar cvfz .secrets.tar.gz .secrets/
  gpg -er NextFire --yes .secrets.tar.gz
  rm .secrets.tar.gz
  dotfiles add .secrets.tar.gz.gpg
  cd $PRE_PWD
  dotfiles status
end
