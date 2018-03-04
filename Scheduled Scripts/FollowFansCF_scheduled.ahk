 ; DESCRIPTION:      Launch crowdfire in browser, navigate to the fans list, and follow fans per hourly max
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

;instantiate new object of class type
cfApp := New crowdFireWebApp
;call method to set all attribute's of class
cfApp.assignScreenResolution()
;set our load times per the selection in the form/what is passed as a param to this script
cfApp.assignLoadTimes(1)
; RUNNING FOR: 'X' ACCOUNTS 							;************************************
  numAccounts := "12"
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
		; TWELTH ACCOUNT
		if (numAccounts >= 12) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickTwelthLoggedInAccount()
			;click the fans button
			cfApp.clickFansButton()
			;Click the follow button per hourly max
			cfApp.followButtonLoop()
		}
		; THIRTEENTH ACCOUNT
		if (numAccounts >= 13) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickThirteenthLoggedInAccount()
			;click the fans button
			cfApp.clickFansButton()
			;Click the follow button per hourly max
			cfApp.followButtonLoop()
		}
		; FORTEENTH ACCOUNT
		if (numAccounts >= 14) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickForteenthLoggedInAccount()
			;click the fans button
			cfApp.clickFansButton()
			;Click the follow button per hourly max
			cfApp.followButtonLoop()
		}
		; FIFTINTH ACCOUNT
		if (numAccounts >= 15) {
			;Click
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickFiftinthLoggedInAccount()
			;click the fans button
			cfApp.clickFansButton()
			;Click the follow button per hourly max
			cfApp.followButtonLoop()
		}
	;Hot key to pause the script
	Tab::Pause
	
	;hot key to kill app (looping present)
	`::ExitApp
	
