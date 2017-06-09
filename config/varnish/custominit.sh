#!/usr/bin/env bash

# creates the files so that they really exist
touch /varnishout/varnishadm
touch /varnishout/varnishstatv

# add the cronjobs
crontab /cronjobs

# launch the cron deamon
crond

# exec the original init script for the varnish repo
exec /init.sh