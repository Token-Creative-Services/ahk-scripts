 ; DESCRIPTION - Script to select the top 3 users on a profile's following list, and like their first 3 pictures
 ; START: Full screen 'Bluestacks', with the 'Instagram' app open
 ; Created By: Jordan Snider
 ;
 ; Deployed for: Jordan Snider's LT 
 ; ----------------------------------------------------
 ; ----------------------------------------------------

 ;// Variables (x/y for each click event)
 ;// Location of followers list
x_followersList := "1160"
y_followersList := "146"
 ;// Location of profile (bottom-right most) button
 x_profileButton := "1195"
 y_profileButton := "1061"
 ;// Location of where the user profile clicks
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
 ;// location of pictures
x_firstPicSelect := "764"
y_firstPicSelect := "565"
x_secondPicSelect := "956"
y_secondPicSelect := "573"
x_thirdPicSelect := "1150"
y_thirdPicSelect := "592"
 ;//LIKE location (to double click at)
 x_likeLocation := "1100"
 y_likeLocation := "356"
 ;// Go back button
x_goBackButton := "690"
y_goBackButton := "92"
;//Time optomization for click events
time_FollowerListLoad := "2000" ; load time for list of followers
time_ProfilePageLoad := "2000" ; load time for profile page of a user
time_PictureLoad := "1000" ; load time for a picture
time_doubleClickWaitInverval := "100" ; how long to wait between click events to simulate a double click
time_goBackWait := "100"

 ; -------------------------------------------------------------------------
 ; Starting Functions: Ensure on profile page > Click following list
 ; Click profile button(bottom right-most button) to ensure you are on the right page
 WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_profileButton%,  %y_profileButton%
Sleep, %time_ProfilePageLoad%
 
 ; Click Following List
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_followersList%,  %y_followersList%
Sleep, %time_FollowerListLoad%


 ; -------------------------------------------------------------------------
 ; select first profile follower
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_firstProfileFollower%,  %y_firstProfileFollower% ; REPLACE WITH COORDS OF PROFILE#(1st person in list, 2nd, etc)
Sleep, %time_ProfilePageLoad%
 ; select first pic
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_firstPicSelect%,  %y_firstPicSelect%
Sleep, %time_PictureLoad%
  ; like it
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_doubleClickWaitInverval%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_goBackWait%
; go back to profil page
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_goBackButton%,  %y_goBackButton%
Sleep, %time_ProfilePageLoad%

 ; select second picture
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_secondPicSelect%,  %y_secondPicSelect%
Sleep, %time_PictureLoad%
  ; like it
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_doubleClickWaitInverval%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_goBackWait%
; go back to profil page 
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_goBackButton%,  %y_goBackButton%
Sleep, %time_ProfilePageLoad%

 ; select third pic
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_thirdPicSelect%,  %y_thirdPicSelect%
Sleep, %time_PictureLoad%
  ; like it
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_doubleClickWaitInverval%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_goBackWait%
; go back to profile page
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_goBackButton%,  %y_goBackButton%
Sleep, %time_ProfilePageLoad%
; go back to follower list
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_goBackButton%,  %y_goBackButton%
Sleep, %time_FollowerListLoad%


 ; -------------------------------------------------------------------------
 ; select second profile follower
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_secondProfileFollower%,  %y_secondProfileFollower%
Sleep, %time_ProfilePageLoad%
 ; select first pic
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_firstPicSelect%,  %y_firstPicSelect%
Sleep, %time_PictureLoad%
  ; like it
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_doubleClickWaitInverval%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_goBackWait%
; go back to profil page
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_goBackButton%,  %y_goBackButton%
Sleep, %time_ProfilePageLoad%

 ; select second picture
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_secondPicSelect%,  %y_secondPicSelect%
Sleep, %time_PictureLoad%
  ; like it
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_doubleClickWaitInverval%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_goBackWait%
; go back to profil page 
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_goBackButton%,  %y_goBackButton%
Sleep, %time_ProfilePageLoad%

 ; select third pic
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_thirdPicSelect%,  %y_thirdPicSelect%
Sleep, %time_PictureLoad%
  ; like it
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_doubleClickWaitInverval%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_goBackWait%
; go back to profile page
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_goBackButton%,  %y_goBackButton%
Sleep, %time_ProfilePageLoad%
; go back to follower list
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_goBackButton%,  %y_goBackButton%
Sleep, %time_FollowerListLoad%


 ; -------------------------------------------------------------------------
 ; select third profile follower
 WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_thirdProfileFollower%,  %y_thirdProfileFollower%
