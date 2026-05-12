#!/bin/bash
# Twitter Piko
source src/build/utils.sh

piko_dl(){
	dl_gh "morphe-cli" "MorpheApp" "latest"
	dl_gh "piko" "crimera" "latest"
}

1() {
	# Patch Twitter Piko:
	piko_dl
	get_patches_key "twitter-piko"
	get_apk "com.twitter.android" "twitter-stable" "bundle_extract" "universal" "120-640dpi" "Android 9.0+" 
	split_editor "twitter-stable" "twitter-stable"
	patch "twitter-stable" "piko" "morphe"
	# Patch Twitter Piko Arm64-v8a:
	get_patches_key "twitter-piko"
	split_editor "twitter-stable" "twitter-arm64-v8a-stable" "exclude" "split_config.armeabi_v7a split_config.x86 split_config.x86_64 split_config.mdpi split_config.hdpi split_config.xhdpi split_config.xxhdpi split_config.tvdpi"
	patch "twitter-arm64-v8a-stable" "piko" "morphe"
}
2() {
	piko_dl
	# Patch Instagram
	get_patches_key "instagram-piko"
 	get_apk "com.instagram.android" "instagram-arm64-v8a" "bundle" "arm64-v8a" "120-640dpi"  "Android 9.0+"
	patch "instagram-arm64-v8a" "piko" "morphe"
}
case "$1" in
    1)
        1
        ;;
    2)
        2
        ;;
esac
