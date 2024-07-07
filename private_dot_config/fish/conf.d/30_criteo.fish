set -x CDT_REMOTE_CONFIG_URL https://moab-filer.crto.in/.filer/cdt/remote-config.json
set -x DEVTOOL_DIR ~/devtools
babelfish < $DEVTOOL_DIR/.criteo_init_profile | source
set -g __sdkman_custom_dir $DEVTOOL_DIR/sdkman

abbr -a cm 'cdt moab'
set -x DOCKER_HOST unix://$HOME/.rd/docker.sock
