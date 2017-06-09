#!/usr/bin/env bash

touch /varnishout/varnishadm
touch /varnishout/varnishstatv

crontab /cronjobs

crond

exec /init.sh