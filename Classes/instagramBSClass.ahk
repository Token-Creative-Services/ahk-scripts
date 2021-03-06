 ; DESCRIPTION:      This class hosts all details about Instagram running with blueStacks directly
 ; Last Updated:     12/29/2016
 ;
 ; DYNAMIC: 
 ; -As long as assignScreenResolution() is called in calling script, context of X/Ys will be known
 ; -As long as assignLoadTimes(param1) is called in calling script, context of load times will be known
 ; ----------------------------------------------------
 ; ----------------------------------------------------
class InstagramBS{
	;// ATTRIBUTES OF CLASS
	;// Location of profile (bottom-right most) button
	 x_profileButton :=
	 y_profileButton :=
	 ;// Location of home (bottom-left most) button
	 x_homeButton :=
	 y_homeButton :=
	 ;// Location of search (bottom left) button
	 x_searchButton :=
	 y_searchButton :=
	 ;// Location of activity (bottom right) button
	 x_activityFeed :=
	 y_activityFeed :=
	 ;// Location of followers list
	x_followersList :=
	y_followersList :=
	 ;// Location of where the user profile clicks are in the follower's list
	x_firstProfileFollower :=
	y_firstProfileFollower :=
	x_secondProfileFollower :=
	y_secondProfileFollower :=
	x_thirdProfileFollower :=
	y_thirdProfileFollower :=
	x_forthProfileFollower :=
	y_forthProfileFollower :=
	x_fifthProfileFollower :=
	y_fifthProfileFollower :=
	x_sixthProfileFollower :=
	y_sixthProfileFollower :=
	x_seventhProfileFollower :=
	y_seventhProfileFollower :=
	x_eighthProfileFollower :=
	y_eighthProfileFollower :=
	;//Location of the profile in IG to switch between (logged-in accounts). Max = 5
	x_profileDropDown :=
	y_profileDropDown :=
	;FIRST PROFILE IS ALWAYS SELECT BY DEFAULT WHEN LAUNCHING IG APP
	x_firstAccount :=
	y_firstAccount :=
	x_secondAccount :=
	y_secondAccount :=
	x_thirdAccount :=
	y_thirdAccount :=
	x_forthAccount :=
	y_forthAccount :=
	x_fifthAccount :=
	y_fifthAccount :=
	 ;// location of pictures in user's main page
	x_firstPicSelect :=
	y_firstPicSelect :=
	x_secondPicSelect :=
	y_secondPicSelect :=
	x_thirdPicSelect :=
	y_thirdPicSelect :=
	 ;//LIKE location (to double click at)
	 x_likeLocation := ; Passed to likePicture function
	 y_likeLocation := ; Passed to likePicture function
	 ;// Go back button
	x_goBackButton := ; Passed to goBackClick function
	y_goBackButton := ; Passed to goBackClick function
	;//location of similar profiles drop down
	x_similarProfileDropDown :=
	y_similarProfileDropDown :=
	;//Where the followButton is (inside the similar profile feed)
	x_followButtonInAccountFeed := 
	y_followButtonInAccountFeed :=
	;//where the IG app lives on the ParallelSpace app listing page
	x_parallelSpaceIGApp := 
	y_parallelSpaceIGApp := 
	;//Where the first follow button in the pic liker list is
	x_firstPicLiker :=
	y_firstPicLiker :=
	;Space in bluestakcs where the parallelSpace tab is open
	x_parallelSpaceIGMenuItem :=
	y_parallelSpaceIGMenuItem :=
	;the area to check for background colour on profile following list pop out
	x_profileFollowDropDownListBackground :=
	y_profileFollowDropDownListBackground :=
	
	;/TIME - For these we start with a "baseline" time, and then set each user's profile a quantitative ration (1.0 for same load times, 1.5 for 50% longer load times) to auto computre the times
	;//Time optomization for click events
	time_FollowerListLoad := "2000" ; load time for list of followers
	time_ProfilePageLoad := "2000" ; load time for profile page of a user
	time_PictureLoad := "1000" ; load time for a picture
	time_doubleClickWaitInverval := "100" ; how long to wait between click events to simulate a double click
	time_goBackWait := "100" ; How long to wait after going back
	time_searchExplorePageLoad :=  "3000" ;load time for the search/explore page
	time_homePageLoad :=  "3000" ;load time for homepage/feed
	time_activityFeedPageLoad := "3000" ;load time for activityFeed page
	time_ProfilePageSwapLoad := "10000" ; when changing profile's of logged in users, load time it takes to load the switching-to profile page
	time_loggedInProfileDropDownListLoad := "2000" ; how long the profile drop down of accounts
	time_similarProfilesDropDownLoad := "3000" ;how long it takes for the similar profile's drop down to load a feed of accounts
	time_SimilarProfileFeedClickFollowSlide := "200" ;how long it takes the similar profile feed to slide to the next profile after a click. HOW FAST do you want to click (in loop scenario)
	time_parallelSpaceAppPageLoad := "3000" ;How long it takes parallel space to load app the app listing page during account switch
	;time_maxClickFollowInterval := "200" ;how quickly can you perform a click to follow aciton on users in a list
	time_IGToParallelSpaceAppSwitch := "6000" ;when clicking the parallel space menu item, how long it takes so switch apps
	;The ratio of time at which the script will operate at. Passed into script via method param, used to calculate load times
	timeRatio :=
	
