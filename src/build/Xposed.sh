#!/bin/bash
# Xposed build
source ./src/build/utils.sh

LSPatch_dl(){
	dl_gh "LSPatch" "JingMatrix" "latest"
}

# Patch Revenge:
dl_gh "revenge-xposed" "revenge-mod" "latest"
LSPatch_dl
get_apk "com.discord" "discord" "bundle"
lspatch "discord" "app-release" "revenge"