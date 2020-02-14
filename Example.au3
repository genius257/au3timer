#include "Timer.au3"

Opt("GuiOnEventMode", 1)
Opt("TrayOnEventMode", 1)
Opt("WinWaitDelay", 0)

$hWnd = GUICreate("", 700, 320)

GUISetOnEvent(-3, "_MyExit", $HWnd)

$btn = GUICtrlCreateButton("SetTimeout MsgBox", 10, 10, 120, 25)
GUICtrlSetOnEvent($btn, "A")
$btn = GUICtrlCreateButton("Blocking scenario", 570, 10, 120, 25)
GUICtrlSetOnEvent($btn, "B")

GUISetState(@SW_SHOW, $hWnd)

setInterval("ConsoleWrite", 1000, "setInterval example"&@CRLF)
setTimeout("ConsoleWrite", 1000, "setTimeout example"&@CRLF)

While 1
	Sleep(10)
WEnd

Func _MyExit()
	Exit
EndFunc

Func A()
	ConsoleWrite("Planning MsgBox"&@CRLF)
	setTimeout("MsgBox", 0, 0, "title", "message")
EndFunc

Func B()
	setTimeout("_B", 1000, 1)
	setTimeout("_B", 1000, 2)
	setTimeout("_B", 1000, 3)
	setTimeout("_B", 1000, 4)
	setTimeout("_B", 1000, 5)
	setTimeout("_B", 1000, 6)
	setTimeout("_B", 1000, 7)
	setTimeout("_B", 1000, 8)
	setTimeout("_B", 1000, 9)
	setTimeout("_B", 1000, 10)
EndFunc


Func _B($iID)
	For $i = 0 To 1 ;the bigger the number, the more time between GUI responsiveness
		ConsoleWrite(StringFormat("ID: %02i\n\t%02i of 01\n", $iID, $i))
		Sleep(1000)
	Next
EndFunc
