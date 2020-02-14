#include-once
#include <Timers.au3>

Global $__g_hTimerWnd = GUICreate("")
Global $__g_iTimerReferenceTableSize = 100
Global $__g_aTimerReferenceTable[$__g_iTimerReferenceTableSize][3]

OnAutoItExitRegister("__TimerCleanUp")

Func __TimerCleanUp()
	_Timer_KillAllTimers($__g_hTimerWnd)
EndFunc

Func setTimeout($function = "", $delay = 0, $arg1 = Null, $arg2 = Null, $arg3 = Null, $arg4 = Null, $arg5 = Null, $arg6 = Null, $arg7 = Null, $arg8 = Null, $arg9 = Null)
	Local $iIDTimer = _Timer_SetTimer($__g_hTimerWnd, $delay, "__setTimeoutProc")

	Local $args = Null
	If @NumParams > 2 Then
		Local $args[@NumParams - 1]
		Local $i
		$args[0] = "CallArgArray"
		For $i = 1 To @NumParams - 2
			$args[$i] = Eval("arg"&$i)
		Next
	EndIf

	Local $i
	For $i = 0 To $__g_iTimerReferenceTableSize - 1
		If $__g_aTimerReferenceTable[$i][0] = "" Then
			$__g_aTimerReferenceTable[$i][0] = $iIDTimer
			$__g_aTimerReferenceTable[$i][1] = $function
			$__g_aTimerReferenceTable[$i][2] = $args
			Return $iIDTimer
		EndIf
	Next

	Return SetError(1, 0, 0)
EndFunc

Func __setTimeoutProc($hWnd, $iMsg, $iIDTimer, $iTime)
	Local $i
	For $i = 0 To $__g_iTimerReferenceTableSize - 1
		If $__g_aTimerReferenceTable[$i][0] = $iIDTimer Then
			_Timer_KillTimer($hWnd, $iIDTimer)
			$__g_aTimerReferenceTable[$i][0] = ""
			If $__g_aTimerReferenceTable[$i][2] = Null Then
				Call($__g_aTimerReferenceTable[$i][1])
			Else
				Call($__g_aTimerReferenceTable[$i][1], $__g_aTimerReferenceTable[$i][2])
			EndIf
			Return
		EndIf
	Next
EndFunc

Func setInterval($function = "", $delay = 0, $arg1 = Null, $arg2 = Null, $arg3 = Null, $arg4 = Null, $arg5 = Null, $arg6 = Null, $arg7 = Null, $arg8 = Null, $arg9 = Null)
	Local $iIDTimer = _Timer_SetTimer($__g_hTimerWnd, $delay, "__setIntervalProc")

	Local $args = Null
	If @NumParams > 2 Then
		Local $args[@NumParams - 1]
		Local $i
		$args[0] = "CallArgArray"
		For $i = 1 To @NumParams - 2
			$args[$i] = Eval("arg"&$i)
		Next
	EndIf

	Local $i
	For $i = 0 To $__g_iTimerReferenceTableSize - 1
		If $__g_aTimerReferenceTable[$i][0] = "" Then
			$__g_aTimerReferenceTable[$i][0] = $iIDTimer
			$__g_aTimerReferenceTable[$i][1] = $function
			$__g_aTimerReferenceTable[$i][2] = $args
			Return $iIDTimer
		EndIf
	Next

	Return SetError(1, 0, 0)
EndFunc

Func __setIntervalProc($hWnd, $iMsg, $iIDTimer, $iTime)
	Local $i
	For $i = 0 To $__g_iTimerReferenceTableSize - 1
		If $__g_aTimerReferenceTable[$i][0] = $iIDTimer Then
			If $__g_aTimerReferenceTable[$i][2] = Null Then
				If Call($__g_aTimerReferenceTable[$i][1]) = False Then
					_Timer_KillTimer($hWnd, $iIDTimer)
					$__g_aTimerReferenceTable[$i][0] = ""
				EndIf
			Else
				If Call($__g_aTimerReferenceTable[$i][1], $__g_aTimerReferenceTable[$i][2]) = False Then
					_Timer_KillTimer($hWnd, $iIDTimer)
					$__g_aTimerReferenceTable[$i][0] = ""
				EndIf
			EndIf
			Return
		EndIf
	Next
EndFunc