	; These are GLOBALLY STATIC across all profiles for this class(so we assign defaults)
	title_blueStacksWindow := "BlueStacks App Player" ; Name of the blueStacks Window
	colour_profilePicAreaBackground := "0xFFFFFF" ;The blank space colour on a profile (like if an image post square wasnt filled with an image (prepended 0x)
	colour_followButtonAreaBackground := "0x3897F0" ;Colour of the blue follow button
	colour_followListAreaBackground := "0xF6F7F7" ;colour of the profile follow pop-down  used to follow new accounts
	;count_usersInList := "17" ;The number of users seen on-screen in a list at one time (ex People who liked a pic *******NOT USED SO FAR
	;Rate limiters
	rate_maxFollowPerProfile := "25" ;How many accounts do we follow in the feed
	rate_maxHourlyFollow := "200" ;How many follows can we do in total per hour, per account
	
	;-------------------------------------------------------------------------------------------------------------
	
	;Function that will actually go ahead and create the error log
	; Writes: Date/time,  e.What (what happened), e.File (where it happened), e.Line (where in the file it threw)
	;NOTE: Script must be running as an admin for this to function (Program Files is an admin-only dir)
	createErrorLogEvent(message, line)
	{
		;Set the path of where we save to
		logFilePath := % A_ProgramFiles . "\Token\Automation\logs\log.csv"
		;Set the date/time the event is happening at
		FormatTime, CurrentDateTime,, yyyy/MM/dd HH:mm:ss
		;TRY to open the log file
		try { 		
			file := FileOpen(logFilePath, "a") ; Opens log file in append mode
		}
		catch e{
			MsgBox, Log file could not be found/opened. Attempted to output to: %logFilePath% e.What
			Exit
		}
		try {
			msgBox, Error detected. Please check the logs.
			file.Write(CurrentDateTime), file.Write(",") ;date
			file.Write(message), file.Write(",") ;message
			file.Write(A_LineFile), file.Write(",") ;failing file
			file.Write(line), file.Write(",") ; failed line
			file.Write("`r" ) ; newline
			file.fileClose()
		}
		catch e{
			MsgBox, Log file could written to. Attempted to write to: %logFilePath%
			Exit
		}
	}
	
	;find screen resolution of the current primary monitor and assigns the pixel X/Ys by dimensions available to class
	assignScreenResolution()
	{
		screenResolution := A_ScreenWidth . "x" . A_ScreenHeight
		if (screenResolution = "1680x1050"){
			This.Set1680x1050()
		}
		else if (screenResolution = "1600x900"){
			This.Set1600x900()
		}
		else if (screenResolution = "1440x900"){
			This.Set1440x900()
		}
		else if (screenResolution = "1920x1080"){
			This.Set1920x1080()
		}
		else if (screenResolution = "1366x768"){
			This.Set1366x768()
		}
		;else if ()...
		else 
		{
				MsgBox, Current resolution was undetected or is unsupported. Running with default 1920x1080, but is recommended you contact development for support. 
				This.Set1920x1080()
		}
	}
	
	; Set the dimensions of the IGClass X/Ys, based on the predefined resolutions/locations for a computer running 1366x768
	Set1366x768() 
	{
		This.x_profileButton := "845"
		This.y_profileButton := "750"
		This.x_homeButton := "520"
		This.y_homeButton := This.y_profileButton
		This.x_searchButton := "600"
		This.y_searchButton := This.y_profileButton
		This.x_activityFeed := "760"
		This.y_activityFeed := This.y_profileButton
		This.x_followersList := "825"
		This.y_followersList := "100"
		This.x_firstProfileFollower := "530"
		This.y_firstProfileFollower := "100"
		This.x_secondProfileFollower := This.x_firstProfileFollower
		This.y_secondProfileFollower := "125"
		This.x_thirdProfileFollower := This.x_firstProfileFollower
		This.y_thirdProfileFollower := "175"
		This.x_forthProfileFollower := This.x_firstProfileFollower
		This.y_forthProfileFollower := "210"
		This.x_fifthProfileFollower := This.x_firstProfileFollower
		This.y_fifthProfileFollower := "250"
		This.x_sixthProfileFollower := This.x_firstProfileFollower
		This.y_sixthProfileFollower := "280"
		This.x_seventhProfileFollower := This.x_firstProfileFollower
		This.y_seventhProfileFollower := "320"
		This.x_eighthProfileFollower := This.x_firstProfileFollower
		This.y_eighthProfileFollower := "358"
		This.x_profileDropDown := "520"
		This.y_profileDropDown := "70"
		This.x_firstAccount := This.x_profileDropDown
		This.y_firstAccount := "100"
		This.x_secondAccount := This.x_profileDropDown
		This.y_secondAccount := "130"
		This.x_thirdAccount := This.x_profileDropDown
		This.y_thirdAccount := "155"
		This.x_forthAccount := This.x_profileDropDown
		This.y_forthAccount := "185"
		This.x_fifthAccount := This.x_profileDropDown
		This.y_fifthAccount := "215"
		This.x_firstPicSelect := "560"
		This.y_firstPicSelect := "390"			
		This.x_secondPicSelect := "675"
		This.y_secondPicSelect := This.y_firstPicSelect
		This.x_thirdPicSelect := "815"
		This.y_thirdPicSelect := This.y_firstPicSelect
		This.x_likeLocation := "880"
		This.y_likeLocation := "180"
		This.x_goBackButton := "490"
		This.y_goBackButton := "70"
		This.x_similarProfileDropDown := "870"
		This.y_similarProfileDropDown := "130"
		This.x_profileFollowDropDownListBackground := "680"
		This.y_profileFollowDropDownListBackground := "170"
		This.x_followButtonInAccountFeed := "558"
		This.y_followButtonInAccountFeed := "285"
		This.x_parallelSpaceIGApp := "550"
		This.y_parallelSpaceIGApp := "200"
		This.x_parallelSpaceIGMenuItem := "470"
		This.y_parallelSpaceIGMenuItem := "15"
	}
	; Set the dimensions of the IGClass X/Ys, based on the predefined resolutions/locations for a computer running 1680x1050
	Set1680x1050() 
	{
		This.x_profileButton := "1075"
		This.y_profileButton := "1035"
		This.x_homeButton := "615"
		This.y_homeButton := This.y_profileButton
		This.x_searchButton := "725"
		This.y_searchButton := This.y_profileButton
		This.x_activityFeed := "955"
		This.y_activityFeed := This.y_profileButton
		This.x_followersList := "1035"
		This.y_followersList := "135"
		This.x_firstProfileFollower := "630"
		This.y_firstProfileFollower := "129"
		This.x_secondProfileFollower := This.x_firstProfileFollower
		This.y_secondProfileFollower := "170"
		This.x_thirdProfileFollower := This.x_firstProfileFollower
		This.y_thirdProfileFollower := "225"
		This.x_forthProfileFollower := This.x_firstProfileFollower
		This.y_forthProfileFollower := "280"
		This.x_fifthProfileFollower := This.x_firstProfileFollower
		This.y_fifthProfileFollower := "330"
		This.x_sixthProfileFollower := This.x_firstProfileFollower
		This.y_sixthProfileFollower := "375"
		This.x_seventhProfileFollower := This.x_firstProfileFollower
		This.y_seventhProfileFollower := "425"
		This.x_eighthProfileFollower := This.x_firstProfileFollower
		This.y_eighthProfileFollower := "475"
		This.x_profileDropDown := "645"
		This.y_profileDropDown := "75"
		This.x_firstAccount := "630"
		This.y_firstAccount := "115"
		This.x_secondAccount := This.x_firstAccount
		This.y_secondAccount := "160"
		This.x_thirdAccount := This.x_firstAccount
		This.y_thirdAccount := "210"
		This.x_forthAccount := This.x_firstAccount
		This.y_forthAccount := "259"
		This.x_fifthAccount := This.x_firstAccount
		This.y_fifthAccount := "285"
		This.x_firstPicSelect := "690"
		This.y_firstPicSelect := "690"			
		This.x_secondPicSelect := "875"
		This.y_secondPicSelect := This.y_firstPicSelect
		This.x_thirdPicSelect := "1050"
		This.y_thirdPicSelect := This.y_firstPicSelect
		This.x_likeLocation := "1010"
		This.y_likeLocation := "350"
		This.x_goBackButton := "580"
		This.y_goBackButton := "80"
		This.x_similarProfileDropDown := "1105"
		This.y_similarProfileDropDown := "170"
		This.x_followButtonInAccountFeed := "670"
		This.y_followButtonInAccountFeed := "380"
		This.x_parallelSpaceIGApp := "665"
		This.y_parallelSpaceIGApp := "270"
		This.x_parallelSpaceIGMenuItem := "500"
		This.y_parallelSpaceIGMenuItem := "20"
		This.x_profileFollowDropDownListBackground := "845"
		This.y_profileFollowDropDownListBackground := "230"
	}
	; Set the dimensions of the IGClass X/Ys, based on the predefined resolutions/locations for a computer running 1600x900
	Set1600x900() 
	{
		This.x_profileButton := "990"
		This.y_profileButton := "880"
		This.x_homeButton := "605"
		This.y_homeButton := This.y_profileButton
		This.x_searchButton := "705"
		This.y_searchButton := This.y_profileButton
		This.x_activityFeed := "900"
		This.y_activityFeed := This.y_profileButton
		This.x_followersList := "975"
		This.y_followersList := "125"
		This.x_firstProfileFollower := "625"
		This.y_firstProfileFollower := "115"
		This.x_secondProfileFollower := This.x_firstProfileFollower
		This.y_secondProfileFollower := "155"
		This.x_thirdProfileFollower := This.x_firstProfileFollower
		This.y_thirdProfileFollower := "200"
		This.x_forthProfileFollower := This.x_firstProfileFollower
		This.y_forthProfileFollower := "240"
		This.x_fifthProfileFollower := This.x_firstProfileFollower
		This.y_fifthProfileFollower := "280"
		This.x_sixthProfileFollower := This.x_firstProfileFollower
		This.y_sixthProfileFollower := "330"
		This.x_seventhProfileFollower := This.x_firstProfileFollower
		This.y_seventhProfileFollower := "370"
		This.x_eighthProfileFollower := This.x_firstProfileFollower
		This.y_eighthProfileFollower := "410"
		This.x_profileDropDown := "610"
		This.y_profileDropDown := "75"
		This.x_firstAccount := "610"
		This.y_firstAccount := "110"
		This.x_secondAccount := This.x_firstAccount
		This.y_secondAccount := "143"
		This.x_thirdAccount := This.x_firstAccount
		This.y_thirdAccount := "181"
		This.x_forthAccount := This.x_firstAccount
		This.y_forthAccount := "213"
		This.x_fifthAccount := This.x_firstAccount
		This.y_fifthAccount := "250"
		This.x_firstPicSelect := "580"
		This.y_firstPicSelect := "690"			
		This.x_secondPicSelect := "820"
		This.y_secondPicSelect := This.y_firstPicSelect
		This.x_thirdPicSelect := "970"
		This.y_thirdPicSelect := This.y_firstPicSelect
		This.x_likeLocation := "1035"
		This.y_likeLocation := "255"
		This.x_goBackButton := "580"
		This.y_goBackButton := "75"
		This.x_similarProfileDropDown := "1025"
		This.y_similarProfileDropDown := "150"
		This.x_profileFollowDropDownListBackground := "810"
		This.y_profileFollowDropDownListBackground := "200"
		This.x_followButtonInAccountFeed := "650"
		This.y_followButtonInAccountFeed := "330"
		This.x_parallelSpaceIGApp := "640"
		This.y_parallelSpaceIGApp := "230"
		This.x_parallelSpaceIGMenuItem := "500"
		This.y_parallelSpaceIGMenuItem := "20"
	}
	; Set the dimensions of the IGClass X/Ys, based on the predefined resolutions/locations for a computer running 1440x900
	Set1440x900() 
	{
		This.x_profileButton := "915"
		This.y_profileButton := "885"
		This.x_homeButton := "525"
		This.y_homeButton := This.y_profileButton
		This.x_searchButton := "620"
		This.y_searchButton := This.y_profileButton
		This.x_activityFeed := "815"
		This.y_activityFeed := This.y_profileButton
		This.x_followersList := "890"
		This.y_followersList := "115"
		This.x_firstProfileFollower := "560"
		This.y_firstProfileFollower := "110"
		This.x_secondProfileFollower := This.x_firstProfileFollower
		This.y_secondProfileFollower := "155"
		This.x_thirdProfileFollower := This.x_firstProfileFollower
		This.y_thirdProfileFollower := "200"
		This.x_forthProfileFollower := This.x_firstProfileFollower
		This.y_forthProfileFollower := "240"
		This.x_fifthProfileFollower := This.x_firstProfileFollower
		This.y_fifthProfileFollower := "280"
		This.x_sixthProfileFollower := This.x_firstProfileFollower
		This.y_sixthProfileFollower := "325"
		This.x_seventhProfileFollower := This.x_firstProfileFollower
		This.y_seventhProfileFollower := "370"
		This.x_eighthProfileFollower := This.x_firstProfileFollower
		This.y_eighthProfileFollower := "410"
		This.x_profileDropDown := "520"
		This.y_profileDropDown := "70"
		This.x_firstAccount := "520"
		This.y_firstAccount := "110"
		This.x_secondAccount := This.x_firstAccount
		This.y_secondAccount := "145"
		This.x_thirdAccount := This.x_firstAccount
		This.y_thirdAccount := "180"
		This.x_forthAccount := This.x_firstAccount
		This.y_forthAccount := "210"
		This.x_fifthAccount := This.x_firstAccount
		This.y_fifthAccount := "250"
		This.x_firstPicSelect := "590"
		This.y_firstPicSelect := "575"			
		This.x_secondPicSelect := "720"
		This.y_secondPicSelect := This.y_firstPicSelect
		This.x_thirdPicSelect := "890"
		This.y_thirdPicSelect := This.y_firstPicSelect
		This.x_likeLocation := "955"
		This.y_likeLocation := "275"
		This.x_goBackButton := "500"
		This.y_goBackButton := "75"
		This.x_similarProfileDropDown := "945"
		This.y_similarProfileDropDown := "150"
		This.x_profileFollowDropDownListBackground := "715"
		This.y_profileFollowDropDownListBackground := "200"
		This.x_followButtonInAccountFeed := "570"
		This.y_followButtonInAccountFeed := "330"
		This.x_parallelSpaceIGApp := "560"
		This.y_parallelSpaceIGApp := "230"
		This.x_parallelSpaceIGMenuItem := "530"
		This.y_parallelSpaceIGMenuItem := "20"
	}
	; MsgBox, %A_ScreenWidth%x%A_ScreenHeight%
	; Set the dimensions of the IGClass X/Ys, based on the predefined resolutions/locations for a computer running 1920x1080
	Set1920x1080() 
	{
			This.x_profileButton := "1195"
			This.y_profileButton := "1060"
			This.x_homeButton := "730"
			This.y_homeButton := This.y_profileButton
			This.x_searchButton := "845"
			This.y_searchButton := This.y_profileButton
			This.x_activityFeed := "1075"
			This.y_activityFeed := This.y_profileButton
			This.x_followersList := "1160"
			This.y_followersList := "130"
			This.x_firstProfileFollower := "755"
			This.y_firstProfileFollower := "120"
			This.x_secondProfileFollower := This.x_firstProfileFollower
			This.y_secondProfileFollower := "163"
			This.x_thirdProfileFollower := This.x_firstProfileFollower
			This.y_thirdProfileFollower := "226"
			This.x_forthProfileFollower := This.x_firstProfileFollower
			This.y_forthProfileFollower := "275"
			This.x_fifthProfileFollower := This.x_firstProfileFollower
			This.y_fifthProfileFollower := "327"
			This.x_sixthProfileFollower := This.x_firstProfileFollower
			This.y_sixthProfileFollower := "325"
			This.x_seventhProfileFollower := This.x_firstProfileFollower
			This.y_seventhProfileFollower := "375"
			This.x_eighthProfileFollower := This.x_firstProfileFollower
			This.y_eighthProfileFollower := "480"
			This.x_profileDropDown := "730"
			This.y_profileDropDown := "65"
			This.x_firstAccount := "730"
			This.y_firstAccount := "99"
			This.x_secondAccount := This.x_firstAccount
			This.y_secondAccount := "148"
			This.x_thirdAccount := This.x_firstAccount
			This.y_thirdAccount := "188"
			This.x_forthAccount := This.x_firstAccount
			This.y_forthAccount := "235"
			This.x_fifthAccount := This.x_firstAccount
			This.y_fifthAccount := "278"
			This.x_firstPicSelect := "770"
			This.y_firstPicSelect := "660"			
			This.x_secondPicSelect := "956"
			This.y_secondPicSelect := This.y_firstPicSelect
			This.x_thirdPicSelect := "1160"
			This.y_thirdPicSelect := This.y_firstPicSelect
			This.x_likeLocation := "1220"
			This.y_likeLocation := "200"
			This.x_parallelSpaceIGMenuItem := "500"
			This.y_parallelSpaceIGMenuItem := "10"
			This.x_goBackButton := "685"
			This.y_goBackButton := "80"
			This.x_similarProfileDropDown := "1225"
			This.y_similarProfileDropDown := "170"
			This.x_followButtonInAccountFeed := "775"
			This.y_followButtonInAccountFeed := "381"
			This.x_parallelSpaceIGApp := "760"
			This.y_parallelSpaceIGApp := "250"
			This.x_profileFollowDropDownListBackground := "1000"
			This.y_profileFollowDropDownListBackground := "230"
	}
	
		;calculate the loadTimes based on the passed in speed ratio via radio button
	assignLoadTimes(variablePassedIn)
	{
			;~ MsgBox, Variable passed in is %variablePassedIn%
			if(variablePassedIn = "1")
			{
			This.timeRatio := "1.0"
			This.time_FollowerListLoad := (This.time_FollowerListLoad * This.timeRatio)
			This.time_ProfilePageLoad := (This.time_ProfilePageLoad * This.timeRatio)
			This.time_ProfilePageSwapLoad := (This.time_ProfilePageSwapLoad * This.timeRatio)
			This.time_PictureLoad := (This.time_PictureLoad * This.timeRatio)
			This.time_doubleClickWaitInverval := (This.time_doubleClickWaitInverval * This.timeRatio)
			This.time_goBackWait := (This.time_goBackWait * This.timeRatio)
			This.time_searchExplorePageLoad := (This.time_searchExplorePageLoad * This.timeRatio)
			This.time_homePageLoad := (This.time_homePageLoad * This.timeRatio)
			This.time_activityFeedPageLoad := (This.time_activityFeedPageLoad * This.timeRatio)
			This.time_loggedInProfileDropDownListLoad := (This.time_loggedInProfileDropDownListLoad * This.timeRatio)
			This.time_similarProfilesDropDownLoad := (This.time_similarProfilesDropDownLoad * This.timeRatio)
			This.time_similarProfilesDropDownLoad := (This.time_similarProfilesDropDownLoad * This.timeRatio)
			This.time_parallelSpaceAppPageLoad := (This.time_parallelSpaceAppPageLoad * This.timeRatio)
			This.time_IGToParallelSpaceAppSwitch := (This.time_IGToParallelSpaceAppSwitch * This.timeRatio)
			}
			if(variablePassedIn = "2")
			{		
			This.timeRatio := "1.5"
			This.time_FollowerListLoad := (This.time_FollowerListLoad * This.timeRatio)
			This.time_ProfilePageLoad := (This.time_ProfilePageLoad * This.timeRatio)
			This.time_ProfilePageSwapLoad := (This.time_ProfilePageSwapLoad * This.timeRatio)
			This.time_PictureLoad := (This.time_PictureLoad * This.timeRatio)
			This.time_doubleClickWaitInverval := (This.time_doubleClickWaitInverval * This.timeRatio)
			This.time_goBackWait := (This.time_goBackWait * This.timeRatio)
			This.time_searchExplorePageLoad := (This.time_searchExplorePageLoad * This.timeRatio)
			This.time_homePageLoad := (This.time_homePageLoad * This.timeRatio)
			This.time_activityFeedPageLoad := (This.time_activityFeedPageLoad * This.timeRatio)
			This.time_loggedInProfileDropDownListLoad := (This.time_loggedInProfileDropDownListLoad * This.timeRatio)
			This.time_similarProfilesDropDownLoad := (This.time_similarProfilesDropDownLoad * This.timeRatio)
			This.time_similarProfilesDropDownLoad := (This.time_similarProfilesDropDownLoad * This.timeRatio)
			This.time_parallelSpaceAppPageLoad := (This.time_parallelSpaceAppPageLoad * This.timeRatio)
			This.time_IGToParallelSpaceAppSwitch := (This.time_IGToParallelSpaceAppSwitch * This.timeRatio)
			}
			if(variablePassedIn = "3")
			{
			This.timeRatio := "2.0"
			This.time_FollowerListLoad := (This.time_FollowerListLoad * This.timeRatio)
			This.time_ProfilePageLoad := (This.time_ProfilePageLoad * This.timeRatio)
			This.time_ProfilePageSwapLoad := (This.time_ProfilePageSwapLoad * This.timeRatio)
			This.time_PictureLoad := (This.time_PictureLoad * This.timeRatio)
			This.time_doubleClickWaitInverval := (This.time_doubleClickWaitInverval * This.timeRatio)
			This.time_goBackWait := (This.time_goBackWait * This.timeRatio)
			This.time_searchExplorePageLoad := (This.time_searchExplorePageLoad * This.timeRatio)
			This.time_homePageLoad := (This.time_homePageLoad * This.timeRatio)
			This.time_activityFeedPageLoad := (This.time_activityFeedPageLoad * This.timeRatio)
			This.time_loggedInProfileDropDownListLoad := (This.time_loggedInProfileDropDownListLoad * This.timeRatio)
			This.time_similarProfilesDropDownLoad := (This.time_similarProfilesDropDownLoad * This.timeRatio)
			This.time_similarProfilesDropDownLoad := (This.time_similarProfilesDropDownLoad * This.timeRatio)
			This.time_parallelSpaceAppPageLoad := (This.time_parallelSpaceAppPageLoad * This.timeRatio)
			This.time_IGToParallelSpaceAppSwitch := (This.time_IGToParallelSpaceAppSwitch * This.timeRatio)
			}
			if(variablePassedIn = "4")
			{
			This.timeRatio := "2.5"
			This.time_FollowerListLoad := (This.time_FollowerListLoad * This.timeRatio)
			This.time_ProfilePageLoad := (This.time_ProfilePageLoad * This.timeRatio)
			This.time_ProfilePageSwapLoad := (This.time_ProfilePageSwapLoad * This.timeRatio)
			This.time_PictureLoad := (This.time_PictureLoad * This.timeRatio)
			This.time_doubleClickWaitInverval := (This.time_doubleClickWaitInverval * This.timeRatio)
			This.time_goBackWait := (This.time_goBackWait * This.timeRatio)
			This.time_searchExplorePageLoad := (This.time_searchExplorePageLoad * This.timeRatio)
			This.time_homePageLoad := (This.time_homePageLoad * This.timeRatio)
			This.time_activityFeedPageLoad := (This.time_activityFeedPageLoad * This.timeRatio)
			This.time_loggedInProfileDropDownListLoad := (This.time_loggedInProfileDropDownListLoad * This.timeRatio)
			This.time_similarProfilesDropDownLoad := (This.time_similarProfilesDropDownLoad * This.timeRatio)
			This.time_similarProfilesDropDownLoad := (This.time_similarProfilesDropDownLoad * This.timeRatio)
			This.time_parallelSpaceAppPageLoad := (This.time_parallelSpaceAppPageLoad * This.timeRatio)
			This.time_IGToParallelSpaceAppSwitch := (This.time_IGToParallelSpaceAppSwitch * This.timeRatio)
			}
	}
	
	; Using the title of the BlueStacks window, make it active/force it into view
	; Validation: Is the currently active window what we actually attempt to set things to?
	activateBlueStacksWindow()
	{
		try {
			WinActivate, % This.title_blueStacksWindow,
			WinWaitActive, % This.title_blueStacksWindow, 
			if !WinActive(This.title_blueStacksWindow) {
				throw { what: "Failure activating window via activateBlueStacksWindow()", file: A_LineFile, line: A_LineNumber }
			}
		}
		catch e{
			This.createErrorLogEvent(e.What, e.line)
			Exit
		}
	}
	; Click profile button(bottom right-most button) to ensure you are on the right page
	clickProfileButton()
	{
		This.activateBlueStacksWindow()
		MouseClick, left, % This.x_profileButton,  % This.y_profileButton
		Sleep, % This.time_ProfilePageLoad
	}
	; Click home button(bottom left-most button)
	clickHomeButton()
	 {
		This.activateBlueStacksWindow()
		MouseClick, left, % This.x_homeButton,  % This.y_homeButton
		Sleep, % This.time_homePageLoad
	}
	; Click the search/explore button
	clickSearchButton()
	 {
		This.activateBlueStacksWindow()
		MouseClick, left, % This.x_searchButton,  % This.y_searchButton
		Sleep, % This.time_searchExplorePageLoad
	}
	; Click the acitivity 
	clickActivityButton()
	 {
		This.activateBlueStacksWindow()
		MouseClick, left, % This.x_activityFeed,  % This.y_activityFeed
		Sleep, % This.time_activityFeedPageLoad
	}
	; Click Following List on logged in user's account
	clickFollowingList()
	 {
		This.activateBlueStacksWindow()
		MouseClick, left,  % This.x_followersList,  % This.y_followersList
		Sleep, % This.time_FollowerListLoad
	}
	; Double click action to like a specific picture
	likePicture()
	{
		Sleep, % This.time_PictureLoad
		This.activateBlueStacksWindow()
		MouseMove, % This.x_likeLocation,  % This.y_likeLocation
		MouseClick, left,  % This.x_likeLocation,  % This.y_likeLocation ;Like location
		Sleep, % This.time_doubleClickWaitInverval
		MouseClick, left,  % This.x_likeLocation,  % This.y_likeLocation ;Like location
		Sleep, % This.time_doubleClickWaitInverval
	}
	; Click event to find and click the 'GoBack' button
	goBackToProfileClick()
	{
		This.activateBlueStacksWindow()
		MouseClick, left,  % This.x_goBackButton,  % This.y_goBackButton
		Sleep, % This.time_ProfilePageLoad
	}
	; Click event to find and click the 'GoBack' button
	goBackToFollowerListClick()
	{
		This.activateBlueStacksWindow()
		MouseClick, left,  % This.x_goBackButton,  % This.y_goBackButton
		Sleep, % This.time_FollowerListLoad	
	}
	; Click into the profile of the FIRST user in the list of user's currently being followed (Following list)
	clickFirstProfileFollower()
	{
		This.activateBlueStacksWindow()
		MouseClick, left,  % This.x_firstProfileFollower,  % This.y_firstProfileFollower
		Sleep, % This.time_ProfilePageLoad ; Profile page load time
	}
	; Click into the profile of the SECOND user in the list of user's currently being followed (Following list)
	clickSecondProfileFollower()
	{
		This.activateBlueStacksWindow()
		MouseClick, left,  % This.x_secondProfileFollower,  % This.y_secondProfileFollower
		Sleep, % This.time_ProfilePageLoad ; Profile page load time
	}
	; Click into the profile of the THIRD user in the list of user's currently being followed (Following list)
	clickThirdProfileFollower()
	{
		This.activateBlueStacksWindow()
		MouseClick, left,  % This.x_thirdProfileFollower,  % This.y_thirdProfileFollower
		Sleep, % This.time_ProfilePageLoad ; Profile page load time
	}
	; Click into the profile of the FORTH user in the list of user's currently being followed (Following list)
	clickForthProfileFollower()
	{
		This.activateBlueStacksWindow()
		MouseClick, left,  % This.x_forthProfileFollower,  % This.y_forthProfileFollower
		Sleep, % This.time_ProfilePageLoad ; Profile page load time
	}
	; Click into the profile of the FIFTH user in the list of user's currently being followed (Following list)
	clickFifthProfileFollower()
	{
		This.activateBlueStacksWindow()
		MouseClick, left,  % This.x_fifthProfileFollower,  % This.y_fifthProfileFollower
		Sleep, % This.time_ProfilePageLoad ; Profile page load time
	}
	; Click into the profile of the SIXTH user in the list of user's currently being followed (Following list)
	clickSixthProfileFollower()
	{
		This.activateBlueStacksWindow()
		MouseClick, left,  % This.x_sixthProfileFollower,  % This.y_sixthProfileFollower
		Sleep, % This.time_ProfilePageLoad ; Profile page load time
	}
	; Click into the profile of the SEVENTH user in the list of user's currently being followed (Following list)
	clickSeventhProfileFollower()
	{
		This.activateBlueStacksWindow()
		MouseClick, left,  % This.x_seventhProfileFollower,  % This.y_seventhProfileFollower
		Sleep, % This.time_ProfilePageLoad ; Profile page load time
	}
	; Click into the profile of the EIGHTH user in the list of user's currently being followed (Following list)
	clickEighthProfileFollower()
	{
		This.activateBlueStacksWindow()
		MouseClick, left,  % This.x_eighthProfileFollower,  % This.y_eighthProfileFollower
		Sleep, % This.time_ProfilePageLoad ; Profile page load time
	}
	
	; Click first pic on user profile page
	; Validation: Is the expected click location a blank space? If so, dont click and continue with script
	clickFirstPic()
	 {
			This.activateBlueStacksWindow()
			PixelGetColor, expectedClickLocation, % This.X_firstPicSelect, % This.y_firstPicSelect, RGB ;Look to see if the pic location is blank
			IfEqual, expectedClickLocation,  % This.colour_profilePicAreaBackground ;if the first pic IS blank, we just want to skip it
			{
				return 0 ;exit method and continue with next action
			}
			else 
			{
				This.activateBlueStacksWindow()
				MouseClick, left,  % This.x_firstPicSelect,  % This.y_firstPicSelect ;First pic location
				MouseMove, % This.x_likeLocation,  % This.y_likeLocation
				Sleep, % This.time_PictureLoad ;picutre load time
				return 1 ;return 1 (successful click)
			}
	 }
	 
	; Click second pic on user profile page
	; Validation: Is the expected click location a blank space? If so, dont click and continue with script
	clickSecondPic()
	 {
		PixelGetColor, expectedClickLocation, % This.x_secondPicSelect, % This.y_secondPicSelect, RGB ;Look to see if the pic location is blank
		IfEqual, expectedClickLocation,  % This.colour_profilePicAreaBackground ;if the first pic IS blank, we just want to skip it
		{
			return 0 ;exit method and continue with next action
		}
		else 
		{
			This.activateBlueStacksWindow()
			MouseClick, left,  % This.x_secondPicSelect,  % This.y_secondPicSelect ;First pic location
			MouseMove, % This.x_likeLocation,  % This.y_likeLocation
			Sleep, % This.time_PictureLoad ;picutre load time
			return 1 ;return 1 (successful click)
		}
	}
	; Click third pic on user profile page
	; Validation: Is the expected click location a blank space? If so, dont click and continue with script
	clickThirdPic()
	 {
		PixelGetColor, expectedClickLocation, % This.x_thirdPicSelect, % This.y_thirdPicSelect, RGB ;Look to see if the pic location is blank
		IfEqual, expectedClickLocation,  % This.colour_profilePicAreaBackground ;if the first pic IS blank, we just want to skip it
		{
			return 0 ;exit method and continue with next action
		}
		else 
		{
			This.activateBlueStacksWindow()
			MouseClick, left,  % This.x_thirdPicSelect,  % This.y_thirdPicSelect ;First pic location
			MouseMove, % This.x_likeLocation,  % This.y_likeLocation
			Sleep, % This.time_PictureLoad ;picutre load time
			return 1 ;return 1 (successful click)
			
		}
	}
	; On profile, take three pic and like them
	; Theory: This method can be called to like the 3 pics on a profile that is already loaded/present on screen
	 like3PicsOnUserAccount()
	 {
		global
		; select [FIRST] pic
		 If This.clickFirstPic() = 1
		{
			This.clickFirstPic()
			; like it
			 This.likePicture()
			; go back to profil page
			 This.goBackToProfileClick()
		}

		 ; select [SECOND] picture
		If This.clickSecondPic() = 1
		{
			This.clickSecondPic()
			; like it
			 This.likePicture()
			; go back to profil page
			 This.goBackToProfileClick()
		}

		 ; select [THIRD] pic
		If This.clickThirdPic() =1 
		{
			This.clickThirdPic()
			; like it
			 This.likePicture()
			; go back to profil page
			 This.goBackToProfileClick()
			; go back to follower list
		}
		This.goBackToFollowerListClick()

	 }
	 
	; Switch account to the [SECOND] logged in profile within the IG app
	clickSecondLoggedInAccount()
	{
		This.activateBlueStacksWindow()
		MouseClick, left, % This.x_profileDropDown, % This.y_profileDropDown ; Click the logged in profiles drop down list
		Sleep, % This.time_loggedInProfileDropDownListLoad ; Wait for the drop down of the profiles currently logged
		MouseClick, left,  % This.x_secondAccount,  % This.y_secondAccount ;Click where the profile button is
		Sleep, % This.time_ProfilePageSwapLoad ;profile load time when chaning profiles
	}
	; Switch account to the [THIRD] logged in profile within the IG app
	clickThirdLoggedInAccount()
	{
		This.activateBlueStacksWindow()
		MouseClick, left, % This.x_profileDropDown, % This.y_profileDropDown ; Click the logged in profiles drop down list
		Sleep, % This.time_loggedInProfileDropDownListLoad ; Wait for the drop down of the profiles currently logged
		MouseClick, left,  % This.x_thirdAccount,  % This.y_thirdAccount ;Click where the profile button is
		Sleep, % This.time_ProfilePageSwapLoad ;profile load time when chaning profiles
	}
	; Switch account to the [FORTH] logged in profile within the IG app
	clickForthLoggedInAccount()
	{
		This.activateBlueStacksWindow()
		MouseClick, left, % This.x_profileDropDown, % This.y_profileDropDown ; Click the logged in profiles drop down list
		Sleep, % This.time_loggedInProfileDropDownListLoad ; Wait for the drop down of the profiles currently logged
		MouseClick, left,  % This.x_forthAccount,  % This.y_forthAccount ;Click where the profile button is
		Sleep, % This.time_ProfilePageSwapLoad ;profile load time when chaning profiles
	}
	; Switch account to the [FIFTH] logged in profile within the IG app
	clickFifthLoggedInAccount()
	{
		This.activateBlueStacksWindow()
		MouseClick, left, % This.x_profileDropDown, % This.y_profileDropDown ; Click the logged in profiles drop down list
		Sleep, % This.time_loggedInProfileDropDownListLoad ; Wait for the drop down of the profiles currently logged
		MouseClick, left,  % This.x_fifthAccount,  % This.y_fifthAccount ;Click where the profile button is
		Sleep, % This.time_ProfilePageSwapLoad ;profile load time when chaning profiles
	}
	; Switch account to the [SECOND] logged in profile within the IG app...for PS specifically
	clickSecondLoggedInAccountParallelSpace()
	{
		This.activateBlueStacksWindow()
		MouseClick, left, % This.x_profileDropDown, % This.y_profileDropDown ; Click the logged in profiles drop down list
		Sleep, % This.time_loggedInProfileDropDownListLoad ; Wait for the drop down of the profiles currently logged
		MouseClick, left,  % This.x_secondAccount,  % This.y_secondAccount ;Click where the profile button is
		Sleep, % This.time_parallelSpaceAppPageLoad ;wait for parallel space to bring up its screen
		MouseClick, left, % This.x_parallelSpaceIGApp, % This.y_parallelSpaceIGApp 
		Sleep, % This.time_ProfilePageSwapLoad ;profile load time when chaning profiles
	}
	; Switch account to the [THIRD] logged in profile within the IG app...for PS specifically
	clickThirdLoggedInAccountParallelSpace()
	{
		This.activateBlueStacksWindow()
		MouseClick, left, % This.x_profileDropDown, % This.y_profileDropDown ; Click the logged in profiles drop down list
		Sleep, % This.time_loggedInProfileDropDownListLoad ; Wait for the drop down of the profiles currently logged
		MouseClick, left,  % This.x_thirdAccount,  % This.y_thirdAccount ;Click where the profile button is
		Sleep, % This.time_parallelSpaceAppPageLoad ;wait for parallel space to bring up its screen
		MouseClick, left, % This.x_parallelSpaceIGApp, % This.y_parallelSpaceIGApp 
		Sleep, % This.time_ProfilePageSwapLoad ;profile load time when chaning profiles
	}
	; Switch account to the [FORTH] logged in profile within the IG app...for PS specifically
	clickForthLoggedInAccountParallelSpace()
	{
		This.activateBlueStacksWindow()
		MouseClick, left, % This.x_profileDropDown, % This.y_profileDropDown ; Click the logged in profiles drop down list
		Sleep, % This.time_loggedInProfileDropDownListLoad ; Wait for the drop down of the profiles currently logged
		MouseClick, left,  % This.x_forthAccount,  % This.y_forthAccount ;Click where the profile button is
		Sleep, % This.time_parallelSpaceAppPageLoad ;wait for parallel space to bring up its screen
		MouseClick, left, % This.x_parallelSpaceIGApp, % This.y_parallelSpaceIGApp 
		Sleep, % This.time_ProfilePageSwapLoad ;profile load time when chaning profiles
	}
	; Switch account to the [FIFTH] logged in profile within the IG app...for PS specifically
	clickFifthLoggedInAccountParallelSpace()
	{
		This.activateBlueStacksWindow()
		MouseClick, left, % This.x_profileDropDown, % This.y_profileDropDown ; Click the logged in profiles drop down list
		Sleep, % This.time_loggedInProfileDropDownListLoad ; Wait for the drop down of the profiles currently logged
		MouseClick, left,  % This.x_fifthAccount,  % This.y_fifthAccount ;Click where the profile button is
		Sleep, % This.time_parallelSpaceAppPageLoad ;wait for parallel space to bring up its screen
		MouseClick, left, % This.x_parallelSpaceIGApp, % This.y_parallelSpaceIGApp 
		Sleep, % This.time_ProfilePageSwapLoad ;profile load time when chaning profiles
	}
	
	;---------------------------------------------------------------

	; Click the similar profiles drop down on another user's main profile page
	clickSimilarProfileDropDown()
	{
		This.activateBlueStacksWindow()
		MouseClick, left, % This.x_similarProfileDropDown, % This.y_similarProfileDropDown ; Click the logged in profiles drop down list
		Sleep, % This.time_similarProfilesDropDownLoad ;loading time of the dropdown feed of accounts
		
		;colour check validation as sometimes the drop down list of ppl to follow does pop out on first click
		PixelGetColor, expectedFollowClickLocation, % This.x_profileFollowDropDownListBackground, % This.y_profileFollowDropDownListBackground, RGB ;Look to see if the list popped our succesfully
		IfNotEqual, expectedFollowClickLocation,  % This.colour_followListAreaBackground ;if the colour is NOT grey, that means the list didnt load and we need to click on it again
		{
			MouseClick, left, % This.x_similarProfileDropDown, % This.y_similarProfileDropDown ; Click the logged in profiles drop down list
			Sleep, % This.time_similarProfilesDropDownLoad ;loading time of the dropdown feed of accounts
		}
		
	}	
	
	; From the drop down list of a user's main page, click the follow button (on the first account) inside the feed
	clickFollowButtonInAccountFeed()
	{
		This.activateBlueStacksWindow()
		PixelGetColor, expectedFollowClickLocation, % This.x_followButtonInAccountFeed, % This.y_followButtonInAccountFeed, RGB ;Look to see if the follow button is click-able

		IfEqual, expectedFollowClickLocation,  % This.colour_followButtonAreaBackground ;if the colour is blue (to indicate we can follow), we click to follow
		{
			This.activateBlueStacksWindow()
			MouseClick, left, % This.x_followButtonInAccountFeed, % This.y_followButtonInAccountFeed ; Click the follow button in the activity list
			Sleep, % This.time_SimilarProfileFeedClickFollowSlide ;loading time of the follow button slide
			
			return 1 ;return 1 (successful click)
		}
		return 0 ;at the end, no matter a follow was pressed or not, return so loops can continue
	}
	
	;From a user's profile page, click the drop down and follow as many accounts as the max allows for
	;Combining clickSimilarProfileDropDown() && clickFollowButtonInAccountFeed()
	clickAndFollowFromProfilePageFeed()
	{
		This.clickSimilarProfileDropDown()
		Loop % This.rate_maxFollowPerProfile { 
			This.clickFollowButtonInAccountFeed()
		}
		This.goBackToFollowerListClick()
	}
	
	;click the parallel space tab within the bluestacks app
	clickParallelSpaceMenuTab()
	{
		This.activateBlueStacksWindow()
		MouseClick, left, % This.x_parallelSpaceIGMenuItem, % This.y_parallelSpaceIGMenuItem ; Click the parallel space menu tab at the top
		Sleep, % This.time_IGToParallelSpaceAppSwitch ;loading time app to switch views
	}
	
}