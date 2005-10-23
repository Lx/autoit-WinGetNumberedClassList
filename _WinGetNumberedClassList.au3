; ==============================================================================
;
; Function Name:    _WinGetNumberedClassList()
; Description:      Retrieves the classes from a window in a format that can be
;                   used where control IDs are expected.
; Parameter(s):     $sTitle    -- The title of the window to read.
;                   $sText     -- [Optional] The text of the window to read.
;                   $fAsArray  -- [Optional] Boolean to determine whether to
;                                 return the result as an array (defaults to
;                                 WinGetClassList() behaviour, i.e. False).
; Requirement(s):   None
; Return Value(s):  On success -- $fAsArray = True: Returns a list of enumerated
;                                    ClassNameNNs where the first element is a
;                                    count of entries.
;                                 $fAsArray = False: Returns an @LF-delimited
;                                    list (exactly like WinGetClassList()).
;                   On failure -- Returns an empty string or array (depending on
;                                 the requested type) and sets @Error to 1 if no
;                                 window matches the specified criteria.
; Author(s):        Alex Peters (LxP)
;
; ==============================================================================
;
Func _WinGetNumberedClassList($sTitle, $sText = '', $fAsArray = False)

	Local $avClasses[1], $iCounter, $sClasses, $sClassStub, $sClassStubList

	; The first element of the $avClasses array will hold a count
	$avClasses[0] = 0

	; Request an unnumbered class list
	$sClassStubList = WinGetClassList($sTitle, $sText)

	; Return an empty response if no controls exist
	; Additionally set @Error if the specified window was not found
	If $sClassStubList = '' Then
		If @Error Then SetError(1)
		If $fAsArray Then
			Return $avClasses
		Else
			Return ''
		EndIf
	EndIf

	; Prepare an array to hold the numbered classes
	ReDim $avClasses[StringLen($sClassStubList) - StringLen(StringReplace($sClassStubList, @LF, '')) + 1]

	; Count each unique class, enumerate them in the array and remove them from the string
	Do
		$sClassStub = StringLeft($sClassStubList, StringInStr($sClassStubList, @LF))
		$iCounter = 0
		While StringInStr($sClassStubList, $sClassStub)
			$avClasses[0] += 1
			$iCounter += 1
			$avClasses[$avClasses[0]] = StringTrimRight($sClassStub, 1) & $iCounter
			$sClassStubList = StringReplace($sClassStubList, $sClassStub, '', 1)
		WEnd
	Until $sClassStubList = ''

	; Return the data in the desired format
	If $fAsArray Then
		Return $avClasses
	Else
		; Assemble an @LF-delimited list of classes (exactly like WinGetClassList())
		$sClasses = ''
		For $iCounter = 1 To $avClasses[0]
			$sClasses &= $avClasses[$iCounter] & @LF
		Next
		Return $sClasses
	EndIf

EndFunc