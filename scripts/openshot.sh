#!/bin/bash
##########################################################################
# This script starts the installation and configuration process of the
# specified application and finally it shows a log file which contains
# reported installation steps and posible errors.
#
# Author: César Rodríguez González
# Version: 1.3
# Last modified date (dd/mm/yyyy): 18/07/2016
# Licence: MIT
##########################################################################

scriptRootFolder=`pwd`/..
. $scriptRootFolder/common/commonFunctions.sh
appName="OpenShot"
logFile="openshot.log"

prepareScript "$scriptRootFolder" "$logFile"
installAndSetupApplications $appName