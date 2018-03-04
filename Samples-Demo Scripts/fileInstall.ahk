/*
	Description: FileInstall uses a certain file locally, and add its to a virtual directory for the exe. We then need to include that exe in the original call to use it
	
	Resources: https://autohotkey.com/docs/commands/FileInstall.htm | 
*/
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance force ; only one instance of script can run
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.

FileInstall, C:\Users\jsnider\Google Drive\Token Creative Services\Web\Apps\AutoHotKey\scripts\Classes\instagramBSClass.ahk, %A_ScriptDir%\readMe.exe, 1
#include %A_ScriptDir%\readMe.exe



;instantiate new object of class type
igApp := New InstagramBS
;call method to set all attribute's of class, based on Jordy's  LT
igApp.SetToJSniderLaptop()
igApp.activateBluestacksWindow()

;hot key to kill app (looping present)
	p::ExitApp