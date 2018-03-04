;~ ;This script will autoClick the current location of your mouse, toggled off and on with the F6 key. Rate set via SetTimer
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
;~ #Warn ; Recommended for catching common errors.

SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

#SingleInstance force ; only one instance of script can run
#Persistent ; to make it run indefinitely
;------------------
SetTimer Click, 75

F6::Toggle := !Toggle

Click:
    If (!Toggle)
        Return
    Click
    Send a
return