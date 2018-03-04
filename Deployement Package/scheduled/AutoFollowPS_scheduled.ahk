 ; DESCRIPTION:      Acess the 'following' list of account, select top 8 accounts, and follow 'X' channels (8x25=200) 
 ; START:            Full screen 'Bluestacks', with the 'Instagram' app open. 
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

;instantiate new object of class type
igApp := New InstagramBS
;call method to set all attribute's of class
igApp.assignScreenResolution()
;set our load times per the selection in the form/what is passed as a param to this script
igApp.assignLoadTimes(1)
; RUNNING FOR: X ACCOUNTS 							;************************************
numAccounts := "5"
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
	;Hot key to pause the script
	Tab::Pause
	
	;hot key to kill app (looping present)
	`::ExitApp
	
