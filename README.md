View Da Flash
=============

Simple script to view embedded flash in a better player (talking here about VLC of course). The great thing about that, is you don't fight anymore with the auto lock functionnality, you can benefit of the VLC user friendly interface, even if the video is not fully loaded. Also, it's possible to save it quite easily. 

Work on *Nix, mainly used on Ubuntu tho.
Works with Firefox and Chromium as long as you use the Adobe flash plugin.

## Install
source the file, or use it with the bash-profile project.


###OneLiner setup and Usage

Get it from github and source it
```
curl -SsL https://raw.githubusercontent.com/beaudev/view-da-flash/master/view_da_flash.sh| xargs source
```

Use it as much as you want, as long as you keep using the same bash instance.
```
# view currently loaded flash videos :
view_daflash

# save currently loaded flash videos in Downloads directory (by default)
view_daflash -s 
```

## Next steps
* Add some more options for saving videos
* make it work with chrome and latest chromium (under 14.04, chromium seems to use flash plugin in a different way)
* your need, feel free to ask, we never know =] 
