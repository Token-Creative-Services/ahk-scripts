; The basic concept of try/catch/throw. Logs custom error and then adds it to a CSV log file
; Throw --> https://autohotkey.com/docs/commands/Throw.htm
; Try/Catch --> https://autohotkey.com/docs/commands/Try.htm

/*
   ; For more detail about the object that e contains, see Exception().
    MsgBox, 16,, % "Exception thrown!`n`nwhat: " e.what "`nfile: " e.file
        . "`nline: " e.line "`nmessage: " e.message "`nextra: " e.extra
*/

try  ; Attempts to execute code.
{
    HelloWorld()
    MakeToast()
}
catch e  ; Handles the first error/exception raised by the block above.
{
        ;MsgBox, % e.What
		;MsgBox, %CurrentDateTime%
		FormatTime, CurrentDateTime,, yyyy/MM/dd HH:mm:ss
		
		;FileAppend, (e.What), %filename%	
		; //THis will open a file(based on a name provided, opens it, writes(with commas for CSV
		; Writes: Date/time,  e.What (what happened), e.file (where it happened), e.Line (where in the file it threw)
		filename = %A_ScriptDir%\Logs\test.csv
		file := FileOpen(filename, "a") ; append mode
		file.Write(CurrentDateTime), file.Write(",") ;date
		file.Write(e.What), file.Write(",") ;message
		file.Write(e.file), file.Write(",") ;failing file
		file.Write(e.line), file.Write(",") ; failed line
		file.Write("`r" ) ; newline
		file.fileClose()
    Exit
}

HelloWorld()  ; Always succeeds. 	
{
    MsgBox, Hello, world!
}

MakeToast()  ; Always fails.
{
    ; Jump immediately to the try block's error handler:
    throw { what: "Custom error", file: A_LineFile, line: A_LineNumber }
}

