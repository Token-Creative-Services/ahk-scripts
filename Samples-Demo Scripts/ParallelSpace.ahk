#include C:\Users\jsnider\Google Drive\Token Creative Services\Web\Apps\AutoHotKey\scripts\Classes\instagramBSClass.ahk ;Import class file ; FOR DEV****************
;#include C:\Program Files\Token\Automation\classes\instagramBSClass.ahk  																	; FOR LIVE***************

;instantiate new object of class type
igApp := New InstagramBS
;call method to set all attribute's of class, based on Jordy's  LT
igApp.SetToJSniderLaptop()	


igApp.clickSecondLoggedInAccountParallelSpace() 

	;hot key to kill app (looping present)
	p::ExitApp