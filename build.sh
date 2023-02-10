#!/bin/bash

PLUGIN_NAME="observe-player"

cd scripting
spcomp $PLUGIN_NAME.sp -o ../plugins/$PLUGIN_NAME.smx
