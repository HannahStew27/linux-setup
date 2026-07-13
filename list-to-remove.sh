#!/bin/bash

KEEP="network-manager-config-connectivity-ubuntu ubuntu-drivers-common ubuntu-keyring ubuntu-standard"

comm -23 \
  <(dpkg-query -W -f='${Package}\n' | sort) \
  <(echo "$KEEP" | tr ' ' '\n' | sort)
