 ;// Variables (x/y for each click event)
 ;// Location of followers list
x_followersList := "1160"
y_followersList := "146"
 ;// Location of profile (bottom-right most) button
 x_profileButton := "1195"
 y_profileButton := "1061"
 ;// Location of where the user profile clicks are in the follower's list
x_firstProfileFollower := "755"
y_firstProfileFollower := "140"
x_secondProfileFollower := "764"
y_secondProfileFollower := "193"
x_thirdProfileFollower := "775"
y_thirdProfileFollower := "246"
x_forthProfileFollower := "747"
y_forthProfileFollower := "280"
x_fifthProfileFollower := "773"
y_fifthProfileFollower := "337"
;//Location of the profile in IG to switch between (logged-in accounts). Max = 5
;FIRST PROFILE IS ALWAYS SELECT BY DEFAULT WHEN LAUNCHING IG APP
;x_firstAccount := "728"
;y_firstAccount := "119"
x_secondAccount := "728"
y_secondAccount := "164"
x_thirdAccount := "728"
y_thirdAccount := "208"
x_forthAccount := "728"
y_forthAccount := "252"
x_fifthAccount := "728"
y_fifthAccount := "298"
 ;// location of pictures in user's main page
x_firstPicSelect := "764"
y_firstPicSelect := "565"
x_secondPicSelect := "956"
y_secondPicSelect := "573"
x_thirdPicSelect := "1150"
y_thirdPicSelect := "592"
 ;//LIKE location (to double click at)
 x_likeLocation := "1100" ; Passed to likePicture function
 y_likeLocation := "356" ; Passed to likePicture function
 ;// Go back button
x_goBackButton := "686" ; Passed to goBackClick function
y_goBackButton := "77" ; Passed to goBackClick function
;//Time optomization for click events
time_FollowerListLoad := "2000" ; load time for list of followers
time_ProfilePageLoad := "2000" ; load time for profile page of a user
time_PictureLoad := "1000" ; load time for a picture
time_doubleClickWaitInverval := "100" ; how long to wait between click events to simulate a double click
time_goBackWait := "100"
title_blueStacksWindow := "BlueStacks App Player" ; Name of the blueStacks Window


 ; -------------------------------------------------------------------------
 ; Starting Functions
 
 ; Click profile button(bottom right-most button) to ensure you are on the right page
   ; ex) clickProfileButton(x_profileButton, y_profileButton, time_ProfilePageLoad, title_blueStacksWindow)
clickProfileButton(xProfileButton, yProfileButton, profilePageLoadTime, blueStacksWindowTitle)
 {
	WinWait, %blueStacksWindowTitle%, 
	IfWinNotActive, %blueStacksWindowTitle%, , WinActivate, %blueStacksWindowTitle%, 
	WinWaitActive, %blueStacksWindowTitle%, 
	MouseClick, left,  %xProfileButton%,  %yProfileButton%
	Sleep, %profilePageLoadTime%
}
 
 ; Click Following List
   ; ex) clickFollowingList(x_followersList,y_followersList,time_FollowerListLoad, title_blueStacksWindow)
 clickFollowingList(xFollowingList, yFollowingList, followerListLoadTime, blueStacksWindowTitle)
 {
	WinWait, %blueStacksWindowTitle%, 
	IfWinNotActive, %blueStacksWindowTitle%, , WinActivate, %blueStacksWindowTitle%, 
	WinWaitActive, %blueStacksWindowTitle%, 
	MouseClick, left,  %xFollowingList%,  %yFollowingList%
	Sleep, %followerListLoadTime%
}

likePicture(likeLocationX, likeLocationY, doubleClickWaitIntervalTime, pictureLoadTime ,blueStacksWindowTitle)
 ; ex) likePicture(x_likeLocation, y_likeLocation, time_doubleClickWaitInverval, time_PictureLoad, title_blueStacksWindow)
{
	Sleep, %pictureLoadTime%
	WinWait, %blueStacksWindowTitle%, 
	IfWinNotActive, %blueStacksWindowTitle%, , WinActivate, %blueStacksWindowTitle%, 
	WinWaitActive, %blueStacksWindowTitle%,
	MouseClick, left,  %likeLocationX%,  %likeLocationY% ;Like location
	Sleep, %doubleClickWaitIntervalTime%
	MouseClick, left,  %likeLocationX%,  %likeLocationY% ;Like location
	MouseClick, left,  %likeLocationX%,  %likeLocationY% ;Like location
	Sleep, %doubleClickWaitIntervalTime%
}

 ; Click event to find and click the 'GoBack' button
 ; ex) goBackToProfileClick(x_goBackButton, y_goBackButton, time_ProfilePageLoad, title_blueStacksWindow)
