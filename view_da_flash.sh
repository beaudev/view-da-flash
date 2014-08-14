#!/bin/bash 
 
# That function could be added to your bash_profile for example
 
view_daflash(){
    var=`ps -ef | grep -i flash | grep "chromium-browser --type=plugin"|nawk '{print $2}'`
    for fd in `find /proc/$var/fd -type l`;do ls -l $fd|grep -i flash &>/dev/null &&echo $fd;done| xargs vlc
}
 
# send all the current videos loaded in your chromium browser into a vlc instance byt calling at any time "view_daflash"
