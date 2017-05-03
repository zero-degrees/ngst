#!/bin/bash

REQUIRED_NODE_VERSION="7.6"
CURRENT_NODE_VERSION=$(node -v | sed 's/^v//' | sed --posix 's/\([0-9]\{1,\}\.[0-9]\{1,\}\).*/\1/')

UI_HOST=$(node cli/getConfigVal.js ui.host)
UI_PORT=$(node cli/getConfigVal.js ui.port)