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

;instantiate new object of class type
cfApp := New crowdFireWebApp
;call method to set all attribute's of class
cfApp.assignScreenResolution()
;set our load times per the selection in the form/what is passed as a param to this script
cfApp.assignLoadTimes(1)
; RUNNING FOR 'X' ACCOUNTS currently logged into CrowdFire			;************************************
  numAccounts := "12"
;----------------------------------------------------------------------------------
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
	
	;Hot key to pause the script
	Tab::Pause
		
	;hot key to kill app (looping present)
	`::ExitApp