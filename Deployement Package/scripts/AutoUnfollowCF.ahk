 ; DESCRIPTION:      Launch crowdfire in browser, navigate to the non-followers list, and max unfollow per each account. Swaps between logged in accounts
 ; START:            None. Script will launch browser window and begin process immediatly
 ; Created By:       Jordan Snider
 ; Hot Keys: [`]-Exit | [TAB]-Pause
 ;
 ; ----------------------------------------------------
 ; ----------------------------------------------------
#SingleInstance force ; only one instance of script can run
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ProgramFiles% ; Ensures a consistent starting directory.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

;#include C:\Users\jsnider\Google Drive\Token Creative Services\Web\Apps\AutoHotKey\scripts\Classes\crowdFireWebAppClass.ahk ;Import class file ; FOR DEV*****************
#include C:\Program Files\Token\Automation\classes\crowdFireWebAppClass.ahk  ; FOR LIVE****************

;Set our toolTip progress indicator to show what script is currently executing. To start, we say initializing
CoordMode, ToolTip, Screen ; makes tooltip to appear at position, relative to screen.
tooltipText := "AutoFollow (Initializing)..."
tooltip %tooltipText%, 0, 0 ; display tooltip at coordinates x0 y0.
;-----------------------------------
;instantiate new object of class type
cfApp := New crowdFireWebApp
;call method to set all attribute's of class
cfApp.assignScreenResolution()
;set our load times per the selection in the form/what is passed as a param to this script
myVar = %1%
if (myVar = "1")
{
	cfApp.assignLoadTimes(1)
}
else if (myVar = "2")
{
	cfApp.assignLoadTimes(2)
}
else if (myVar = "3")
{
	cfApp.assignLoadTimes(3)
}
else if (myVar = "4")
{
	cfApp.assignLoadTimes(4)
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
tooltipText := "AutoUnfollowCF (Awaiting Input)..."
tooltip %tooltipText%, 0, 0 ; display tooltip at coordinates x0 y0.
;-----------------------------------
;Create GUI and ask how many accounts are currently logged in so script 
;only runs against the actual # of accounts the user has signed in
;-----------------------------------
Gui, New
Gui, Add, Text,, # Accounts logged into Crowdfire:
Gui, Add, Edit, vNumAccounts
Gui, Add, Button, Default gOK, OK
Gui, Show
return
;----------------
OK:
	Gui, Submit
		;Set the toolTip to state it is currently executing
		tooltipText := "AutoUnfollowCF (Running)..."
		tooltip %tooltipText%, 0, 0 ; display tooltip at coordinates x0 y0.
		;---------
		;//MAX cap if statement. We have only up to 15 accounts currently configured with CF Class
		if (numAccounts > 15) {
			Msgbox, Scripts not configured for this many accounts. Conctact web/admin team for further assistance
			ExitApp
		}
		;//MIN cap statement
		if (numAccounts < 1) {
			ExitApp
		}
		; FIRST ACCOUNT - Always run against first account
		;Start off by launching crowdfire
		cfApp.launchCrowdfireWebSite()
		;Click the menu to load the list of accounts/lists
		cfApp.clickMenuItem()
		;Click the non Followers button
		cfApp.clickNonFollowersButton()
		;Click the  unfollow button in a consistent loop, based on the hourly max rate
		cfApp.unfollowButtonLoop()
		
		; SECOND ACCOUNT
		if (numAccounts >= 2) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickSecondLoggedInAccount()
			;Click the non Followers button
			cfApp.clickNonFollowersButton()
			;Click the  unfollow button in a consistent loop, based on the hourly max rate
			cfApp.unfollowButtonLoop()
		}
		
		; THIRD ACCOUNT
		if (numAccounts >= 3) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickThirdLoggedInAccount()
			;Click the non Followers button
			cfApp.clickNonFollowersButton()
			;Click the  unfollow button in a consistent loop, based on the hourly max rate
			cfApp.unfollowButtonLoop()
		}
		
		; FORTH ACCOUNT
		if (numAccounts >= 4) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickForthLoggedInAccount()
			;Click the non Followers button
			cfApp.clickNonFollowersButton()
			;Click the  unfollow button in a consistent loop, based on the hourly max rate
			cfApp.unfollowButtonLoop()
		}
		
		; FIFTH ACCOUNT
		if (numAccounts >= 5) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickFifthLoggedInAccount()
			;Click the non Followers button
			cfApp.clickNonFollowersButton()
			;Click the  unfollow button in a consistent loop, based on the hourly max rate
			cfApp.unfollowButtonLoop()
		}
		
		; SIXTH ACCOUNT
		if (numAccounts >= 6) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickSixthLoggedInAccount()
			;Click the non Followers button
			cfApp.clickNonFollowersButton()
			;Click the  unfollow button in a consistent loop, based on the hourly max rate
			cfApp.unfollowButtonLoop()
		}
		
		; SEVENTH ACCOUNT
		if (numAccounts >= 7) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickSeventhLoggedInAccount()
			;Click the non Followers button
			cfApp.clickNonFollowersButton()
			;Click the  unfollow button in a consistent loop, based on the hourly max rate
			cfApp.unfollowButtonLoop()
		}
		
		; EIGHTH ACCOUNT
		if (numAccounts >= 8) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickEighthLoggedInAccount()
			;Click the non Followers button
			cfApp.clickNonFollowersButton()
			;Click the  unfollow button in a consistent loop, based on the hourly max rate
			cfApp.unfollowButtonLoop()
		}
		
		; NINTH ACCOUNT
		if (numAccounts >= 9) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickNinthLoggedInAccount()
			;Click the non Followers button
			cfApp.clickNonFollowersButton()
			;Click the  unfollow button in a consistent loop, based on the hourly max rate
			cfApp.unfollowButtonLoop()
		}
		
		; TENTH ACCOUNT
		if (numAccounts >= 10) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickTenthLoggedInAccount()
			;Click the non Followers button
			cfApp.clickNonFollowersButton()
			;Click the  unfollow button in a consistent loop, based on the hourly max rate
			cfApp.unfollowButtonLoop()
		}
		
		; ELEVENTH ACCOUNT
		if (numAccounts >= 11) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickEleventhLoggedInAccount()
			;Click the non Followers button
			cfApp.clickNonFollowersButton()
			;Click the  unfollow button in a consistent loop, based on the hourly max rate
			cfApp.unfollowButtonLoop()
		}
		; TWELTH ACCOUNT
		if (numAccounts >= 12) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickTwelthLoggedInAccount()
			;Click the non Followers button
			cfApp.clickNonFollowersButton()
			;Click the  unfollow button in a consistent loop, based on the hourly max rate
			cfApp.unfollowButtonLoop()
		}
		; THIRTEENTH ACCOUNT
		if (numAccounts >= 13) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickThirteenthLoggedInAccount()
			;Click the non Followers button
			cfApp.clickNonFollowersButton()
			;Click the  unfollow button in a consistent loop, based on the hourly max rate
			cfApp.unfollowButtonLoop()
		}
		; FORTEENTH ACCOUNT
		if (numAccounts >= 14) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickForteenthLoggedInAccount()
			;Click the non Followers button
			cfApp.clickNonFollowersButton()
			;Click the  unfollow button in a consistent loop, based on the hourly max rate
			cfApp.unfollowButtonLoop()
		}
		; FIFTINTH ACCOUNT
		if (numAccounts >= 15) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickFiftinthLoggedInAccount()
			;Click the non Followers button
			cfApp.clickNonFollowersButton()
			;Click the  unfollow button in a consistent loop, based on the hourly max rate
			cfApp.unfollowButtonLoop()
		}
		;Set the toolTip to state it is currently executing
		tooltipText := "AutoUnfollowCF Finished!"
		tooltip %tooltipText%, 0, 0 ; display tooltip at coordinates x0 y0.
		MsgBox, Auto unfollow script crowdfire has been completed
		ExitApp
		
	;Hot key to pause the script
	Tab::Pause
		
	;hot key to kill app (looping present)
	`::ExitApp