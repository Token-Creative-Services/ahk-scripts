/*
	Description: This GUI will run a script file from a different location via a button click

*/

SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance force ; only one instance of script can run
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.

Gui, Add, Button, x42 y59 w120 h50 gTest, Call Activate Scipt
;Gui, Add, Button, Default gOK, OK
Gui, Add, Text, x32 y19 w220 h20 , GUI Form Calling Other Script Files
; Generated using SmartGUI Creator 4.0
Gui, Show, x127 y87 h379 w479, New GUI Window
Return

Test:
	RUN C:\Users\jsnider\Google Drive\Token Creative Services\Web\Apps\AutoHotKey\scripts\Deployed Scripts\AutoFollow-jordyLT.exe

ExitApp



;hot key to kill app (looping present)
	p::ExitApp