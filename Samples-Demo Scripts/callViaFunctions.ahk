 ; EXAMPLE: How to call functions and pass them variables (no '%'). 

x_followersList := "1160"
y_followersList := "146"
 x_profileButton := "1195"
 y_profileButton := "1061"

time_FollowerListLoad := "2000" ; load time for list of followers
time_ProfilePageLoad := "2000" ; load time for profile page of a user
time_PictureLoad := "1000" ; load time for a picture
time_doubleClickWaitInverval := "100" ; how long to wait between click events to simulate a double click
time_goBackWait := "100"

clickProfileButton(xProfileButton, yProfileButton, profilePageLoadTime)
 {
	 WinWait, BlueStacks App Player, 
	IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
	WinWaitActive, BlueStacks App Player, 
	MouseClick, left,  %xProfileButton%,  %yProfileButton%
	Sleep, %profilePageLoadTime%
}
 
 ; Click Following List
 clickFollowingList(xFollowingList, yFollowingList, followerListLoadTime)
 {
	WinWait, BlueStacks App Player, 
	IfWinNotActive, BlueStacks App Player, , WinActivate, BlueStacks App Player, 
	WinWaitActive, BlueStacks App Player, 
	MouseClick, left,  %xFollowingList%,  %yFollowingList%
	Sleep, %followerListLoadTime%
}

clickProfileButton(x_profileButton, y_profileButton, time_ProfilePageLoad)
clickFollowingList(x_followersList,y_followersList,time_FollowerListLoad)