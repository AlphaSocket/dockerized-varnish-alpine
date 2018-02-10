# alphasocket/dockerized-varnish-alpine
#### varnish-alpine
[![](https://travis-ci.org/AlphaSocket/varnish-alpine.svg?branch=master )]()\
[![](https://images.microbadger.com/badges/image/03192859189254/varnish-alpine:master.svg)]\
(https://microbadger.com/images/03192859189254/varnish-alpine:master )\
[![](https://images.microbadger.com/badges/version/03192859189254/varnish-alpine:master.svg)]\
(https://microbadger.com/images/03192859189254/varnish-alpine:master)

Varnish service on latest alpine image

## Branches & Versions


## Packages installed
- Setup dependencies:
  + varnish
- Config dependencies:
  + gettext


## Configurable envvars
~~~
CONFIG_VARNISH_USER="varnish"
CONFIG_VARNISH_PORT="$BUILD_VARNISH_PORT"
CONFIG_VARNISH_STARTUP_OPTIONS="-Ff $CONFIG_PATHS_CONF_VARNISH_SERVER"
CONFIG_VARNISH_MEMORY="1M"
CONFIG_VARNISH_WORKING_DIR="/var/lib/varnish/$(hostname)"
CONFIG_VARNISH_BACKEND_ADDRESS="webserver.cluster"
CONFIG_VARNISH_BACKEND_PORT="80"
CONFIG_VARNISH_BACKEND_RETRIES="5"
CONFIG_VARNISH_CONTROL_PANEL_STARTUP_OPTIONS="-p cli_buffer=16384 -p feature=+esi_ignore_other_elements -p vcc_allow_inline_c=on"
CONFIG_PATHS_TEMPLATES_VARNISH_SERVER="/usr/local/templates/default.vcl"
CONFIG_PATHS_CONF_VARNISH_SERVER="$BUILD_VARNISH_CONF_PATH"
~~~
