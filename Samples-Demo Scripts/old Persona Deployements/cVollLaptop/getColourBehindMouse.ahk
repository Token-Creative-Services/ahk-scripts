;Description: Gets the current X/Y of the mouse, sets it to vars
#SingleInstance force ; only one instance of script can run
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Persistent ; to make it run indefinitely

^!z::  ; Control+Alt+Z hotkey.
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%, RGB
MsgBox The color at the current cursor position is %color%.
return