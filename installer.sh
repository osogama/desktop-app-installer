#!/bin/bash
##########################################################################
# This is the main script that executes a menu to select applications to
# install. After that, it starts the installation and configuration
# process and finally it shows a log file which contains reported
# installation steps and posible errors.
#
# Author: César Rodríguez González
# Version: 1.3
# Last modified date (dd/mm/yyyy): 02/08/2016
# Licence: MIT
##########################################################################

scriptRootFolder=`pwd`
. $scriptRootFolder/common/commonFunctions.sh
. $scriptRootFolder/menu/menuFunctions.sh
logFile="linux-app-installer.log"

prepareScript "$scriptRootFolder" "$logFile"
if [ -n $DISPLAY ]; then
	notify-send -i "$installerIconFolder/tux96.png" "$linuxAppInstallerTitle" "$linuxAppInstallerComment\n$linuxAppInstallerAuthor"
fi

declare -a appsToInstall=( $(menu) )
if [ ${#appsToInstall[@]} -gt 0 ]; then
	if [ -n $DISPLAY ]; then
		notify-send -i "$installerIconFolder/applications-other.svg" "$linuxAppInstallerTitle" "$installingSelectedApplications"
	fi
	# Install all selected applications
	installAndSetupApplications appsToInstall[@]
fi
