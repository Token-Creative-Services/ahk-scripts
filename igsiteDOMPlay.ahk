
; Account Specific Login details
accountUsername :=  "jsnids"
accountPass := "Aaa123dddd"

 ; //Login to ink361
web_browser := ComObjCreate("InternetExplorer.Application")  ;// Create an IE object
web_browser.Visible := true                                  ;// Make the IE object visible
web_browser.Navigate("http://instagram.com")           ;// Navigate to a webpage
;~ while web_browser.busy									;// wait until the page has finished loading
   ;~ Sleep 200
Sleep, 4000

logInLink := web_browser.document.getElementsByClassName("_fcn8k")[0].click()

 ;// Get the login fields for input
usernameInput := web_browser.document.getElementsByName("username")[0] ;// returns collection
usernameInput.value := accountUsername
Sleep, 1000
passInput := web_browser.document.getElementsByName("password")[0] ;// returns collection
passInput.value := accountPass
Sleep, 1000
;~ Send, {Tab}
;~ Send, "Aaa123dddd"
logInButton := web_browser.document.getElementsByClassName("_aj7mu _taytv _ki5uo _o0442")[0].click()


ExitApp

`:: ExitApp
Tab::Pause