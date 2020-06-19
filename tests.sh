#!/bin/bash

set -xe

#Test validty
jq . < infos.json > /dev/null
#Ensure all nodes have a maintainer with a name
jq '.[] | .maintainer | has("name") | not | select(.) | error("Missing maintainer name")' < infos.json > /dev/null

#Ensure all nodes have a community with telegram link
jq '.[] | .community | has("telegram") | not | select(.) | error("Missing Telegram community")' < infos.json > /dev/null

#Ensure all nodes have a way to match a firmware
jq '.[] | has("match_property") | not | select(.) | error("Missing match_property")' < infos.json > /dev/null
jq '.[] | has("match_value") | not | select(.) | error("Missing match_value")' < infos.json > /dev/null
