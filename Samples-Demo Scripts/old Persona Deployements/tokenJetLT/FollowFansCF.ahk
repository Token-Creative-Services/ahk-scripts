 ; DESCRIPTION:      Launch crowdfire in browser, navigate to the fans list, and follow fans per hourly max
 ; START:            None. Script will launch browser window and begin process immediatly
 ; Created By:       Jordan Snider
 ; Last Updated:     12/27/2016
 ; Hot Keys: [P]-Exit
 ;
 ; TO DEPLOY: a)Replace working script directory(for classes framework)     b)Create/Configure user defining method for respective class(Set [igApp] context to user-specific method)		c) Set file name to 'FollowFansCF.ahk'
 ; ----------------------------------------------------
 ; ----------------------------------------------------
#SingleInstance force ; only one instance of script can run
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ProgramFiles% ; Ensures a consistent starting directory.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

;#include C:\Users\jsnider\Google Drive\Token Creative Services\Web\Apps\AutoHotKey\scripts\Classes\crowdFireWebApp.ahk ;Import class file ; FOR DEV*****************
#include C:\Program Files\Token\Automation\classes\crowdFireWebApp.ahk  ; FOR LIVE****************

;instantiate new object of class type
cfApp := New crowdFireWebApp
;call method to set all attribute's of class, based on Jordy's  LT
cfApp.setTotokenJetLT()																													;************************

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
		;click the fans button
		cfApp.clickFansButton()
		;Click the follow button per hourly max
		cfApp.followButtonLoop()
		
		; SECOND ACCOUNT
		if (numAccounts >= 2) {
			;Click on the currently selected account
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickSecondLoggedInAccount()
			;click the fans button
			cfApp.clickFansButton()
			;Click the follow button per hourly max
			cfApp.followButtonLoop()
		}
		
		; THIRD ACCOUNT
		if (numAccounts >= 3) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickThirdLoggedInAccount()
			;click the fans button
			cfApp.clickFansButton()
			;Click the follow button per hourly max
			cfApp.followButtonLoop()
		}
		
		; FORTH ACCOUNT
		if (numAccounts >= 4) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickForthLoggedInAccount()
			;click the fans button
			cfApp.clickFansButton()
			;Click the follow button per hourly max
			cfApp.followButtonLoop()
		}
		
		; FIFTH ACCOUNT
		if (numAccounts >= 5) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickFifthLoggedInAccount()
			;click the fans button
			cfApp.clickFansButton()
			;Click the follow button per hourly max
			cfApp.followButtonLoop()
		}
		
		; SIXTH ACCOUNT
		if (numAccounts >= 6) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickSixthLoggedInAccount()
			;click the fans button
			cfApp.clickFansButton()
			;Click the follow button per hourly max
			cfApp.followButtonLoop()
		}
		
		; SEVENTH ACCOUNT
		if (numAccounts >= 7) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickSeventhLoggedInAccount()
			;click the fans button
			cfApp.clickFansButton()
			;Click the follow button per hourly max
			cfApp.followButtonLoop()
		}
		
		; EIGHTH ACCOUNT
		if (numAccounts >= 8) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickEighthLoggedInAccount()
			;click the fans button
			cfApp.clickFansButton()
			;Click the follow button per hourly max
			cfApp.followButtonLoop()
		}
		
		; NINTH ACCOUNT
		if (numAccounts >= 9) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickNinthLoggedInAccount()
			;click the fans button
			cfApp.clickFansButton()
			;Click the follow button per hourly max
			cfApp.followButtonLoop()
		}
		
		; TENTH ACCOUNT
		if (numAccounts >= 10) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickTenthLoggedInAccount()
			;click the fans button
			cfApp.clickFansButton()
			;Click the follow button per hourly max
			cfApp.followButtonLoop()
		}
		
		; ELEVENTH ACCOUNT
		if (numAccounts >= 11) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickEleventhLoggedInAccount()
			;click the fans button
			cfApp.clickFansButton()
			;Click the follow button per hourly max
			cfApp.followButtonLoop()
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
		
		MsgBox, Auto follow script crowdfire has been completed
		ExitApp
		
	;hot key to kill app (looping present)
	p::ExitApp
	
