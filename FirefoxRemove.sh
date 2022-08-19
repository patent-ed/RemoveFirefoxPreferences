#!/bin/bash
# 2022.08.19 - This should be run from self service


# Define Variables
firefoxapp="/Applications/Firefox.app"
mozilla_system_plist="/Library/Preferences/org.mozilla.firefox"

MacUser=$( scutil <<< "show State:/Users/ConsoleUser" | awk '/Name :/ && ! /loginwindow/ { print $3 }' )

userPlist="/Users/$MacUser/Library/Preferences/org.mozilla.firefox.plist"

userMozilla="/Users/$MacUser/Library/Application Support/Mozilla"


# Kill firefox process
killall 'firefox'

rm -rf $firefoxapp
rm -rf $mozilla_system_plist

rm -rf "$userPlist"

rm -rf "$userMozilla"

# remove OEM autoconfig.js file
if [[ -e "/Users/$MacUser/Library/Preferences/org.mozilla.firefox.plist" ]];then
	echo "Removing config file."
    rm -rf '/Users/$MacUser/Library/Preferences/org.mozilla.firefox.plist'
fi


#rm -rf '/Users/$MacUser/Library/Preferences/org.mozilla.firefox.plist'


exit 0 
