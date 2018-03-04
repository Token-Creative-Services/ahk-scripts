 ; DESCRIPTION:      Launch crowdfire in browser, navigate to the non-followers list, and max unfollow per each account. Swaps between logged in accounts
 ; START:            None. Script will launch browser window and begin process immediatly
 ; Created By:       Jordan Snider
 ; Last Updated:     12/18/2016
 ; Hot Keys: [P]-Exit
 ;
 ; DEPLOYED FOR: Token Jet LT
 ; ----------------------------------------------------
 ; ----------------------------------------------------

#SingleInstance force ; only one instance of script can run
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ProgramFiles% ; Ensures a consistent starting directory.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

#include C:\Program Files\Token\Automation\classes\crowdFireWebApp.ahk  ; FOR LIVE****************

;instantiate new object of class type
cfApp := New crowdFireWebApp
;call method to set all attribute's of class, based on Jordy's  LT
cfApp.setTotokenJetLT()	
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
		;//MAX cap if statement
		if (numAccounts > 11) {
			Msgbox, Scripts not configured for this many accounts. Conctact web/admin team for further assistance
			ExitApp
		}
		;//MIN cap statement
		if (numAccounts < 1) {
			ExitApp
		}
		
		MsgBox, Auto unfollow script crowdfire has been completed
		ExitApp
		
	;hot key to kill app (looping present)
	p::ExitApp
	
