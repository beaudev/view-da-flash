#!/bin/bash -x
 
# That function could be added to your bash_profile for example
 # send all the current videos loaded in your chromium browser or in Firefox into a vlc instance byt calling at any time "view_daflash"
 
view_daflash(){
    # Chromium with flashplugin
    flash_procs=`ps -ef | grep -i flash | grep "chromium-browser --type=plugin"|nawk '{print $2}'`
    # Firefox with flashplugin
    flash_procs="${flash_procs[@]} `ps -ef | grep -i flash | grep "firefox"|nawk '{print $2}'`"
    flash_vid=""
	for proc in ${flash_procs[@]}; do 
		for fd in `find /proc/$proc/fd -type l`;do ls -l $fd|grep -i flash &>/dev/null && flash_vid="${flash_vid[@]} $fd" ;done
	done
	[ ! -z "$flash_vid" ] && vlc $flash_vid || echo "Sorry No Flash Videos Found.."
}
