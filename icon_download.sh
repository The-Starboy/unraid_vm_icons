# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# #  Download custom vm icons from github and add them to Unraid server # #
# #  by - SpaceinvaderOne                                               # # 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# #  Variables - (other variables set in container template             # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Directory for downloaded icons to be stored
DIR="/config/icons"

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# #  Functions                                                          # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# Delete icon store if present and delete is set to yes in template
shall_i_delete() {
	if [ -d $DIR ] && [ $delete == "yes" ]; then
		
	rm -r $DIR
	echo "I have deleted all vm icons ready to download fresh icons to sync"
    echo "."
    echo "."
else
	echo "  ......continuing."

	fi					

}


# Create icon directory if not present if directory exists sync contents to vm manger and exit
download_or_sync() {
	if [ ! -d $DIR ] ; then
		
	mkdir -vp $DIR
	echo "I have created the icon store directory & now will start downloading selected icons"
	
	if [ -d /config/unraid_vm_icons ] ; then
    rm -r /config/unraid_vm_icons
    fi
	git -C /config clone https://github.com/SpaceinvaderOne/unraid_vm_icons.git
	downloadwindows
	downloadlinux
	downloadfreebsd
	downloadother
	downloadmacos
    echo "."
    echo "."
	echo "icons downloaded and synced"
else
	
    echo "."
    echo "."
	echo "Icons downloaded previously."
	echo "icons synced"

	fi
	rm /unraid_vm_icons/*.png	
	rsync -a $DIR/* /unraid_vm_icons
	playtune		
		

}

# Keep stock Unraid VM icons if set in template
downloadwindows() {
    if [ $stock == "yes" ] ; then
	rsync -a /config/unraid_vm_icons/icons/Stock_Icons/* $DIR
			else
				echo "  unraid stock  icons not wanted......continuing."
			    echo "."
			    echo "."


fi
}

# Download windows based OS icons if set in template
downloadwindows() {
    if [ $windows == "yes" ] ; then
	rsync -a /config/unraid_vm_icons/icons/Windows/* $DIR
			else
				echo "  windows based os icons not wanted......continuing."
			    echo "."
			    echo "."


fi
}

# Download linux based OS icons if set in template
downloadlinux() {
    if [ $linux == "yes" ] ; then
    rsync -a /config/unraid_vm_icons/icons/Linux/* $DIR
			else
				echo "  linux based os icons not wanted......continuing."
			    echo "."
			    echo "."


fi
}


# Download freebsd based OS icons if set in template
downloadfreebsd() {
    if [ $freebsd == "yes" ] ; then
	rsync -a /config/unraid_vm_icons/icons/Freebsd/* $DIR
			else
				echo "  freebsd based os icons not wanted......continuing."
			    echo "."
			    echo "."


fi
}

# Download other OS icons if set in template
downloadother() {
    if [ $other == "yes" ] ; then
	rsync -a /config/unraid_vm_icons/icons/Other/* $DIR
			else
				echo "  other os icons not wanted......continuing."
			    echo "."
			    echo "."


fi
}

# Download macOS based OS icons if set in template
downloadmacos() {
    if [ $macos == "yes" ] ; then
	rsync -a /config/unraid_vm_icons/icons/macOS/* $DIR
			else
				echo "  macos based os icons not wanted......continuing."
			    echo "."
			    echo "."


fi
}

# Play tune on sync through beep speaker
playtune() {
    if [ $tune == "yes" ] ; then

beep -f 130 -l 100 -n -f 262 -l 100 -n -f 330 -l 100 -n -f 392 -l 100 -n -f 523 -l 100 -n -f 660 -l 100 -n -f 784 -l 300 -n -f 660 -l 300 -n -f 146 -l 100 -n -f 262 -l 100 -n -f 311 -l 100 -n -f 415 -l 100 -n -f 523 -l 100 -n -f 622 -l 100 -n -f 831 -l 300 -n -f 622 -l 300 -n -f 155 -l 100 -n -f 294 -l 100 -n -f 349 -l 100 -n -f 466 -l 100 -n -f 588 -l 100 -n -f 699 -l 100 -n -f 933 -l 300 -n -f 933 -l 100 -n -f 933 -l 100 -n -f 933 -l 100 -n -f 1047 -l 400

fi
}


shall_i_delete
download_or_sync

