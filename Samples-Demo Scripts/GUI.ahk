 ; A very quick example of how we can take input from a user, and use it to run our scripts
 #SingleInstance force ; only one instance of script can run
/*
;Creates the GUI and sets some inputs
Gui, New
Gui, Add, Text,, Username
Gui, Add, Edit, vUsername
Gui, Add, Text,, Password
Gui, Add, Edit, Password vPassword
Gui, Add, Button, Default gOK, OK
Gui, Show
return
OK:
Gui, Submit
MsgBox %Username% and %Password%
*/

; Another slightly different sample
Gui, New
Gui, Add, Text,, # Accounts logged into IG:
Gui, Add, Edit, vNumAccounts
Gui, Add, Button, Default gOK, OK
Gui, Show
return
OK:
Gui, Submit
if (numAccounts = 1) { 
  MsgBox, was 1
}
