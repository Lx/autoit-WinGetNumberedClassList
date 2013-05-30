# _WinGetNumberedClassList UDF for AutoIt v3

An AutoIt v3 UDF to retrieve classes from a window in `ClassNameNN`
format, which can be used wherever a control ID is expected.  This
allows enumeration over every control within a window.

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

This code has been tested with AutoIt v3.1.1.82.  The example script in
`_WinGetNumberedClassList_Example.au3` demonstrates how to read all text
from a window.

## Version history

### v1.0 (22/Oct/2005)

*   Initial release
