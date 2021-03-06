 ; DESCRIPTION:      Acess the 'following' list of account, select top 8 accounts, and follow 'X' channels (8x25=200) 
 ; START:            Full screen 'Bluestacks', with the 'Instagram' app via Parallel Space opened
 ; Created By:       Jordan Snider
 ; Last Updated:     12/16/2016
 ; Hot Keys: [P]-Exit
 ;
 ; DEPLOYED FOR: Jordy's LT
 ; ----------------------------------------------------
 ; ----------------------------------------------------

#SingleInstance force ; only one instance of script can run
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ProgramFiles% ; Ensures a consistent starting directory.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

;#include C:\Users\jsnider\Google Drive\Token Creative Services\Web\Apps\AutoHotKey\scripts\Classes\instagramBSClass.ahk ;Import class file ; FOR DEV****************
#include C:\Program Files\Token\Automation\classes\instagramBSClass.ahk  																	; FOR LIVE***************

;instantiate new object of class type
igApp := New InstagramBS
;call method to set all attribute's of class, based on Jordy's  LT
igApp.SetToJSniderLaptop()																													;************************
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
		igApp.clickSecondLoggedInAccountParallelSpace() 
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
		igApp.clickThirdLoggedInAccountParallelSpace() 
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
		igApp.clickForthLoggedInAccountParallelSpace() 
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
		igApp.clickFifthLoggedInAccountParallelSpace() 
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
	MsgBox, AutoFollow script has been completed!
	ExitApp
	
	;hot key to kill app (looping present)
	p::ExitApp
	
