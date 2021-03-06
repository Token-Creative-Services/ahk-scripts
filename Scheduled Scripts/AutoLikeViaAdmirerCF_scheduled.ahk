 ; DESCRIPTION:      Launch crowdfire in browser, navigate to the admirers list, and max like per each account. Refreshes the admire list a certain # of times to do more likes. Swaps between logged in accounts
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
igApp.assignLoadTimes(1)
; RUNNING FOR: X ACCOUNTS 							;************************************
numAccounts := "12"

		;Start off by launching crowdfire outside of the loop
		cfApp.launchCrowdfireWebSite()
		;Click the menu to load the list of accounts/lists
		cfApp.clickMenuItem()
		
		Loop % cfApp.rate_likeViaAdmirerListScriptLoop { 
			; FIRST ACCOUNT - Always run against first account
			cfApp.clickCurrentlySelectedAccount()
			cfApp.clickFirstLoggedInAccount()
			;click the admirer button
			cfApp.clickAdmirersButton()
			;click the like button in a loop, according to the # of pics loaded in a single session of the feed
			cfApp.likeButtonLoop()
			
			;//implement counter in class and loop based on that limiter
			;SECOND ACCOUNT
			if (numAccounts >= 2) {
				;Click
				cfApp.clickCurrentlySelectedAccount()
				cfApp.clickSecondLoggedInAccount()
				;click the admirer button
				cfApp.clickAdmirersButton()
				;click the like button in a loop, according to the # of pics loaded in a single session of the feed
				cfApp.likeButtonLoop()
			}
			
			;THIRD ACCOUNT
			if (numAccounts >= 3) {
				;Click
				cfApp.clickCurrentlySelectedAccount()
				cfApp.clickThirdLoggedInAccount()
				;click the admirer button
				cfApp.clickAdmirersButton()
				;click the like button in a loop, according to the # of pics loaded in a single session of the feed
				cfApp.likeButtonLoop()
			}
			;FORTH ACCOUNT
			if (numAccounts >= 4) {
				;Click
				cfApp.clickCurrentlySelectedAccount()
				cfApp.clickForthLoggedInAccount()
				;click the admirer button
				cfApp.clickAdmirersButton()
				;click the like button in a loop, according to the # of pics loaded in a single session of the feed
				cfApp.likeButtonLoop()
			}
			;FIFTH ACCOUNT
			if (numAccounts >= 5) {
				;Click
				cfApp.clickCurrentlySelectedAccount()
				cfApp.clickFifthLoggedInAccount()
				;click the admirer button
				cfApp.clickAdmirersButton()
				;click the like button in a loop, according to the # of pics loaded in a single session of the feed
				cfApp.likeButtonLoop()
			}
			;SIXTH ACCOUNT
			if (numAccounts >= 6) {
				;Click
				cfApp.clickCurrentlySelectedAccount()
				cfApp.clickSixthLoggedInAccount()
				;click the admirer button
				cfApp.clickAdmirersButton()
				;click the like button in a loop, according to the # of pics loaded in a single session of the feed
				cfApp.likeButtonLoop()
			}
			;SEVENTH ACCOUNT
			if (numAccounts >=7) {
				;Click
				cfApp.clickCurrentlySelectedAccount()
				cfApp.clickSeventhLoggedInAccount()
				;click the admirer button
				cfApp.clickAdmirersButton()
				;click the like button in a loop, according to the # of pics loaded in a single session of the feed
				cfApp.likeButtonLoop()
			}
			;EIGHTH ACCOUNT
			if (numAccounts >= 8) {
				;Click
				cfApp.clickCurrentlySelectedAccount()
				cfApp.clickEighthLoggedInAccount()
				;click the admirer button
				cfApp.clickAdmirersButton()
				;click the like button in a loop, according to the # of pics loaded in a single session of the feed
				cfApp.likeButtonLoop()
			}
			;NINTH ACCOUNT
			if (numAccounts >= 9) {
				;Click
				cfApp.clickCurrentlySelectedAccount()
				cfApp.clickNinthLoggedInAccount()
				;click the admirer button
				cfApp.clickAdmirersButton()
				;click the like button in a loop, according to the # of pics loaded in a single session of the feed
				cfApp.likeButtonLoop()
			}
			;TENTH ACCOUNT
			if (numAccounts >= 10) {
				;Click
				cfApp.clickCurrentlySelectedAccount()
				cfApp.clickTenthLoggedInAccount()
				;click the admirer button
				cfApp.clickAdmirersButton()
				;click the like button in a loop, according to the # of pics loaded in a single session of the feed
				cfApp.likeButtonLoop()
			}
			;ELEVENTH ACCOUNT
			if (numAccounts >= 11) {
				;Click
				cfApp.clickCurrentlySelectedAccount()
				cfApp.clickEleventhLoggedInAccount()
				;click the admirer button
				cfApp.clickAdmirersButton()
				;click the like button in a loop, according to the # of pics loaded in a single session of the feed
				cfApp.likeButtonLoop()
			}
			; TWELTH ACCOUNT
			if (numAccounts >= 12) {
				;Click
				cfApp.clickCurrentlySelectedAccount()
				cfApp.clickTwelthLoggedInAccount()
				;click the admirer button
				cfApp.clickAdmirersButton()
				;click the like button in a loop, according to the # of pics loaded in a single session of the feed
				cfApp.likeButtonLoop()
			}
			; THIRTEENTH ACCOUNT
			if (numAccounts >= 13) {
				;Click
				cfApp.clickCurrentlySelectedAccount()
				cfApp.clickThirteenthLoggedInAccount()
				;click the admirer button
				cfApp.clickAdmirersButton()
				;click the like button in a loop, according to the # of pics loaded in a single session of the feed
				cfApp.likeButtonLoop()
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
				;click the admirer button
				cfApp.clickAdmirersButton()
				;click the like button in a loop, according to the # of pics loaded in a single session of the feed
				cfApp.likeButtonLoop()
			}
		}
	;Hot key to pause the script
	Tab::Pause
	
	;hot key to kill app (looping present)
	`::ExitApp