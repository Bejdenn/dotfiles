#!/bin/bash

sudo rsync -a --chown=root:root /home/dennisbejze/.local/share/chezmoi/etc/ /etc/
