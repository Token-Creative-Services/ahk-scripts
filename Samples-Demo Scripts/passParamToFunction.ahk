#include C:\Users\jsnider\Google Drive\Token Creative Services\Web\Apps\AutoHotKey\scripts\Classes\instagramBSClass.ahk ;Import class file ; FOR DEV****************																; FOR LIVE***************

;instantiate new object of class type
;~ igApp := New InstagramBS
;call method to set all attribute's of class																													
;igApp.variablePassTest(3)
myVar = %1%
MsgBox, %myVar%

if (%myVar% = "1")
{
	MsgBox, Passed speed is 1
	;~ igApp.variablePassTest(1)
}
else if (myVar = "2")
{
	MsgBox, Passed speed is 2
	;~ igApp.variablePassTest(2)
}
else if (myVar = "3")
{
	MsgBox, Passed speed is 3
	;~ igApp.variablePassTest(3)
}
else if (%myVar% = "4")
{
	MsgBox, Passed speed is 4
	;~ igApp.variablePassTest(4)
}
else if %myVar% = 
{
	MsgBox, Pass speed was blank
}