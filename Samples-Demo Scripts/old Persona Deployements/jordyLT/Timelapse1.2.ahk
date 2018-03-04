/*
*	Description: The "mother" script control panel. This script will call other script files from button presses, 
*	and control primary navigation across all automation scripts for our end-users
*
*	To deploy: 
				1.) Setup install directory under %A_ProgramFiles%\Token\[Automation]\[scripts] [logs] [classes]  [help]
				2.) Compile (this) and add it to [automation]
				3.) Class added into program files, via [classes] - Ensure compiled classes have correct name via script #includes
				4.) Scripts are added into program files via [scripts] - Ensure compiled scripts have  the correct names per button calls below
				4.) Create inital log file structure
				5.) Test & Run
*/
#SingleInstance force ; only one instance of script can run
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent ; to make it run indefinitely
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
;-------------------
;// GUI Build Area
Gui, Add, Tab, x2 y49 w689 h394, Instagram|CrowdFire|Utils.|Help
;/INSTAGRAM - BLUESTACKS
Gui, Tab, Instagram
	Gui, Font, S16 CDefault Bold, Verdana
	Gui, Font, S20 CDefault Bold, Verdana
	Gui, Font, S26 CDefault Bold, Verdana
	Gui, Add, Text, x2 y-1 w540 h50 +, Timelapse - Instagram
	Gui, Font, S16 CDefault, Verdana
	Gui, Font, S13 CDefault, Verdana
	Gui, Font, S10 CDefault, Verdana
	Gui, Add, Button, x22 y119 w110 h40 gAutoFollowScript, Follow ;AutoFollow script to follow ppl from following listIG-BS script
	Gui, Add, Button, x152 y119 w110 h40 gLike3PicsTop5FollowersScript, Like ;This button is the Like3PicsTop5Followers IG-BS script
	Gui, Add, Button, x282 y119 w110 h40 , ...
	Gui, Add, Button, x412 y119 w110 h40 , ...
	Gui, Add, Button, x22 y189 w110 h40 gAutoFollowPSScript, Follow-PS
	Gui, Add, Button, x152 y189 w110 h40 gLike3PicsTop5FollowersPSScript, Like-PS
	Gui, Add, Button, x282 y189 w110 h40 , ...
	Gui, Add, Button, x412 y189 w110 h40 gRunAllFollowingIG, Run All-Follow
	
;/CROWDFIRE - WEBSITE
Gui, Tab, CrowdFire
	Gui, Add, Button, x52 y139 w100 h40 gAutoUnfollowScript, Unfollow
	Gui, Add, Button, x212 y139 w100 h40 gLikeViaAdmirerListScript, Like
	Gui, Add, Button, x372 y139 w100 h40 , ...
	Gui, Add, Button, x52 y219 w100 h40 , ...
	Gui, Add, Button, x212 y219 w100 h40 , ...
	Gui, Add, Button, x372 y219 w100 h40 , ...

;/CROWDFIRE - WEBSITE
Gui, Tab, CrowdFire
	Gui, Font, S26 CDefault Bold, Verdana
	Gui, Add, Text, x2 y-1 w540 h50 , Timelapse - CrowdFire
	Gui, Tab, Utils.
	Gui, Add, Text, x2 y-1 w540 h50 , Timelapse - Utilities

;/UTILITIES
Gui, Tab, Utils.
	Gui, Font, S10 CDefault, Verdana
	Gui, Add, Button, x32 y149 w120 h60 gshowMouseLocationXY, X/Y Finder
	Gui, Add, Button, x212 y149 w120 h60 ggetColourBehindMouse, Get Colour
	Gui, Add, Button, x392 y149 w120 h60 , ...

;/HELP SECTION
Gui, Tab, Help
	Gui, Font, S26 CDefault Bold, Verdana
	Gui, Add, Text, x2 y-1 w540 h50 , Timelapse - Help
	
;/INSTAGRAM - BLUESTACKS
Gui, Tab, Instagram
	Gui, Font, S5 CDefault Bold, Verdana

;/HELP SECTION
Gui, Tab, Help
	Gui, Font, S10 CDefault Bold, Verdana
	Gui, Add, Button, x22 y139 w110 h80 , Instagram Help
	Gui, Add, Button, x142 y139 w110 h80 , CrowdFire Help
	Gui, Add, Button, x262 y139 w110 h80 , Utility Help
	Gui, Add, Button, x382 y139 w110 h80 , ...
; Generated using SmartGUI Creator 4.0
Gui, Show, x127 y87 h394 w689, New GUI Window
Return


;//SCRIPT CALL SECTION
;------------------
;/INSTAGRAM-BS
Like3PicsTop5FollowersScript:
	;//Call Script to like 3 pics of top 5 followers
	RUN C:\Program Files\Token\Automation\scripts\Like3PicsOfTop5Followers.ahk
	return
AutoFollowScript:
	;//Call script auto follow new accounts 
	RUN C:\Program Files\Token\Automation\scripts\AutoFollow.ahk	
	return
Like3PicsTop5FollowersPSScript:
	;//Call script to like 3 pis of top 5 followers on parallelSpace
	RUN C:\Program Files\Token\Automation\scripts\Like3PicsOfTop5FollowersPS.ahk	
	return
AutoFollowPSScript:
	;//Call script auto follow new accounts in parallelSpace
	RUN C:\Program Files\Token\Automation\scripts\AutoFollowPS.ahk	
	return
RunAllFollowingIG:
	;//Call script auto follow new accounts in normal app and parallelSpace IG app
	RUN C:\Program Files\Token\Automation\scripts\RunAllFollowingIG.ahk	
	return

;------------------
;/CROWDFIRE-WEB APP
AutoUnfollowScript:
	RUN C:\Program Files\Token\Automation\scripts\AutoUnfollowCF.ahk
	return

LikeViaAdmirerListScript:
	RUN C:\Program Files\Token\Automation\scripts\AutoLikeViaAdmirerCF.ahk
	return

;------------------
;/UTILITY SCRIPTS
showMouseLocationXY:
	RUN C:\Program Files\Token\Automation\scripts\showMouseLocationWithCapsOn.ahk
	return

getColourBehindMouse:
	RUN C:\Program Files\Token\Automation\scripts\getColourBehindMouse.ahk
	return

;------------------
;/HELP

GuiClose:
ExitApp