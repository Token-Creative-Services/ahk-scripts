 ; DESCRIPTION:      This class hosts all details about CrowdFire WebApp
 ; Last Updated:     12/28/2016
 ;
 ; As long as assignScreenResolution() is called in calling script, context of X/Ys will be known
 ; ----------------------------------------------------
 ; ----------------------------------------------------
class crowdFireWebApp {
	;// ATTRIBUTES OF CLASS
	;/LOCATIONS
	;Initial homepage menu button
	x_menuButton :=
	y_menuButton :=
	;Account locations in the left side-bar menu
	x_1AccountMenuLocation :=
	y_1AccountMenuLocation :=
	x_2AccountMenuLocation :=
	y_2AccountMenuLocation :=
	x_3AccountMenuLocation :=
	y_3AccountMenuLocation :=
	x_4AccountMenuLocation :=
	y_4AccountMenuLocation :=
	x_5AccountMenuLocation :=
	y_5AccountMenuLocation :=
	x_6AccountMenuLocation :=
	y_6AccountMenuLocation :=
	x_7AccountMenuLocation :=
	y_7AccountMenuLocation :=
	x_8AccountMenuLocation :=
	y_8AccountMenuLocation :=
	x_9AccountMenuLocation :=
	y_9AccountMenuLocation :=
	x_10AccountMenuLocation :=
	y_10AccountMenuLocation :=
	x_11AccountMenuLocation :=
	y_11AccountMenuLocation :=
	x_12AccountMenuLocation :=
	y_12AccountMenuLocation :=
	x_13AccountMenuLocation :=
	y_13AccountMenuLocation :=
	x_14AccountMenuLocation :=
	y_14AccountMenuLocation :=
	x_15AccountMenuLocation :=
	y_15AccountMenuLocation :=
	; click spot of where the currently select account is. Clicked to toggle between account list and menu of account actions
	x_currentlySelectedAccount :=
	y_currentlySelectedAccount :=
	;Account actions listings
	x_nonFollowersButton := 
	y_nonFollowersButton := 
	x_fansButton :=
	y_fansButton :=
	x_admirerButton :=
	y_admirerButton :=
	;Button location for the red unfollow
	x_unfollowButton :=
	y_unfollowButton :=
	;Where the like button is under the admirers list
	x_likeButtonLocation :=
	y_likeButtonLocation :=
	;Where the follow button on the fans list is
	x_followButtonLocation :=
	y_followButtonLocation :=
	
	;/TIME - For these we start with a "baseline" time, and then set each user's profile a quantitative ration (1.0 for same load times, 1.5 for 50% longer load times) to auto computre the times
	;duration of menu drop down animation
	time_menuToggleTime := "2000"
	;How long it takes to load the list (ex) non-followers list loading time
	time_ListLoadTime := "4000"
	;Time it takes to load admirer pic liking feed
	time_admirerListLoadTime := "15000"
	;Time for page to initially load/be on homepage
	time_initalLaunchLoadTime := "11000"
	;Time to sleep between clicks of the un-follow button
	time_actionButtonPressInterval := "80"
	;Time to sleep between clicks of the like button
	time_likeButtonPressInterval := "400"
	;Time delay after an initial profile swap. Just a small delay before demanding a click next
	time_profileSwapDelay := "500"
	;The ratios for said profiles
	;The ratio of time at which the script will operate at. Passed into script via method param, used to calculate load times
	timeRatio :=
	
	;// These are GLOBALLY STATIC across all profiles for this class(so we assign defaults)
	title_crowdfireWindow := "Firebot - Crowdfire on Desktop - Google Chrome" ; Name of the blueStacks Window
	;/Location/URLs
	url_crowdFireWebsiteURL := "https://web.crowdfireapp.com" ;setting default URL, but is subject to user-specific changes
	path_chromeEXE := "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" ;setting default install location, but is subject to user-specific changes
	launchPath := This.path_chromeEXE . " " . This.url_crowdFireWebsiteURL	;This.launchPath := This.path_chromeEXE . " " . This.url_crowdFireWebsiteURL
	;/COLOURS
	colour_unfollowButton := "0xFF4B4B"
	colour_fanFollowButton := "0x29C64D"
	;/RATE LIMITERS
	;How many actions (follows/unfollows) can we perform in an hour's time?
	rate_hourlyActivityMax := "115"
	;How many picture likes appear in one session of the admirers feed list
	rate_likesInARowMax := "20"
	;How many times to run through the likeViaAdmirer script (since reloading the list can happen 5x, and it has 20 pic likes, for the 100 hourly max)
	rate_likeViaAdmirerListScriptLoop := "2"
	