goBackToProfileClick(goBackButtonX, goBackButtonY, profilePageLoadTime,blueStacksWindowTitle)
{
	WinWait, %blueStacksWindowTitle%, 
	IfWinNotActive, %blueStacksWindowTitle%, , WinActivate, %blueStacksWindowTitle%, 
	WinWaitActive, %blueStacksWindowTitle%,
	MouseClick, left,  %goBackButtonX%,  %goBackButtonY%
	Sleep, %profilePageLoadTime%
}

 ; Click event to find and click the 'GoBack' button
 ; ex) goBackToFollowerListClick(x_goBackButton, y_goBackButton, time_FollowerListLoad, title_blueStacksWindow)
goBackToFollowerListClick(goBackButtonX, goBackButtonY, followerListLoadTime, blueStacksWindowTitle)
{
	WinWait, %blueStacksWindowTitle%, 
	IfWinNotActive, %blueStacksWindowTitle%, , WinActivate, %blueStacksWindowTitle%, 
	WinWaitActive, %blueStacksWindowTitle%,
	MouseClick, left,  %goBackButtonX%,  %goBackButtonY%
	Sleep, %followerListLoadTime%	
}

 ; Click into the profile of the FIRST user in the list of user's currently being followed
 ; ex) clickProfileFollower(x_firstProfileFollower, y_firstProfileFollower, time_ProfilePageLoad, title_blueStacksWindow)
clickProfileFollower(profileFollowerX, profileFollowerY, profilePageLoadTime, blueStacksWindowTitle)
{
	WinWait, %blueStacksWindowTitle%, 
	IfWinNotActive, %blueStacksWindowTitle%, , WinActivate, %blueStacksWindowTitle%, 
	WinWaitActive, %blueStacksWindowTitle%,
	MouseClick, left,  %profileFollowerX%,  %profileFollowerY%
	Sleep, %profilePageLoadTime% ; Profile page load time
}

 ; Click first pic on user profile page
 ; ex) clickFirstPic(x_firstPicSelect, y_firstPicSelect, time_PictureLoad, title_blueStacksWindow)
 clickFirstPic(firstPicSelectX, firstPicSelectY, pictureLoadTime, blueStacksWindowTitle)
 {
	WinWait, %blueStacksWindowTitle%, 
	IfWinNotActive, %blueStacksWindowTitle%, , WinActivate, %blueStacksWindowTitle%, 
	WinWaitActive, %blueStacksWindowTitle%,
	MouseClick, left,  %firstPicSelectX%,  %firstPicSelectY% ;First pic location
	Sleep, %pictureLoadTime% ;picutre load time
 }
 
; Click second pic on user profile page
 ; ex) clickSecondPic(x_secondPicSelect, y_secondPicSelect, time_PictureLoad, title_blueStacksWindow)
  clickSecondPic(secondPicSelectX, secondPicSelectY, pictureLoadTime, blueStacksWindowTitle)
 {
	WinWait, %blueStacksWindowTitle%, 
	IfWinNotActive, %blueStacksWindowTitle%, , WinActivate, %blueStacksWindowTitle%, 
	WinWaitActive, %blueStacksWindowTitle%,
	MouseClick, left,  %secondPicSelectX%,  %secondPicSelectY% ;First pic location
	Sleep, %pictureLoadTime% ;picutre load time
 }

