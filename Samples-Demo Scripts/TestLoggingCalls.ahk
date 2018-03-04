#SingleInstance force ; only one instance of script can run
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Persistent ; to make it run indefinitely
; #Warn ; Recommended for catching common errors.
#include C:\Users\jsnider\Google Drive\Token Creative Services\Web\Apps\AutoHotKey\scripts\Classes\instagramBSClass.ahk ;Import class file
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.

     
;instantiate new object of class type
igApp := New InstagramBS
;call method to set all attribute's of class, based on Jordy's  LT
igApp.SetToJSniderLaptop() 

igApp.activateBlueStacksWindow()

igApp.checkFirstPicLikeFollowButton()
igApp.loopCheckIterativeFollowButtonInPicLikerList()