	;------------------
	;//METHODS OF CLASS
	;Function that will actually go ahead and create the error log. Writes: Date/time,  e.What (what happened), e.File (where it happened), e.Line (where in the file it threw)
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
		else if (screenResolution = "1366x768"){
			This.Set1366x768()
		}
		else if (screenResolution = "1920x1080"){
			This.Set1920x1080()
		}
		else 
		{
				MsgBox, Current resolution was undetected or is unsupported. Running with default 1920x1080, but is recommended you contact development for support. 
				This.Set1920x1080()
		}
		
	}
	; Set the dimensions of the IGClass X/Ys, based on the predefined resolutions/locations for a computer running 1680x1050
	Set1680x1050() 
	{
		This.x_menuButton := "430"
		This.y_menuButton := "125"
		This.x_currentlySelectedAccount := "720"
		This.y_currentlySelectedAccount := This.y_menuButton
		;at this resolution, each Y is exactly 55 apart
		This.x_1AccountMenuLocation := This.x_currentlySelectedAccount ;always the same as the first option
		This.y_1AccountMenuLocation := "230"
		This.x_2AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_2AccountMenuLocation := (This.y_1AccountMenuLocation + 55) ;spacing is always 55 from prev. acc.
		This.x_3AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_3AccountMenuLocation := (This.y_2AccountMenuLocation + 55)
		This.x_4AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_4AccountMenuLocation := (This.y_3AccountMenuLocation + 55)
		This.x_5AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_5AccountMenuLocation := (This.y_4AccountMenuLocation + 55)
		This.x_6AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_6AccountMenuLocation := (This.y_5AccountMenuLocation + 55)
		This.x_7AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_7AccountMenuLocation := (This.y_6AccountMenuLocation + 55)
		This.x_8AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_8AccountMenuLocation := (This.y_7AccountMenuLocation + 55)
		This.x_9AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_9AccountMenuLocation := (This.y_8AccountMenuLocation + 55)
		This.x_10AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_10AccountMenuLocation := (This.y_9AccountMenuLocation + 55)
		This.x_11AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_11AccountMenuLocation := (This.y_10AccountMenuLocation + 55)
		This.x_12AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_12AccountMenuLocation := (This.y_11AccountMenuLocation + 55)
		This.x_13AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_13AccountMenuLocation := (This.y_12AccountMenuLocation + 55)
		This.x_14AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_14AccountMenuLocation := (This.y_13AccountMenuLocation + 55)
		This.x_15AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_15AccountMenuLocation := (This.y_14AccountMenuLocation + 55)
		This.x_nonFollowersButton :=  This.x_currentlySelectedAccount
		This.y_nonFollowersButton :=  "175"
		This.x_fansButton := This.x_currentlySelectedAccount
		This.y_fansButton := "230"
		This.x_admirerButton := This.x_currentlySelectedAccount
		This.y_admirerButton := "420"
		This.x_unfollowButton := "1236"
		This.y_unfollowButton := "364"
		This.x_likeButtonLocation := "1200"
		This.y_likeButtonLocation := "330"
		This.x_followButtonLocation := "1235"
		This.y_followButtonLocation := This.y_unfollowButton
	}
	; Set the dimensions of the IGClass X/Ys, based on the predefined resolutions/locations for a computer running 1600x900
	Set1600x900() 
	{
		This.x_menuButton := "415"
		This.y_menuButton := "125"
		This.x_currentlySelectedAccount := "575"
		This.y_currentlySelectedAccount := This.y_menuButton
		;at this resolution, each Y is exactly 55 apart
		This.x_1AccountMenuLocation := This.x_currentlySelectedAccount ;always the same as the first option
		This.y_1AccountMenuLocation := "230"
		This.x_2AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_2AccountMenuLocation := (This.y_1AccountMenuLocation + 55) ;spacing is always 55 from prev. acc.
		This.x_3AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_3AccountMenuLocation := (This.y_2AccountMenuLocation + 55)
		This.x_4AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_4AccountMenuLocation := (This.y_3AccountMenuLocation + 55)
		This.x_5AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_5AccountMenuLocation := (This.y_4AccountMenuLocation + 55)
		This.x_6AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_6AccountMenuLocation := (This.y_5AccountMenuLocation + 55)
		This.x_7AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_7AccountMenuLocation := (This.y_6AccountMenuLocation + 55)
		This.x_8AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_8AccountMenuLocation := (This.y_7AccountMenuLocation + 55)
		This.x_9AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_9AccountMenuLocation := (This.y_8AccountMenuLocation + 55)
		This.x_10AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_10AccountMenuLocation := (This.y_9AccountMenuLocation + 55)
		This.x_11AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_11AccountMenuLocation := (This.y_10AccountMenuLocation + 55)
		This.x_12AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_12AccountMenuLocation := (This.y_11AccountMenuLocation + 55)
		This.x_13AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_13AccountMenuLocation := (This.y_12AccountMenuLocation + 55)
		This.x_14AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_14AccountMenuLocation := (This.y_13AccountMenuLocation + 55)
		This.x_15AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_15AccountMenuLocation := (This.y_14AccountMenuLocation + 55)
		This.x_nonFollowersButton :=  This.x_currentlySelectedAccount
		This.y_nonFollowersButton :=  "175"
		This.x_fansButton := This.x_currentlySelectedAccount
		This.y_fansButton := "230"
		This.x_admirerButton := This.x_currentlySelectedAccount
		This.y_admirerButton := "420"
		This.x_unfollowButton := "1195"
		This.y_unfollowButton := "364"
		This.x_likeButtonLocation := "1160"
		This.y_likeButtonLocation := "330"
		This.x_followButtonLocation := "1195"
		This.y_followButtonLocation := This.y_unfollowButton
		
	}
	; Set the dimensions of the IGClass X/Ys, based on the predefined resolutions/locations for a computer running 1440x900
	Set1440x900() 
	{
		This.x_menuButton := "330"
		This.y_menuButton := "125"
		This.x_currentlySelectedAccount := "400"
		This.y_currentlySelectedAccount := This.y_menuButton
		;at this resolution, each Y is exactly 55 apart
		This.x_1AccountMenuLocation := This.x_currentlySelectedAccount ;always the same as the first option
		This.y_1AccountMenuLocation := "230"
		This.x_2AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_2AccountMenuLocation := (This.y_1AccountMenuLocation + 55) ;spacing is always 55 from prev. acc.
		This.x_3AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_3AccountMenuLocation := (This.y_2AccountMenuLocation + 55)
		This.x_4AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_4AccountMenuLocation := (This.y_3AccountMenuLocation + 55)
		This.x_5AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_5AccountMenuLocation := (This.y_4AccountMenuLocation + 55)
		This.x_6AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_6AccountMenuLocation := (This.y_5AccountMenuLocation + 55)
		This.x_7AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_7AccountMenuLocation := (This.y_6AccountMenuLocation + 55)
		This.x_8AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_8AccountMenuLocation := (This.y_7AccountMenuLocation + 55)
		This.x_9AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_9AccountMenuLocation := (This.y_8AccountMenuLocation + 55)
		This.x_10AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_10AccountMenuLocation := (This.y_9AccountMenuLocation + 55)
		This.x_11AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_11AccountMenuLocation := (This.y_10AccountMenuLocation + 55)
		This.x_12AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_12AccountMenuLocation := (This.y_11AccountMenuLocation + 55)
		This.x_13AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_13AccountMenuLocation := (This.y_12AccountMenuLocation + 55)
		This.x_14AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_14AccountMenuLocation := (This.y_13AccountMenuLocation + 55)
		This.x_15AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_15AccountMenuLocation := (This.y_14AccountMenuLocation + 55)
		This.x_nonFollowersButton :=  This.x_currentlySelectedAccount
		This.y_nonFollowersButton :=  "175"
		This.x_fansButton := This.x_currentlySelectedAccount
		This.y_fansButton := "230"
		This.x_admirerButton := This.x_currentlySelectedAccount
		This.y_admirerButton := "420"
		This.x_unfollowButton := "1115"
		This.y_unfollowButton := "364"
		This.x_likeButtonLocation := "1085"
		This.y_likeButtonLocation := "330"
		This.x_followButtonLocation := "1115"
		This.y_followButtonLocation := This.y_unfollowButton
	}
	
	; Set the dimensions of the IGClass X/Ys, based on the predefined resolutions/locations for a computer running 1920x1080
	Set1920x1080() 
	{
		This.x_menuButton := "535"
		This.y_menuButton := "125"
		This.x_currentlySelectedAccount := "720"
		This.y_currentlySelectedAccount := This.y_menuButton
		This.x_1AccountMenuLocation := This.x_currentlySelectedAccount ;always the same as the first option
		This.y_1AccountMenuLocation := "225"
		This.x_2AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_2AccountMenuLocation := (This.y_1AccountMenuLocation + 55) ;spacing is always 55 from prev. acc.
		This.x_3AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_3AccountMenuLocation := (This.y_2AccountMenuLocation + 55)
		This.x_4AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_4AccountMenuLocation := (This.y_3AccountMenuLocation + 55)
		This.x_5AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_5AccountMenuLocation := (This.y_4AccountMenuLocation + 55)
		This.x_6AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_6AccountMenuLocation := (This.y_5AccountMenuLocation + 55)
		This.x_7AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_7AccountMenuLocation := (This.y_6AccountMenuLocation + 55)
		This.x_8AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_8AccountMenuLocation := (This.y_7AccountMenuLocation + 55)
		This.x_9AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_9AccountMenuLocation := (This.y_8AccountMenuLocation + 55)
		This.x_10AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_10AccountMenuLocation := (This.y_9AccountMenuLocation + 55)
		This.x_11AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_11AccountMenuLocation := (This.y_10AccountMenuLocation + 55)
		This.x_12AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_12AccountMenuLocation := (This.y_11AccountMenuLocation + 55)
		This.x_13AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_13AccountMenuLocation := (This.y_12AccountMenuLocation + 55)
		This.x_14AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_14AccountMenuLocation := (This.y_13AccountMenuLocation + 55)
		This.x_15AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_15AccountMenuLocation := (This.y_14AccountMenuLocation + 55)
		This.x_nonFollowersButton :=  This.x_currentlySelectedAccount
		This.y_nonFollowersButton :=  "175"
		This.x_fansButton := This.x_currentlySelectedAccount
		This.y_fansButton := "230"
		This.x_admirerButton := This.x_currentlySelectedAccount
		This.y_admirerButton := "420"
		This.x_unfollowButton := "1336"
		This.y_unfollowButton := "364"
		This.x_likeButtonLocation := "1330"
		This.y_likeButtonLocation := "330"
		This.x_followButtonLocation := "1350"
		This.y_followButtonLocation := This.y_unfollowButton
	}
	; Set the dimensions of the CrowdFireWebApp X/Ys, based on the predefined resolutions/locations for a computer running 1366x768
	Set1366x768() 
	{
		This.x_menuButton := "260"
		This.y_menuButton := "120"
		This.x_currentlySelectedAccount := "375"
		This.y_currentlySelectedAccount := This.y_menuButton
		This.x_1AccountMenuLocation := This.x_currentlySelectedAccount ;always the same as the first option
		This.y_1AccountMenuLocation := "225"
		This.x_2AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_2AccountMenuLocation := (This.y_1AccountMenuLocation + 55) ;spacing is always 55 from prev. acc.
		This.x_3AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_3AccountMenuLocation := (This.y_2AccountMenuLocation + 55)
		This.x_4AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_4AccountMenuLocation := (This.y_3AccountMenuLocation + 55)
		This.x_5AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_5AccountMenuLocation := (This.y_4AccountMenuLocation + 55)
		This.x_6AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_6AccountMenuLocation := (This.y_5AccountMenuLocation + 55)
		This.x_7AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_7AccountMenuLocation := (This.y_6AccountMenuLocation + 55)
		This.x_8AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_8AccountMenuLocation := (This.y_7AccountMenuLocation + 55)
		This.x_9AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_9AccountMenuLocation := (This.y_8AccountMenuLocation + 55)
		This.x_10AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_10AccountMenuLocation := (This.y_9AccountMenuLocation + 55)
		This.x_11AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_11AccountMenuLocation := (This.y_10AccountMenuLocation + 55)
		This.x_12AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_12AccountMenuLocation := (This.y_11AccountMenuLocation + 55)
		This.x_13AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_13AccountMenuLocation := (This.y_12AccountMenuLocation + 55)
		This.x_14AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_14AccountMenuLocation := (This.y_13AccountMenuLocation + 55)
		This.x_15AccountMenuLocation := This.x_currentlySelectedAccount
		This.y_15AccountMenuLocation := (This.y_14AccountMenuLocation + 55)
		This.x_nonFollowersButton :=  This.x_currentlySelectedAccount
		This.y_nonFollowersButton :=  "175"
		This.x_fansButton := This.x_currentlySelectedAccount
		This.y_fansButton := "230"
		This.x_admirerButton := This.x_currentlySelectedAccount
		This.y_admirerButton := "420"
		This.x_unfollowButton := "1063"
		This.y_unfollowButton := "365"
		This.x_likeButtonLocation := "1048"
		This.y_likeButtonLocation := "330"
		This.x_followButtonLocation := "1060"
		This.y_followButtonLocation := This.y_unfollowButton
	}
	
	;calculate the loadTimes based on the passed in speed ratio via radio button
	assignLoadTimes(variablePassedIn)
	{
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
	;--------------
	;Launches Chrome browser to open and navigate to the crowdfireURL
	launchCrowdfireWebSite()
	{
		Try 
		{
			RUN, % This.launchPath
			Sleep, % This.time_initalLaunchLoadTime
		}
		catch e{
			This.createErrorLogEvent(e.What, e.line)
			Exit
		}
	}
	
	;Click the top-left button of the account you are currently logged in as
	clickCurrentlySelectedAccount()
	{
		;This.activateCrowdfireWindow()
		MouseClick, left, % This.x_currentlySelectedAccount,  % This.y_currentlySelectedAccount
		Sleep, % This.time_menuToggleTime
	}
	;Click the [FIRST] account in the list of channels logged into crowdfire
	clickFirstLoggedInAccount()
	{
		;This.activateCrowdfireWindow()
		MouseClick, left, % This.x_1AccountMenuLocation,  % This.y_1AccountMenuLocation
		;Wait for nonFollowers list as this is default loaded by crowdfire
		Sleep, % This.time_ListLoadTime
	}
	;Click the [SECOND] account in the list of channels logged into crowdfire
	clickSecondLoggedInAccount()
	{
		;This.activateCrowdfireWindow()
		MouseClick, left, % This.x_2AccountMenuLocation,  % This.y_2AccountMenuLocation
		;Wait for nonFollowers list as this is default loaded by crowdfire
		Sleep, % This.time_ListLoadTime
	}
	;Click the [THIRD] account in the list of channels logged into crowdfire
	clickThirdLoggedInAccount()
	{
		;This.activateCrowdfireWindow()
		MouseClick, left, % This.x_3AccountMenuLocation,  % This.y_3AccountMenuLocation
		;Wait for nonFollowers list as this is default loaded by crowdfire
		Sleep, % This.time_ListLoadTime
	}
	;Click the [FORTH] account in the list of channels logged into crowdfire
	clickForthLoggedInAccount()
	{
		;This.activateCrowdfireWindow()
		MouseClick, left, % This.x_4AccountMenuLocation,  % This.y_4AccountMenuLocation
		;Wait for nonFollowers list as this is default loaded by crowdfire
		Sleep, % This.time_ListLoadTime
	}
	;Click the [FIFTH] account in the list of channels logged into crowdfire
	clickFifthLoggedInAccount()
	{
		;This.activateCrowdfireWindow()
		MouseClick, left, % This.x_5AccountMenuLocation,  % This.y_5AccountMenuLocation
		;Wait for nonFollowers list as this is default loaded by crowdfire
		Sleep, % This.time_ListLoadTime
	}
	;Click the [SIXTH] account in the list of channels logged into crowdfire
	clickSixthLoggedInAccount()
	{
		This.activateCrowdfireWindow()
		MouseClick, left, % This.x_6AccountMenuLocation,  % This.y_6AccountMenuLocation
		Sleep, % This.time_ListLoadTime ;Wait for nonFollowers list as this is default loaded by crowdfire
	}
	;Click the [SEVENTH] account in the list of channels logged into crowdfire
	clickSeventhLoggedInAccount()
	{
		;This.activateCrowdfireWindow()
		MouseClick, left, % This.x_7AccountMenuLocation,  % This.y_7AccountMenuLocation
		;Wait for nonFollowers list as this is default loaded by crowdfire
		Sleep, % This.time_ListLoadTime
	}
	;Click the [EIGHTH] account in the list of channels logged into crowdfire
	clickEighthLoggedInAccount()
	{
		;This.activateCrowdfireWindow()
		MouseClick, left, % This.x_8AccountMenuLocation,  % This.y_8AccountMenuLocation
		;Wait for nonFollowers list as this is default loaded by crowdfire
		Sleep, % This.time_ListLoadTime
	}
	;Click the [NINTH] account in the list of channels logged into crowdfire
	clickNinthLoggedInAccount()
	{
		;This.activateCrowdfireWindow()
		MouseClick, left, % This.x_9AccountMenuLocation,  % This.y_9AccountMenuLocation
		;Wait for nonFollowers list as this is default loaded by crowdfire
		Sleep, % This.time_ListLoadTime
	}
	;Click the [TENTH] account in the list of channels logged into crowdfire
	clickTenthLoggedInAccount()
	{
		;This.activateCrowdfireWindow()
		MouseClick, left, % This.x_10AccountMenuLocation,  % This.y_10AccountMenuLocation
		;Wait for nonFollowers list as this is default loaded by crowdfire
		Sleep, % This.time_ListLoadTime
	}
	;Click the [ELEVENTH] account in the list of channels logged into crowdfire
	clickEleventhLoggedInAccount()
	{
		;This.activateCrowdfireWindow()
		MouseClick, left, % This.x_11AccountMenuLocation,  % This.y_11AccountMenuLocation
		;Wait for nonFollowers list as this is default loaded by crowdfire
		Sleep, % This.time_ListLoadTime
	}
	;Click the [TWELTH] account in the list of channels logged into crowdfire
	clickTwelthLoggedInAccount()
	{
		;This.activateCrowdfireWindow()
		MouseClick, left, % This.x_12AccountMenuLocation,  % This.y_12AccountMenuLocation
		;Wait for nonFollowers list as this is default loaded by crowdfire
		Sleep, % This.time_ListLoadTime
	}
	;Click the [THIRTEENTH] account in the list of channels logged into crowdfire
	clickThirteenthLoggedInAccount()
	{
		;This.activateCrowdfireWindow()
		MouseClick, left, % This.x_13AccountMenuLocation,  % This.y_13AccountMenuLocation
		;Wait for nonFollowers list as this is default loaded by crowdfire
		Sleep, % This.time_ListLoadTime
	}
	;Click the [ELEVENTH] account in the list of channels logged into crowdfire
	clickForteenthLoggedInAccount()
	{
		;This.activateCrowdfireWindow()
		MouseClick, left, % This.x_14AccountMenuLocation,  % This.y_14AccountMenuLocation
		;Wait for nonFollowers list as this is default loaded by crowdfire
		Sleep, % This.time_ListLoadTime
	}
	;Click the [FIFTINTH] account in the list of channels logged into crowdfire
	clickFiftinthLoggedInAccount()
	{
		;This.activateCrowdfireWindow()
		MouseClick, left, % This.x_15AccountMenuLocation,  % This.y_15AccountMenuLocation
		;Wait for nonFollowers list as this is default loaded by crowdfire
		Sleep, % This.time_ListLoadTime
	}
	
	;Click the non Followers item in the list
	clickNonFollowersButton()
	{
		;This.activateCrowdfireWindow()
		MouseClick, left, % This.x_nonFollowersButton,  % This.y_nonFollowersButton
		Sleep, % This.time_ListLoadTime ;Wait for nonFollowers list 
	}
		;Click the non Followers item in the list - different from the above such that there is no sleep time specified for the method to wait during load
	clickNonFollowersButtonNoWait()
	{
		;This.activateCrowdfireWindow()
		MouseClick, left, % This.x_nonFollowersButton,  % This.y_nonFollowersButton
		Sleep, 100 ;Wait arbitrary amoutn of time
	}
	;Click the non Followers item in the list
	clickFansButton()
	{
		;This.activateCrowdfireWindow()
		MouseClick, left, % This.x_fansButton,  % This.y_fansButton
		Sleep, % This.time_ListLoadTime ;Wait for list to load
	}
	;Click the admirer button item in the list
	clickAdmirersButton()
	{
		;This.activateCrowdfireWindow()
		MouseClick, left, % This.x_admirerButton,  % This.y_admirerButton
		Sleep, % This.time_admirerListLoadTime ;Wait for list to load 
	}
	;Click the unfollow button, once.
	clickUnfollowButton()
	{
		;This.activateCrowdfireWindow()
		MouseMove, % This.x_unfollowButton,  % This.y_unfollowButton
		PixelGetColor, expectedClickLocation, % This.x_unfollowButton, % This.y_unfollowButton, RGB
		IfEqual, expectedClickLocation,  % This.colour_unfollowButton ;If button is valid colour, click it
		{
			MouseClick, left, % This.x_unfollowButton,  % This.y_unfollowButton
			Sleep, % This.time_actionButtonPressInterval ;Interval to pause between clicks 
			return 1
		}
		else 
		{
			return 0 ;exit method and continue with next action
		}
	}
	;Loop of the above method, limited by the hourly max follow/unfollow cap
	unfollowButtonLoop()
	{
		Loop % This.rate_hourlyActivityMax { 
			This.clickUnfollowButton()
		}
	}
	;Clicking the location of the like button on the admirers page
	clickLikeButton()
	{
		;This.activateCrowdfireWindow()
		MouseClick, left, % This.x_likeButtonLocation,  % This.y_likeButtonLocation
		Sleep, % This.time_likeButtonPressInterval ;Interval to pause between clicks 
	}
	;Loop of the above method, limited by the hourly max like cap
	likeButtonLoop()
	{
		Loop % This.rate_likesInARowMax { 
			This.clickLikeButton()
		}
	}
	
	;Clicking the follow button for a fan entry
	clickFollowButton()
	{
		;This.activateCrowdfireWindow()
		MouseMove, % This.x_followButtonLocation,  % This.y_followButtonLocation
		PixelGetColor, expectedClickLocation, % This.x_followButtonLocation, % This.y_followButtonLocation, RGB
		IfEqual, expectedClickLocation,  % This.colour_fanFollowButton ;If button is valid colour, click it
		{
			MouseClick, left, % This.x_followButtonLocation,  % This.y_followButtonLocation
			Sleep, % This.time_actionButtonPressInterval ;Interval to pause between clicks 
			return 1
		}
		else 
		{
			return 0 ;exit method and continue with next action
		}
	}
	;Loop of the above moethod, limited by the hourly max follow/unfollow cap
	followButtonLoop()
	{
		Loop % This.rate_hourlyActivityMax { 
			This.clickFollowButton()
		}
	}
	
	;Reloads the admirer list, so that a new max in a row pics like can render
	refreshAdmirerList()
	{
		;Click a different list button, in this case, the nonFollowers button
		MouseClick, left, % This.x_nonFollowersButton,  % This.y_nonFollowersButton
		Sleep, 500  ;Sleep an arbitrary period of time to click back to it
		This.clickAdmirersButton() ;Click back
	}
	clickMenuItem()
	{
		;This.activateCrowdfireWindow()
		MouseClick, left, % This.x_menuButton,  % This.y_menuButton
		Sleep, % This.time_menuToggleTime
	}
}