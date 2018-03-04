 ; DESCRIPTION:      Script to select the top 5 users on a profile's following list, and like their first 3 pictures
 ; START:            Full screen 'Bluestacks', with the 'Instagram' app open. This script will run when BlueStacks is in view 
 ; Created By:       Jordan Snider
 ; Hot Keys: [`]-Exit | [TAB]-Pause
 ;
 ; ----------------------------------------------------
 ; ----------------------------------------------------

#SingleInstance force ; only one instance of script can run
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ProgramFiles% ; Ensures a consistent starting directory.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

;#include C:\Users\jsnider\Google Drive\Token Creative Services\Web\Apps\AutoHotKey\scripts\Classes\instagramBSClass.ahk ;Import class file ; FOR DEV****************
#include C:\Program Files\Token\Automation\classes\instagramBSClass.ahk                                                                     ; FOR LIVE***************	
;-----------------------------------
;instantiate new object of class type
igApp := New InstagramBS
;call method to set all attribute's of class
igApp.assignScreenResolution()   
igApp.assignLoadTimes(1)
; RUNNING FOR: X ACCOUNTS 							;************************************
numAccounts := "5"

  ; FIRST ACCOUNT - Always run against first account
  ; Having already been logged in, we click the profile button to ensure we start on the right page
  igApp.clickProfileButton()
  ; Click on the logged in account's followingList
  igApp.clickFollowingList()
  ;On the following page, click the [FIRST] person and like all their pics
  igApp.clickFirstProfileFollower()
  igApp.like3PicsOnUserAccount()
  ;On the following page, click the [SECOND] person and like all their pics
  igApp.clickSecondProfileFollower()
  igApp.like3PicsOnUserAccount()
  ;On the following page, click the [THIRD] person and like all their pics
  igApp.clickThirdProfileFollower()
  igApp.like3PicsOnUserAccount()
  ;On the following page, click the [FORTH] person and like all their pics
  igApp.clickForthProfileFollower()
  igApp.like3PicsOnUserAccount()
  ;On the following page, click the [FIFTH] person and like all their pics
  igApp.clickFifthProfileFollower()
  igApp.like3PicsOnUserAccount()
  ; go back to main profile page (of account logged in as)
  igApp.goBackToProfileClick()
  
  ; SECOND ACCOUNT
  if (numAccounts >= 2) {
    ; IF the IG instances has two or more accouts logged in, switch to the second logged in account in the list
    igApp.clickSecondLoggedInAccount() 
    ; Having already been logged in, we click the profile button to ensure we start on the right page
    igApp.clickProfileButton()
    ; Click on the logged in account's followingList
    igApp.clickFollowingList()
    ;On the following page, click the [FIRST] person and like all their pics
    igApp.clickFirstProfileFollower()
    igApp.like3PicsOnUserAccount()
    ;On the following page, click the [SECOND] person and like all their pics
    igApp.clickSecondProfileFollower()
    igApp.like3PicsOnUserAccount()
    ;On the following page, click the [THIRD] person and like all their pics
    igApp.clickThirdProfileFollower()
    igApp.like3PicsOnUserAccount()
    ;On the following page, click the [FORTH] person and like all their pics
    igApp.clickForthProfileFollower()
    igApp.like3PicsOnUserAccount()
    ;On the following page, click the [FIFTH] person and like all their pics
    igApp.clickFifthProfileFollower()
    igApp.like3PicsOnUserAccount()
    ; go back to main profile page (of account logged in as)
    igApp.goBackToProfileClick()
  }
  
  ; THIRD ACCOUNT
  if (numAccounts >= 3) {
    ; IF the IG instances has three or more accouts logged in, switch to the third logged in account in the list
    igApp.clickThirdLoggedInAccount() 
    ; Having already been logged in, we click the profile button to ensure we start on the right page
    igApp.clickProfileButton()
    ; Click on the logged in account's followingList
    igApp.clickFollowingList()
    ;On the following page, click the [FIRST] person and like all their pics
    igApp.clickFirstProfileFollower()
    igApp.like3PicsOnUserAccount()
    ;On the following page, click the [SECOND] person and like all their pics
    igApp.clickSecondProfileFollower()
    igApp.like3PicsOnUserAccount()
    ;On the following page, click the [THIRD] person and like all their pics
    igApp.clickThirdProfileFollower()
    igApp.like3PicsOnUserAccount()
    ;On the following page, click the [FORTH] person and like all their pics
    igApp.clickForthProfileFollower()
    igApp.like3PicsOnUserAccount()
    ;On the following page, click the [FIFTH] person and like all their pics
    igApp.clickFifthProfileFollower()
    igApp.like3PicsOnUserAccount()
    ; go back to main profile page (of account logged in as)
    igApp.goBackToProfileClick()
  }

  ; FORTH ACCOUNT
  if (numAccounts >= 4) {
    ; IF the IG instances has four or more accouts logged in, switch to the forth logged in account in the list
    ; Switch to the second logged in account in the list
    igApp.clickForthLoggedInAccount() 
    ; Having already been logged in, we click the profile button to ensure we start on the right page
    igApp.clickProfileButton()
    ; Click on the logged in account's followingList
    igApp.clickFollowingList()
    ;On the following page, click the [FIRST] person and like all their pics
    igApp.clickFirstProfileFollower()
    igApp.like3PicsOnUserAccount()
    ;On the following page, click the [SECOND] person and like all their pics
    igApp.clickSecondProfileFollower()
    igApp.like3PicsOnUserAccount()
    ;On the following page, click the [THIRD] person and like all their pics
    igApp.clickThirdProfileFollower()
    igApp.like3PicsOnUserAccount()
    ;On the following page, click the [FORTH] person and like all their pics
    igApp.clickForthProfileFollower()
    igApp.like3PicsOnUserAccount()
    ;On the following page, click the [FIFTH] person and like all their pics
    igApp.clickFifthProfileFollower()
    igApp.like3PicsOnUserAccount()
    ; go back to main profile page (of account logged in as)
    igApp.goBackToProfileClick()
  }
  
  ; FIFTH ACCOUNT
  if (numAccounts >= 5) {
    ; IF the IG instances has five accounts logged in, switch to the fifth logged in account in the list
    igApp.clickFifthLoggedInAccount() 
    ; Having already been logged in, we click the profile button to ensure we start on the right page
    igApp.clickProfileButton()
    ; Click on the logged in account's followingList
    igApp.clickFollowingList()
    ;On the following page, click the [FIRST] person and like all their pics
    igApp.clickFirstProfileFollower()
    igApp.like3PicsOnUserAccount()
    ;On the following page, click the [SECOND] person and like all their pics
    igApp.clickSecondProfileFollower()
    igApp.like3PicsOnUserAccount()
    ;On the following page, click the [THIRD] person and like all their pics
    igApp.clickThirdProfileFollower()
    igApp.like3PicsOnUserAccount()
    ;On the following page, click the [FORTH] person and like all their pics
    igApp.clickForthProfileFollower()
    igApp.like3PicsOnUserAccount()
    ;On the following page, click the [FIFTH] person and like all their pics
    igApp.clickFifthProfileFollower()
    igApp.like3PicsOnUserAccount()
    ; go back to main profile page (of account logged in as)
    igApp.goBackToProfileClick()
  }
;Hot key to pause the script
Tab::Pause
    
;hot key to kill the app
`::ExitApp

