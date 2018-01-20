#
# Do not change content here, image automatically built
#
FROM alpine:latest

ENV \
	GENERAL_DOCKER_USER="03192859189254" \
	GENERAL_KEYS_TRUE="True" \
	GENERAL_KEYS_FALSE="False" \
	GENERAL_KEYS_DEV="dev" \
	GENERAL_KEYS_PRD="prd" \
	BUILD_NAME="varnish-alpine" \
	BUILD_BRANCH="latest" \
	BUILD_COMMIT="cdc9af8" \
	BUILD_VERSION="latest" \
	BUILD_ENV="prd" \
	BUILD_VARNISH_CONF_PATH="/etc/varnish/default.vcl" \
	BUILD_VARNISH_PORT="80" \
	BUILD_DOCKERFILE_IMAGE="alpine:latest" \
	BUILD_DOCKERFILE_PORTS_MAIN="80" \
	BUILD_DOCKERFILE_CMD="varnishd -Ff /etc/varnish/default.vcl" \
	SETUP_DEPENDENCIES_BUILD="gettext" \
	SETUP_DEPENDENCIES_RUNTIME="varnish" \
	CONFIG_VARNISH_USER="varnish" \
	CONFIG_VARNISH_PORT="80" \
	CONFIG_VARNISH_MEMORY="1M" \
	CONFIG_VARNISH_WORKING_DIR="/var/lib/varnish/$(hostname)" \
	CONFIG_VARNISH_BACKEND_ADDRESS="webserver.cluster" \
	CONFIG_VARNISH_BACKEND_PORT="80" \
	CONFIG_VARNISH_BACKEND_RETRIES="5" \
	CONFIG_PATHS_TEMPLATES_VARNISH_SERVER="/usr/local/templates/default.vcl" \
	CONFIG_PATHS_CONF_VARNISH_SERVER="/etc/varnish/default.vcl"

ADD envvars /usr/local/envvars
ADD bin/setup /usr/local/bin/setup
ADD bin/config /usr/local/bin/config
ADD templates /usr/local/templates

RUN chmod +rx /usr/local/bin/setup && \
    chmod +rx /usr/local/bin/config && \
    sync && \
    /usr/local/bin/setup 

EXPOSE 80 

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/usr/local/bin/config && varnishd -Ff $BUILD_VARNISH_CONF_PATH"]