Sleep, %time_ProfilePageLoad%
 ; select first pic
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_firstPicSelect%,  %y_firstPicSelect%
Sleep, %time_PictureLoad%
  ; like it
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_doubleClickWaitInverval%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_goBackWait%
; go back to profil page
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_goBackButton%,  %y_goBackButton%
Sleep, %time_ProfilePageLoad%

 ; select second picture
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_secondPicSelect%,  %y_secondPicSelect%
Sleep, %time_PictureLoad%
  ; like it
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_doubleClickWaitInverval%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_goBackWait%
; go back to profil page 
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_goBackButton%,  %y_goBackButton%
Sleep, %time_ProfilePageLoad%

 ; select third pic
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_thirdPicSelect%,  %y_thirdPicSelect%
Sleep, %time_PictureLoad%
  ; like it
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_doubleClickWaitInverval%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_goBackWait%
; go back to profile page
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_goBackButton%,  %y_goBackButton%
Sleep, %time_ProfilePageLoad%
; go back to follower list
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_goBackButton%,  %y_goBackButton%
Sleep, %time_FollowerListLoad%

 ; -------------------------------------------------------------------------
 ; select forth profile follower
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_forthProfileFollower%,  %y_forthProfileFollower% ; REPLACE WITH COORDS OF PROFILE#(1st person in list, 2nd, etc)
Sleep, %time_ProfilePageLoad%
 ; select first pic
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_firstPicSelect%,  %y_firstPicSelect%
Sleep, %time_PictureLoad%
  ; like it
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_doubleClickWaitInverval%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_goBackWait%
; go back to profil page
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_goBackButton%,  %y_goBackButton%
Sleep, %time_ProfilePageLoad%

 ; select second picture
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_secondPicSelect%,  %y_secondPicSelect%
Sleep, %time_PictureLoad%
  ; like it
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_doubleClickWaitInverval%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_goBackWait%
; go back to profil page 
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_goBackButton%,  %y_goBackButton%
Sleep, %time_ProfilePageLoad%

 ; select third pic
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_thirdPicSelect%,  %y_thirdPicSelect%
Sleep, %time_PictureLoad%
  ; like it
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_doubleClickWaitInverval%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_goBackWait%
; go back to profile page
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_goBackButton%,  %y_goBackButton%
Sleep, %time_ProfilePageLoad%
; go back to follower list
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_goBackButton%,  %y_goBackButton%
Sleep, %time_FollowerListLoad%

 ; -------------------------------------------------------------------------
 ; select fifth profile follower
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_fifthProfileFollower%,  %y_fifthProfileFollower% ; REPLACE WITH COORDS OF PROFILE#(1st person in list, 2nd, etc)
Sleep, %time_ProfilePageLoad%
 ; select first pic
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_firstPicSelect%,  %y_firstPicSelect%
Sleep, %time_PictureLoad%
  ; like it
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_doubleClickWaitInverval%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_goBackWait%
; go back to profil page
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_goBackButton%,  %y_goBackButton%
Sleep, %time_ProfilePageLoad%

 ; select second picture
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_secondPicSelect%,  %y_secondPicSelect%
Sleep, %time_PictureLoad%
  ; like it
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_doubleClickWaitInverval%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_goBackWait%
; go back to profil page 
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_goBackButton%,  %y_goBackButton%
Sleep, %time_ProfilePageLoad%

 ; select third pic
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_thirdPicSelect%,  %y_thirdPicSelect%
Sleep, %time_PictureLoad%
  ; like it
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_doubleClickWaitInverval%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
MouseClick, left,  %x_likeLocation%,  %y_likeLocation%
Sleep, %time_goBackWait%
; go back to profile page
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_goBackButton%,  %y_goBackButton%
Sleep, %time_ProfilePageLoad%
; go back to follower list
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_goBackButton%,  %y_goBackButton%
Sleep, %time_FollowerListLoad%

 ; -------------------------------------------------------------------------
 ; FINAL ACTIONS
; go back to main profile page (of account logged in as)
WinWait, BlueStacks App Player, 
IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
WinWaitActive, BlueStacks App Player, 
MouseClick, left,  %x_goBackButton%,  %y_goBackButton%
 ; -------------------------------------------------------------------------
 ; -------------------------------------------------------------------------