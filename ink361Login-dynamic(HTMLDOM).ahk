/*
	Description: To scrape ink361 of IG 'Account Overview' Stats
	Created by: Jordan Snider
	
	Deployement: Dynamically clicks based on HTML elements in IE app. Merely supply the login credentials to make it account specific
*/
; Account Specific Login details
accountUsername :=  "jordansnider@hotmail.com"
accountPass := "Aaa123dddd"

 ; //Login to ink361
web_browser := ComObjCreate("InternetExplorer.Application")  ;// Create an IE object
web_browser.Visible := true                                  ;// Make the IE object visible
web_browser.Navigate("http://ink361.com/app/login")           ;// Navigate to a webpage
while web_browser.busy									;// wait until the page has finished loading
   Sleep 100
   
;MsgBox, 262208, Done, Loading completed,5

 ;// Get the login fields for input
 ;// Username 
emailInput := web_browser.document.getElementsByName("username")[0] ;// returns collection
emailInput.value := accountUsername
 ;// Password
passworInput := web_browser.document.getElementsByName("password")[0] ;// returns collection
passworInput.value := accountPass
 ;// submit button
;//STUCK HERE
 ;~ loginButton := web_browser.document.getElementsByTagName("signup-button").click() ;// get collection of buttons
loginButton :=  web_browser.document.getElementsByClassName("signup-button")[0].click()
 ;~ loginButton := web_browser.document.getElementsByName("signup").click()
;~ loginButton.click()
;//STUCK HERE

ExitApp