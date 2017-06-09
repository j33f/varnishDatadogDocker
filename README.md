This repo is here just to illustrate how to give some stats to datadog agent when every services are on containers.

## Explainations

The datadog agent, even into a docker container, states that varnish lives in the same machine (or container). The varnish addition will so try to launch some varnish commands to get its configuration and metrics... which, obviously, fails badly.

The clue is to provide some metrics to datadog. Thanks to cronjob, volumes and custom init script, this can me done.

Into the config directory we have two others : 
* varnish, containing the cronjobs lists, the custom init script for the varnish container and the .vcl file
* dd-agent, containing the varnish.yaml configuration file, and to bash scripts simulating the comportment of the related varnish commands.

Each minutes, some cron jobs will launch the varnish commands called by dd-agent, and put their outputs to some files into the logs directory.
Since those files are mounted as volume into both varnish and dd-agent containers (look at the docker-compose.yml file) dd-agent will see the data in them when calling the fake varnish commands.

This way, we can get some metrics for varnish, per minutes, yes, but we don't really need much super-precise-real-time data for it.