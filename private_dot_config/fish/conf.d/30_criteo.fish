set -x CDT_REMOTE_CONFIG_URL https://moab-filer.crto.in/.filer/cdt/remote-config.json

##########
# https://criteo.sourcegraphcloud.com/review.crto.in/software-factory/cbt@bcd679c39689cc79f5061816a749370a4981f655/-/blob/scripts/developer-install/devtools/install/criteo_init_profile.sh
##########
# Software Versions
set -x JDK_VERSION 8.0.292-zulu
set -x GROOVY_VERSION 2.5.9
set -x GRADLE_VERSION 7.1.1
set -x MAVEN_VERSION 3.9.1
set -x PYTHON39_VERSION 3.9.13
set -x PYTHON311_VERSION 3.11.8
set -x PYTHON_VERSION $PYTHON39_VERSION
set -x NODE18_VERSION 18.18.2
set -x NODE18_NPM_VERSION 9.8.1
set -x NODE20_VERSION 20.15.0
set -x NODE20_NPM_VERSION 10.7.0
set -x NODE_VERSION $NODE18_VERSION
set -x DOTNET2_VERSION 2.1.818
set -x DOTNET3_VERSION 3.1.300
set -x DOTNET5_VERSION 5.0.403
set -x DOTNET6_VERSION 6.0.419
set -x DOTNET8_VERSION 8.0.100
set -x DOTNET_VERSION $DOTNET6_VERSION
set -x DOTNET_SDK_VERSION $DOTNET6_VERSION

set -x DEVTOOL_DIR $HOME/devtools
set -x DISTRIB_NAME macos
set -x DISTRIB_VERSION $(sw_vers -productVersion)

set -x HOME_BIN $HOME/bin
fish_add_path -mP $HOME_BIN
set -x DEVTOOL_BIN $DEVTOOL_DIR/bin
fish_add_path -mP $DEVTOOL_BIN

set -x CRITEOROOT $DEVTOOL_DIR/criteoroot

# JVM Variables
set -x GRADLE_USER_HOME $DEVTOOL_DIR/.gradle_home
set -x GRADLE_HOME $GRADLE_USER_HOME
set -x M2_REPO $DEVTOOL_DIR/.m2

# DotNET Variables
set -x NUGET_HTTP_CACHE_PATH $DEVTOOL_DIR/.nuget/http-cache
set -x NUGET_PACKAGES $DEVTOOL_DIR/.nuget/packages
set -x NUGET_PLUGINS_CACHE_PATH $DEVTOOL_DIR/.nuget/plugin-cache
set -x DOTNET_ROOT $DEVTOOL_DIR/dotnet
fish_add_path -mP $DOTNET_ROOT

# Python Varables
set -x PYTHON_CONF_DIR $HOME/.pip
set -x PYTHON_CONF_FILE $PYTHON_CONF_DIR/pip.conf
set -x PYENV_ROOT $DEVTOOL_DIR/pyenv
set -x PYENV_BIN $PYENV_ROOT/bin
fish_add_path -mP $PYENV_BIN
set -x PYENV_SHIMS $PYENV_ROOT/shims
fish_add_path -mP $PYENV_SHIMS
set -x PYENV_HOME $PYENV_ROOT
set -x PYENV $PYENV_ROOT

# Ruby Variables
set -x RVM_DIR $DEVTOOL_DIR/rvm
set -x RVM_BIN $RVM_DIR/bin
fish_add_path -mP $RVM_BIN

set -x SDKMAN_DIR $DEVTOOL_DIR/sdkman

# Node/NVM Variables
set -x NVM_DIR $DEVTOOL_DIR/nvm
set -x NVM_HOME $NVM_DIR
set -x NVM_SYMLINK $NVM_HOME/nodejs
fish_add_path -mP $NVM_HOME
fish_add_path -mP $NVM_SYMLINK
##########

fish_add_path -mP $SDKMAN_DIR/candidates/*/current/bin
set -x DOCKER_HOST unix://$HOME/.rd/docker.sock
abbr -a cm 'cdt moab'
