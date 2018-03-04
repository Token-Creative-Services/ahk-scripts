;~ speedRating := %1%
;~ MsgBox, Number of variables passed: %0%
;~ MsgBox, Speed rating passed: %1%
;speedRating :=

#include C:\Users\jsnider\Google Drive\Token Creative Services\Web\Apps\AutoHotKey\scripts\Classes\instagramBSClass.ahk ;Import class file

;instantiate new object of class type
igApp := New InstagramBS
;call method to set all attribute's of class																													
igApp.assignScreenResolution()
igApp.assignLoadTimes(%1%)