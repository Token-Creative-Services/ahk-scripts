#include C:\Users\jsnider\Google Drive\Token Creative Services\Web\Apps\AutoHotKey\scripts\Classes\instagramBSClass.ahk

 ;instantiate new object of class type
igJordan := New InstagramBS

 ;call method to set all attribute's of class, based on Jordy's  LT
igJordan.SetToJSniderLaptop()

 ; output class 
testVar := igJordan.x_followersList
MsgBox, %testVar%
 ; MsgBox, % igJordan.x_followersList

ExitApp