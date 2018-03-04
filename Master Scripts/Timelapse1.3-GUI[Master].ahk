Gui, Add, Text, x2 y269 w150 h20 , Speed (1 = fastest):
Gui, Add, Radio, x152 y269 w70 h20 gsetSpeed1 vRadio1 Checked, 1
Gui, Add, Radio, x222 y269 w70 h20 gsetSpeed2 vRadio2, 2
Gui, Add, Radio, x292 y269 w70 h20 gsetSpeed3 vRadio3, 3
Gui, Add, Radio, x362 y269 w60 h20 gsetSpeed4 vRadio4, 4
Gui, Add, Tab, x2 y49 w540 h260, Instagram|CrowdFire|Utils.|Help
Gui, Tab, Instagram
Gui, Font, S16 CDefault Bold, Verdana
Gui, Font, S20 CDefault Bold, Verdana
Gui, Font, S26 CDefault Bold, Verdana
Gui, Add, Text, x2 y-1 w540 h50 +, Timelapse - Instagram
Gui, Font, S16 CDefault, Verdana
Gui, Font, S13 CDefault, Verdana
Gui, Font, S10 CDefault, Verdana
Gui, Add, Button, x22 y119 w110 h40 , Follow
Gui, Add, Button, x152 y119 w110 h40 , Like
Gui, Add, Button, x282 y119 w110 h40 , ...
Gui, Add, Button, x412 y119 w110 h40 , ...
Gui, Add, Button, x22 y189 w110 h40 , Follow-PS
Gui, Add, Button, x152 y189 w110 h40 , Like-PS
Gui, Add, Button, x282 y189 w110 h40 , ...
Gui, Add, Button, x412 y189 w110 h40 , ...
Gui, Tab, CrowdFire
Gui, Add, Button, x52 y139 w100 h40 , Unfollow
Gui, Add, Button, x212 y139 w100 h40 , Like
Gui, Add, Button, x372 y139 w100 h40 , ...
Gui, Add, Button, x52 y219 w100 h40 , ...
Gui, Add, Button, x212 y219 w100 h40 , ...
Gui, Add, Button, x372 y219 w100 h40 , ...
Gui, Tab, CrowdFire
Gui, Font, S26 CDefault Bold, Verdana
Gui, Add, Text, x2 y-1 w540 h50 , Timelapse - CrowdFire
Gui, Tab, Utils.
Gui, Add, Text, x2 y-1 w540 h50 , Timelapse - Utilities
Gui, Tab, Utils.
Gui, Font, S10 CDefault, Verdana
Gui, Add, Button, x32 y149 w120 h60 , X/Y Finder
Gui, Add, Button, x212 y149 w120 h60 , Get Colour
Gui, Add, Button, x392 y149 w120 h60 , ...
Gui, Tab, Help
Gui, Font, S26 CDefault Bold, Verdana
Gui, Add, Text, x2 y-1 w540 h50 , Timelapse - Help
Gui, Tab, Instagram
Gui, Font, S5 CDefault Bold, Verdana
Gui, Tab, Help
Gui, Font, S10 CDefault Bold, Verdana
Gui, Add, Button, x22 y139 w110 h80 , Instagram Help
Gui, Add, Button, x142 y139 w110 h80 , CrowdFire Help
Gui, Add, Button, x262 y139 w110 h80 , Utility Help
Gui, Add, Button, x382 y139 w110 h80 , ...
; Generated using SmartGUI Creator 4.0
Gui, Show, x127 y87 h394 w689, New GUI Window
Return

Check:
	;do nothing

GuiClose:
ExitApp