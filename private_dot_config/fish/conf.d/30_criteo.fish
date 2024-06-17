set -x CDT_REMOTE_CONFIG_URL https://moab-filer.crto.in/.filer/cdt/remote-config.json
set -x DEVTOOL_DIR ~/devtools
source $DEVTOOL_DIR/.criteo_init_profile.fish
pyenv init - | source
pyenv virtualenv-init - | source

set -g __sdkman_custom_dir ~/devtools/sdkman

set -x DOCKER_HOST unix://$HOME/.rd/docker.sock

abbr -a cm cdt moab
