#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn ; Recommended for catching common errors.

SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

#SingleInstance force ; only one instance of script can run
#Persistent ; to make it run indefinitely

CoordMode, ToolTip, Screen ; makes tooltip to appear at position, relative to screen.
tooltipText := "generic text to be displayed here"
tooltip %tooltipText%, 0, 0 ; display tooltip of %xx% %yy% at coordinates x0 y0.
;~ ToolTip ;turns the tooltip back off (toggle)

`::ExitApp