; Click third pic on user profile page
 ; ex) clickThirdPic(x_thirdPicSelect, y_thirdPicSelect, time_PictureLoad, title_blueStacksWindow)
  clickThirdPic(thirdPicSelectX, thirdPicSelectY, pictureLoadTime, blueStacksWindowTitle)
 {
	WinWait, %blueStacksWindowTitle%, 
	IfWinNotActive, %blueStacksWindowTitle%, , WinActivate, %blueStacksWindowTitle%, 
	WinWaitActive, %blueStacksWindowTitle%,
	MouseClick, left,  %thirdPicSelectX%,  %thirdPicSelectY% ;First pic location
	Sleep, %pictureLoadTime% ;picutre load time
 }

 ; -------------------------------------------------------------------------
 ; Select first profile follower and do three pic likes for them
 ; Theory: This method can be called to like the 3 pics on a profile that is already loaded
 ; ex) like3PicsOnUserAccount(x_firstProfileFollower, y_firstProfileFollower)
 like3PicsOnUserAccount()
 {
	global
	; select [FIRST] pic
	clickFirstPic(x_firstPicSelect, y_firstPicSelect, time_PictureLoad, title_blueStacksWindow)
	; like it
	likePicture(x_likeLocation, y_likeLocation, time_doubleClickWaitInverval, time_PictureLoad, title_blueStacksWindow)
	; go back to profil page
	goBackToProfileClick(x_goBackButton, y_goBackButton, time_ProfilePageLoad, title_blueStacksWindow)

	 ; select [SECOND] picture
	clickSecondPic(x_secondPicSelect, y_secondPicSelect, time_PictureLoad, title_blueStacksWindow)
	; like it
	likePicture(x_likeLocation, y_likeLocation, time_doubleClickWaitInverval, time_PictureLoad, title_blueStacksWindow)
	; go back to profil page
	goBackToProfileClick(x_goBackButton, y_goBackButton, time_ProfilePageLoad, title_blueStacksWindow)

	 ; select [THIRD] pic
	clickThirdPic(x_thirdPicSelect, y_thirdPicSelect, time_PictureLoad, title_blueStacksWindow)
	; like it
	likePicture(x_likeLocation, y_likeLocation, time_doubleClickWaitInverval, time_PictureLoad, title_blueStacksWindow)
	; go back to profil page
	goBackToProfileClick(x_goBackButton, y_goBackButton, time_ProfilePageLoad, title_blueStacksWindow)
	; go back to follower list
	goBackToFollowerListClick(x_goBackButton, y_goBackButton, time_FollowerListLoad, title_blueStacksWindow)
 }
 
 

; -------------------------------------------------------------------------
; @STARTING ACTIONS: Go to the following list of current logged in profile
 ; **USER PROFILE SWITCH HERE - ENCAPSULATE INTO OWN METHOD 
; Having already been logged in, we click the profile button to ensure we start on the right page
clickProfileButton(x_profileButton, y_profileButton, time_ProfilePageLoad, title_blueStacksWindow)
; Click on the logged in account's followingList
clickFollowingList(x_followersList,y_followersList,time_FollowerListLoad, title_blueStacksWindow) 
; ---------------------
; NEXT: From the following list page, select the person's profile location in the following list, to view their profile
; PROFILE FOLLWING USER #1
clickProfileFollower(x_firstProfileFollower, y_firstProfileFollower, time_ProfilePageLoad, title_blueStacksWindow) ; click on the first user profile
like3PicsOnUserAccount()
;PROFILE FOLLWING USER #2
clickProfileFollower(x_secondProfileFollower, y_secondProfileFollower, time_ProfilePageLoad, title_blueStacksWindow) ; click on the second user profile
like3PicsOnUserAccount()
;PROFILE FOLLWING USER #3
clickProfileFollower(x_thirdProfileFollower, y_thirdProfileFollower, time_ProfilePageLoad, title_blueStacksWindow) ; click on the third user profile
like3PicsOnUserAccount()
;PROFILE FOLLWING USER #4
clickProfileFollower(x_forthProfileFollower, y_forthProfileFollower, time_ProfilePageLoad, title_blueStacksWindow) ; click on the forth user profile
like3PicsOnUserAccount()
;PROFILE FOLLWING USER #5
clickProfileFollower(x_fifthProfileFollower, y_fifthProfileFollower, time_ProfilePageLoad, title_blueStacksWindow) ; click on the fifth user profile
like3PicsOnUserAccount()
; -------------------------------------------------------------------------
; FINAL ACTIONS
; go back to main profile page (of account logged in as)
goBackToProfileClick(x_goBackButton, y_goBackButton, time_ProfilePageLoad, title_blueStacksWindow)


; Having already been logged in, we click the profile button to ensure we start on the right page
clickProfileButton(x_profileButton, y_profileButton, time_ProfilePageLoad, title_blueStacksWindow)
; Click on the logged in account's followingList
clickFollowingList(x_followersList,y_followersList,time_FollowerListLoad, title_blueStacksWindow) 
; NEXT: From the following list page, select the person's profile location in the following list, to view their profile
