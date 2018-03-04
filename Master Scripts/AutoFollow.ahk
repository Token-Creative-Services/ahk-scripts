 ; DESCRIPTION:      Acess the 'following' list of account, select top 8 accounts, and follow 'X' channels (8x25=200) 
 ; START:            Full screen 'Bluestacks', with the 'Instagram' app open. This script will run when BlueStacks is in view 
 ; Created By:       Jordan Snider
 ; Hot Keys: [`]-Exit | [TAB]-Pause
 ;
 ; ----------------------------------------------------
 ; ----------------------------------------------------

#SingleInstance force ; only one instance of script can run
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ProgramFiles% ; Ensures a consistent starting directory.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

;#include C:\Users\jsnider\Google Drive\Token Creative Services\Web\Apps\AutoHotKey\scripts\Classes\instagramBSClass.ahk ;Import class file ; FOR DEV****************
#include C:\Program Files\Token\Automation\classes\instagramBSClass.ahk  																	; FOR LIVE***************

;Set our toolTip progress indicator to show what script is currently executing. To start, we say initializing
CoordMode, ToolTip, Screen ; makes tooltip to appear at position, relative to screen.
tooltipText := "AutoFollow (Initializing)..."
tooltip %tooltipText%, 0, 0 ; display tooltip at coordinates x0 y0.
;-----------------------------------
;instantiate new object of class type
igApp := New InstagramBS
;call method to set all attribute's of class																													
igApp.assignScreenResolution()
;set our load times per the selection in the form/what is passed as a param to this script
myVar = %1%

if (myVar = "1")
{
	igApp.assignLoadTimes(1)
}
else if (myVar = "2")
{
	igApp.assignLoadTimes(2)
}
else if (myVar = "3")
{
	igApp.assignLoadTimes(3)
}
else if (myVar = "4")
{
	igApp.assignLoadTimes(4)
}
else if myVar = 
{
	MsgBox, Passed speed ratio was blank, running at default speed
	igApp.assignLoadTimes(2)
}
else
{
	MsgBox, Passed speed ratio was unsupported, running at default speed
	igApp.assignLoadTimes(2)
}

;Set the toolTip to state it is currently awaiting user input
tooltipText := "AutoFollow (Awaiting Input)..."
tooltip %tooltipText%, 0, 0 ; display tooltip at coordinates x0 y0.
;-----------------------------------
;Create GUI and ask how many accounts are currently logged in so script 
;only runs against the actual # of accounts the user has signed in
;-----------------------------------
Gui, New
Gui, Add, Text,, # Accounts logged into IG:
Gui, Add, Edit, vNumAccounts
Gui, Add, Button, Default gOK, OK
Gui, Show
return
;----------------
OK:
Gui, Submit
	;Set the toolTip to state it is currently executing
	tooltipText := "AutoFollow (Running)..."
	tooltip %tooltipText%, 0, 0 ; display tooltip at coordinates x0 y0.
	;---------
	; FIRST ACCOUNT - Always run against first account
	; Click the profile button to ensure we start on the right page
	igApp.clickProfileButton()
	; Click on the logged in account's followingList
	igApp.clickFollowingList()
	;On the following page, click the [FIRST] person  ;MsgBox, Firstperson
		igApp.clickFirstProfileFollower()
		;Hit the dropdown and follow across the feed
		igApp.clickAndFollowFromProfilePageFeed()
	; On the following page, click the [SECOND] person ;MsgBox, secondperson
		igApp.clickSecondProfileFollower()
		;Hit the dropdown and follow across the feed
		igApp.clickAndFollowFromProfilePageFeed()
	; On the following page, click the [THIRD] person ;MsgBox, thirdperson
		igApp.clickThirdProfileFollower()
		;Hit the dropdown and follow across the feed
		igApp.clickAndFollowFromProfilePageFeed()
	; On the following page, click the [FORTH] person ;MsgBox, forthperson
		igApp.clickForthProfileFollower()
		;Hit the dropdown and follow across the feed
		igApp.clickAndFollowFromProfilePageFeed()
	; On the following page, click the [FIFTH] person ;MsgBox, fifthperson
		igApp.clickFifthProfileFollower()
		;Hit the dropdown and follow across the feed
		igApp.clickAndFollowFromProfilePageFeed()
	; On the following page, click the [SIXTH] person ;MsgBox, sixthperson
		igApp.clickSixthProfileFollower()
		;Hit the dropdown and follow across the feed
		igApp.clickAndFollowFromProfilePageFeed()
	; On the following page, click the [SEVENTH] person ;MsgBox, seventhperson
		igApp.clickSeventhProfileFollower()
		;Hit the dropdown and follow across the feed
		igApp.clickAndFollowFromProfilePageFeed()
	; On the following page, click the [EIGHTH] person ;MsgBox, LASTperson
		igApp.clickEighthProfileFollower()
		;Hit the dropdown and follow across the feed
		igApp.clickAndFollowFromProfilePageFeed()
	; go back to main profile page (of account logged in as)
	igApp.goBackToProfileClick()

	; SECOND ACCOUNT
	if (numAccounts >= 2) {
		; IF the IG instances has two or more accouts logged in, switch to the second logged in account in the list
		igApp.clickSecondLoggedInAccount() 
		; Click the profile button to ensure we start on the right page
		igApp.clickProfileButton()
		; Click on the logged in account's followingList
		igApp.clickFollowingList()
		;On the following page, click the [FIRST] person  ;MsgBox, Firstperson
			igApp.clickFirstProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [SECOND] person ;MsgBox, secondperson
			igApp.clickSecondProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [THIRD] person ;MsgBox, thirdperson
			igApp.clickThirdProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [FORTH] person ;MsgBox, forthperson
			igApp.clickForthProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [FIFTH] person ;MsgBox, fifthperson
			igApp.clickFifthProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [SIXTH] person ;MsgBox, sixthperson
			igApp.clickSixthProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [SEVENTH] person ;MsgBox, seventhperson
			igApp.clickSeventhProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [EIGHTH] person ;MsgBox, LASTperson
			igApp.clickEighthProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; go back to main profile page (of account logged in as)
		igApp.goBackToProfileClick()
	}
	if (numAccounts >= 3) {
		; IF the IG instances has three or more accouts logged in, switch to the third logged in account in the list
		igApp.clickThirdLoggedInAccount() 
		; Click the profile button to ensure we start on the right page
		igApp.clickProfileButton()
		; Click on the logged in account's followingList
		igApp.clickFollowingList()
		;On the following page, click the [FIRST] person  ;MsgBox, Firstperson
			igApp.clickFirstProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [SECOND] person ;MsgBox, secondperson
			igApp.clickSecondProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [THIRD] person ;MsgBox, thirdperson
			igApp.clickThirdProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [FORTH] person ;MsgBox, forthperson
			igApp.clickForthProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [FIFTH] person ;MsgBox, fifthperson
			igApp.clickFifthProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [SIXTH] person ;MsgBox, sixthperson
			igApp.clickSixthProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [SEVENTH] person ;MsgBox, seventhperson
			igApp.clickSeventhProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [EIGHTH] person ;MsgBox, LASTperson
			igApp.clickEighthProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; go back to main profile page (of account logged in as)
		igApp.goBackToProfileClick()
	}
	if (numAccounts >= 4) {
		; IF the IG instances has four or more accouts logged in, switch to the forth logged in account in the list
		igApp.clickForthLoggedInAccount() 
		; Click the profile button to ensure we start on the right page
		igApp.clickProfileButton()
		; Click on the logged in account's followingList
		igApp.clickFollowingList()
		;On the following page, click the [FIRST] person  ;MsgBox, Firstperson
			igApp.clickFirstProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [SECOND] person ;MsgBox, secondperson
			igApp.clickSecondProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [THIRD] person ;MsgBox, thirdperson
			igApp.clickThirdProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [FORTH] person ;MsgBox, forthperson
			igApp.clickForthProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [FIFTH] person ;MsgBox, fifthperson
			igApp.clickFifthProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [SIXTH] person ;MsgBox, sixthperson
			igApp.clickSixthProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [SEVENTH] person ;MsgBox, seventhperson
			igApp.clickSeventhProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [EIGHTH] person ;MsgBox, LASTperson
			igApp.clickEighthProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; go back to main profile page (of account logged in as)
		igApp.goBackToProfileClick()
	}
	if (numAccounts >= 5) {
		; IF the IG instances has five or more accouts logged in, switch to the fifth logged in account in the list
		igApp.clickFifthLoggedInAccount() 
		; Click the profile button to ensure we start on the right page
		igApp.clickProfileButton()
		; Click on the logged in account's followingList
		igApp.clickFollowingList()
		;On the following page, click the [FIRST] person  ;MsgBox, Firstperson
			igApp.clickFirstProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [SECOND] person ;MsgBox, secondperson
			igApp.clickSecondProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [THIRD] person ;MsgBox, thirdperson
			igApp.clickThirdProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [FORTH] person ;MsgBox, forthperson
			igApp.clickForthProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [FIFTH] person ;MsgBox, fifthperson
			igApp.clickFifthProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [SIXTH] person ;MsgBox, sixthperson
			igApp.clickSixthProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [SEVENTH] person ;MsgBox, seventhperson
			igApp.clickSeventhProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; On the following page, click the [EIGHTH] person ;MsgBox, LASTperson
			igApp.clickEighthProfileFollower()
			;Hit the dropdown and follow across the feed
			igApp.clickAndFollowFromProfilePageFeed()
		; go back to main profile page (of account logged in as)
		igApp.goBackToProfileClick()
	}
	if (numAccounts > 5) {
		MsgBox, Script does not support this many accounts. Please contact web/admin team to have additional acocunt spaces added
		ExitApp
	}
	;Set the toolTip to state it is currently executing
	tooltipText := "AutoFollow Finished!"
	tooltip %tooltipText%, 0, 0 ; display tooltip at coordinates x0 y0.
	MsgBox, AutoFollow script has been completed!
	ExitApp
	
	;Hot key to pause the script
	Tab::Pause

	  ;---------
	
	;hot key to kill app (looping present)
	`::ExitApp
	
