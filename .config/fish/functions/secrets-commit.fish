function secrets-commit
  set PRE_PWD (pwd)
  cd $HOME
  tar cvfz .secrets.tar.gz .secrets/
  age -r age1p6dku6ru5c8u5enlzx2neg2l7l508adl3kxlq5mhpcjvx2vpt9gqjgjg7c .secrets.tar.gz > .secrets.tar.gz.age
  rm .secrets.tar.gz
  dotfiles add .secrets.tar.gz.age
  cd $PRE_PWD
  dotfiles status
end
