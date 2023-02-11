#!/bin/bash

PLUGIN_NAME="observe-player"

cd scripting
spcomp $PLUGIN_NAME.sp -i include -o ../plugins/$PLUGIN_NAME.smx
