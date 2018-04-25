#!/bin/sh

set -eo pipefail

# Build template
python $ROXY_BUILDER $ROXY_DATA $ROXY_TEMPLATE_NGINX    > /etc/nginx/conf.d/roxy.conf
python $ROXY_BUILDER $ROXY_DATA $ROXY_TEMPLATE_HTML     > /var/www/index.html

echo "DEBUG[roxy]: Roxy templating done, running '$@'"

exec "$@"
