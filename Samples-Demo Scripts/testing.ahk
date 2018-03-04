#SingleInstance force ; only one instance of script can run
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.

#include C:\Users\jsnider\Google Drive\Token Creative Services\Web\Apps\AutoHotKey\scripts\Classes\crowdFireWebApp.ahk

;instantiate new object of class type
cfApp := New crowdFireWebApp
;call method to set all attribute's of class, based on Jordy's  LT
cfApp.SetToJSniderLaptop()
cfApp.launchCrowdfireWebSite()
cfApp.clickMenuItem()
;~ cfApp.clickCurrentlySelectedAccount()
;~ cfApp.clickFirstLoggedInAccount()
;~ cfApp.clickSecondLoggedInAccount()
;~ cfApp.clickThirdLoggedInAccount()
;~ cfApp.clickForthLoggedInAccount()
;~ cfApp.clickFifthLoggedInAccount()
;~ cfApp.clickSixthLoggedInAccount()
;~ cfApp.clickSeventhLoggedInAccount()
;~ cfApp.clickEighthLoggedInAccount()
;~ cfApp.clickNinthLoggedInAccount()
;~ cfApp.clickTenthLoggedInAccount()
;~ cfApp.clickEleventhLoggedInAccount()
;~ cfApp.clickNonFollowersButton()
;~ cfApp.clickFansButton()
;~ cfApp.clickAdmirersButton()
;~ cfApp.clickUnfollowButton()
;~ cfApp.unfollowButtonLoop()
;~ cfApp.()

	;hot key to kill app (looping present)
	p::ExitApp