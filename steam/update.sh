#!/bin/bash

set -e

/usr/bin/steamcmd \
    +login anonymous \
    +force_install_dir /home/valheim/server \
    +app_update $APP_ID \
    +exit
