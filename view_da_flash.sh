#!/bin/bash -x
 
# That function could be added to your bash_profile for example
 # send all the current videos loaded in your chromium browser or in Firefox into a vlc instance byt calling at any time "view_daflash"
 
view_daflash(){
	com_func_file=$( dirname "${BASH_SOURCE[0]}" )/common_functions.sh
	if [ ! -f ${com_func_file} ]; then
		curl -sSL https://raw.github.com/jmeyo/CommonBashScripts/master/common_functions.sh >${com_func_file}	
	fi
	source ${com_func_file}
	
	while getopts "s" optname
	do
		case "$optname" in
		  "s")
			SAVE_IT=true
			;;         
		  *)
			cecho -e "\n\t-> $OPTARG Bad options\n\n" $red
			help
			;;
		esac
	done
	[ ! -z "$1" ] && saveit=true
    # Chromium with flashplugin
    flash_procs=`ps -ef | grep -i flash | grep "chromium-browser --type=plugin"|nawk '{print $2}'`
    # Firefox with flashplugin
    flash_procs="${flash_procs[@]} `ps -ef | grep -i flash | grep "firefox"|nawk '{print $2}'`"
    flash_vids=""
	for proc in ${flash_procs[@]}; do 
		for fd in `find /proc/$proc/fd -type l`;do ls -l $fd|grep -i flash &>/dev/null && flash_vids="${flash_vids[@]} $fd" ;done
	done
	if [ ! -z "$flash_vids" ]; then
		if [ "$SAVE_IT" == "true" ];then
			for flash_vid in ${flash_vids[@]}; do
				file_name=$(echo ${flash_vid}| sed 's@.*/@@')
				file_name_path=$(eval echo "${save_path:-"~/Downloads/"}${file_name}")
				[ -f "${file_name_path}.avi" ] && file_name_path=$(echo ${file_name_path}"_"${RANDOM}".avi")
				cp $flash_vid $file_name_path
				cecho "Video saved under \"$file_name_path\"" $green
			done
		else
			vlc $flash_vids || cecho "Sorry. No Flash Video Found.." $red
		fi
	fi 
}
