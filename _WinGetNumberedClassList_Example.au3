; Open the Run window
Send('#r')
WinWait('Run')

; Get an array of controls
Local $Array = _WinGetNumberedClassList('Run', '', True)

; Get the text of each control on the window and display it
Local $AllText = ''
Local $I
For $I = 1 to $Array[0]
	Local $Text = ControlGetText('Run', '', $Array[$I])
	If $Text <> '' Then $AllText &= @LF & '*   ' & $Text
Next
MsgBox(0, '_WinGetNumberedClassList() Example', 'The Run window contains this text:' & @LF & $AllText)

WinClose('Run')