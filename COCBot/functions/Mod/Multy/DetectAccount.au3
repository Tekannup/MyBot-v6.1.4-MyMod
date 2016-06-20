; #FUNCTION# ====================================================================================================================
; Name ..........: Detect Account
; Description ...:
; Syntax ........:
; Parameters ....:
; Return values .:
; Author ........: Lakereng 
; Modified ......: TheRevenor(2016)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================

 Func DetectAccount()

	While 1
		ZoomOut()
	ExitLoop
	WEnd
	Sleep (2000)

	_CaptureRegion()

Local $hBMP_Cropped = _GDIPlus_BitmapCloneArea($hBitmap, 0, 0,  200, 18)
Local $hHBMP_Cropped = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hBMP_Cropped)

if  Not FileExists(@ScriptDir & "\images\Multyfarming\main.bmp") Then
	 _GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Multyfarming\main.bmp")
Elseif  Not FileExists(@ScriptDir & "\images\Multyfarming\Second.bmp") Then
	 _GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Multyfarming\Second.bmp")
Elseif  Not FileExists(@ScriptDir & "\images\Multyfarming\Third.bmp") And ($iAccount = "3" Or $iAccount = "4") Then
	 _GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Multyfarming\Third.bmp")
Elseif  Not FileExists(@ScriptDir & "\images\Multyfarming\Fourth.bmp") Then
	 _GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Multyfarming\Fourth.bmp")
Elseif  Not FileExists(@ScriptDir & "\images\Multyfarming\Fifth.bmp") And ($iAccount = "5" Or $iAccount = "6") Then
	 _GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Multyfarming\Fifth.bmp")
Elseif  Not FileExists(@ScriptDir & "\images\Multyfarming\Sixth.bmp") And $iAccount = "6" Then
	 _GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Multyfarming\Sixth.bmp")
EndIf

if FileExists(@ScriptDir & "\images\Multyfarming\temp.bmp") Then
   FileDelete(@ScriptDir & "\images\Multyfarming\temp.bmp")
EndIf

	  _GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Multyfarming\temp.bmp")
	  _GDIPlus_ImageDispose($hBitmap)

$bm1 = _GDIPlus_ImageLoadFromFile (@ScriptDir & "\images\Multyfarming\main.bmp")
$bm3 = _GDIPlus_ImageLoadFromFile (@ScriptDir & "\images\Multyfarming\Second.bmp")
$bm2 = _GDIPlus_ImageLoadFromFile (@ScriptDir & "\images\Multyfarming\temp.bmp")
$bm4 = _GDIPlus_ImageLoadFromFile (@ScriptDir & "\images\Multyfarming\Third.bmp")
$bm5 = _GDIPlus_ImageLoadFromFile (@ScriptDir & "\images\Multyfarming\Fourth.bmp")
$bm6 = _GDIPlus_ImageLoadFromFile (@ScriptDir & "\images\Multyfarming\Fifth.bmp")
$bm7 = _GDIPlus_ImageLoadFromFile (@ScriptDir & "\images\Multyfarming\Sixth.bmp")

	If CompareBitmaps($bm1, $bm2) Then
		SetLog("Main Account Detected...", $COLOR_GREEN)
		_GUICtrlComboBox_SetCurSel($cmbProfile, 0)
		cmbProfile()
	ElseIf CompareBitmaps($bm3, $bm2) Then
		SetLog("Second Account Detected...", $COLOR_GREEN)
		_GUICtrlComboBox_SetCurSel($cmbProfile, 1)
		cmbProfile()
	ElseIf ($iAccount = "3" Or $iAccount = "4") And CompareBitmaps($bm4, $bm2) Then
		SetLog("Third Account Detected...", $COLOR_GREEN)
		_GUICtrlComboBox_SetCurSel($cmbProfile, 2)
		cmbProfile()
	ElseIf $iAccount = "4" And CompareBitmaps($bm5, $bm2) Then
		SetLog("Fourth Account Detected...", $COLOR_GREEN)
		_GUICtrlComboBox_SetCurSel($cmbProfile, 3)
		cmbProfile()
	ElseIf ($iAccount = "5" Or $iAccount = "6") And CompareBitmaps($bm6, $bm2) Then
		SetLog("Fifth Account Detected...", $COLOR_GREEN)
		_GUICtrlComboBox_SetCurSel($cmbProfile, 4)
		cmbProfile()
	ElseIf $iAccount = "6" And CompareBitmaps($bm7, $bm2) Then
		SetLog("Sixth Account Detected...", $COLOR_GREEN)
		_GUICtrlComboBox_SetCurSel($cmbProfile, 5)
		cmbProfile()
	Else
		SetLog("Temporary Account Detected...", $COLOR_Red)
	EndIf

_GDIPlus_ImageDispose($bm1)
_GDIPlus_ImageDispose($bm2)
_GDIPlus_ImageDispose($bm3)
_GDIPlus_ImageDispose($bm4)
_GDIPlus_ImageDispose($bm5)
_GDIPlus_ImageDispose($bm6)
_GDIPlus_ImageDispose($bm7)
		
EndFunc



Func CompareBitmaps($bm1, $bm2)
    $Bm1W = _GDIPlus_ImageGetWidth($bm1)
    $Bm1H = _GDIPlus_ImageGetHeight($bm1)
    $BitmapData1 = _GDIPlus_BitmapLockBits($bm1, 0, 0, $Bm1W, $Bm1H, $GDIP_ILMREAD, $GDIP_PXF32RGB)
    $Stride = DllStructGetData($BitmapData1, "Stride")
    $Scan0 = DllStructGetData($BitmapData1, "Scan0")
    $ptr1 = $Scan0
    $size1 = ($Bm1H - 1) * $Stride + ($Bm1W - 1) * 4
    $Bm2W = _GDIPlus_ImageGetWidth($bm2)
    $Bm2H = _GDIPlus_ImageGetHeight($bm2)
    $BitmapData2 = _GDIPlus_BitmapLockBits($bm2, 0, 0, $Bm2W, $Bm2H, $GDIP_ILMREAD, $GDIP_PXF32RGB)
    $Stride = DllStructGetData($BitmapData2, "Stride")
    $Scan0 = DllStructGetData($BitmapData2, "Scan0")
    $ptr2 = $Scan0
    $size2 = ($Bm2H - 1) * $Stride + ($Bm2W - 1) * 4
    $smallest = $size1
    If $size2 < $smallest Then $smallest = $size2
    $call = DllCall("msvcrt.dll", "int:cdecl", "memcmp", "ptr", $ptr1, "ptr", $ptr2, "int", $smallest)
    _GDIPlus_BitmapUnlockBits($bm1, $BitmapData1)
    _GDIPlus_BitmapUnlockBits($bm2, $BitmapData2)

    Return ($call[0]=0)
EndFunc

Func MakeAccount()
	Local $iLoopCount = 0
	waitMainScreen()
	Click(830, 590) ;Click Switch
	Sleep(1000)
	Click(437, 399 + $midOffsetY) ;Click  Disconn
	Sleep(1000)
	Click(437, 399 + $midOffsetY) ;Click  Connect
	While 1
		Sleep(1000)

		Local $Message = _PixelSearch(164, 45 + $midOffsetY, 166, 281 + $midOffsetY, Hex(0x689F38, 6), 0)
		If IsArray($Message) Then
			Click($Message[0], $Message[1] + 63 + $midOffsetY)
			Sleep(2000)
			_CaptureRegion()
			ExitLoop
		EndIf

		$iLoopCount += 1
		ConsoleWrite($iLoopCount & @CRLF)
		If $iLoopCount > 2000 Then
			ExitLoop
		EndIf
	WEnd
	Local $Message = _PixelSearch(164, 45 + $midOffsetY, 166, 281 + $midOffsetY, Hex(0x689F38, 6), 0)
		If IsArray($Message) Then
			Click($Message[0], $Message[1] + 63 + $midOffsetY)
			Sleep(2000)
			_CaptureRegion()
		EndIf
	If Not FileExists(@ScriptDir & "\images\Multyfarming\Accmain.bmp") Then

		Local $hBMP_Cropped = _GDIPlus_BitmapCloneArea($hBitmap, 155, 339,  200, 18)
		Local $hHBMP_Cropped = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hBMP_Cropped)
		_GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Multyfarming\Accmain.bmp")
	EndIf
	Sleep(1500)
	If Not FileExists(@ScriptDir & "\images\Multyfarming\AccSecond.bmp") Then

		Local $hBMP_Cropped = _GDIPlus_BitmapCloneArea($hBitmap, 155, 385,  200, 18)
		Local $hHBMP_Cropped = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hBMP_Cropped)
		_GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Multyfarming\AccSecond.bmp")
	EndIf
	Sleep(1500)
	If Not FileExists(@ScriptDir & "\images\Multyfarming\AccThird.bmp") And ($iAccount = "3" Or $iAccount = "4") Then

		Local $hBMP_Cropped = _GDIPlus_BitmapCloneArea($hBitmap, 155, 431,  200, 18)
		Local $hHBMP_Cropped = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hBMP_Cropped)
		_GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Multyfarming\AccThird.bmp")
	EndIf
	Sleep(1500)
	If Not FileExists(@ScriptDir & "\images\Multyfarming\AccFourth.bmp") And $iAccount = "4" Then

		Local $hBMP_Cropped = _GDIPlus_BitmapCloneArea($hBitmap, 155, 477,  200, 18)
		Local $hHBMP_Cropped = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hBMP_Cropped)
		_GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Multyfarming\AccFourth.bmp")
	EndIf
	Sleep(1500)
	If Not FileExists(@ScriptDir & "\images\Multyfarming\AccFifth.bmp") And ($iAccount = "5" Or $iAccount = "6") Then

		Local $hBMP_Cropped = _GDIPlus_BitmapCloneArea($hBitmap, 155, 532,  200, 18)
		Local $hHBMP_Cropped = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hBMP_Cropped)
		_GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Multyfarming\AccFifth.bmp")
	EndIf
	Sleep(1500)
	If Not FileExists(@ScriptDir & "\images\Multyfarming\AccSixth.bmp") And $iAccount = "6" Then

		Local $hBMP_Cropped = _GDIPlus_BitmapCloneArea($hBitmap, 155, 569,  200, 18)
		Local $hHBMP_Cropped = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hBMP_Cropped)
		_GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Multyfarming\AccSixth.bmp")
	EndIf
	Sleep(1500)
	
	If Not FileExists(@ScriptDir & "\images\Multyfarming\Ok.bmp") And $iAccount = "6" Then
		Local $hBMP_Cropped = _GDIPlus_BitmapCloneArea($hBitmap, 532, 671,  70, 18)
		Local $hHBMP_Cropped = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hBMP_Cropped)
		_GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Multyfarming\Ok.bmp")
		
	ElseIf Not FileExists(@ScriptDir & "\images\Multyfarming\Ok.bmp") And $iAccount = "5" Then
		Local $hBMP_Cropped = _GDIPlus_BitmapCloneArea($hBitmap, 532, 625,  70, 18)
		Local $hHBMP_Cropped = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hBMP_Cropped)
		_GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Multyfarming\Ok.bmp")
		
	ElseIf Not FileExists(@ScriptDir & "\images\Multyfarming\Ok.bmp") And $iAccount = "4" Then
		Local $hBMP_Cropped = _GDIPlus_BitmapCloneArea($hBitmap, 532, 579,  70, 18)
		Local $hHBMP_Cropped = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hBMP_Cropped)
		_GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Multyfarming\Ok.bmp")

	ElseIf Not FileExists(@ScriptDir & "\images\Multyfarming\Ok.bmp") And $iAccount = "3" Then
		Local $hBMP_Cropped = _GDIPlus_BitmapCloneArea($hBitmap, 532, 533,  70, 18)
		Local $hHBMP_Cropped = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hBMP_Cropped)
		_GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Multyfarming\Ok.bmp")
	ElseIf Not FileExists(@ScriptDir & "\images\Multyfarming\Ok.bmp") Then
		Local $hBMP_Cropped = _GDIPlus_BitmapCloneArea($hBitmap, 532, 487,  70, 18)
		Local $hHBMP_Cropped = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hBMP_Cropped)
		_GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Multyfarming\Ok.bmp")
	EndIf
EndFunc


; IceCube (Multy-Farming Revamp v1.6)
; Validate the account before switch
 Func DetectCurrentAccount($CheckAccountID)

	While 1
		ZoomOut()
	ExitLoop
	WEnd
	Sleep (2000)

	_CaptureRegion()

	Local $hBMP_Cropped = _GDIPlus_BitmapCloneArea($hBitmap, 0, 0,  200, 18)
	Local $hHBMP_Cropped = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hBMP_Cropped)

	if Not FileExists(@ScriptDir & "\images\Multyfarming\" & $CheckAccountID & ".bmp") Then
		SetLog("Multy-farming not configured correctly. File \images\Multyfarming\main.bmp is missing.", $COLOR_BLUE)
		Return False
	EndIf

	if FileExists(@ScriptDir & "\images\Multyfarming\temp.bmp") Then
	   FileDelete(@ScriptDir & "\images\Multyfarming\temp.bmp")
	EndIf

	  _GDIPlus_ImageSaveToFile($hBMP_Cropped, @ScriptDir & "\images\Multyfarming\temp.bmp")
	  _GDIPlus_ImageDispose($hBitmap)

	$bm1 = _GDIPlus_ImageLoadFromFile (@ScriptDir & "\images\Multyfarming\main.bmp")
	$bm3 = _GDIPlus_ImageLoadFromFile (@ScriptDir & "\images\Multyfarming\Second.bmp")
	$bm2 = _GDIPlus_ImageLoadFromFile (@ScriptDir & "\images\Multyfarming\temp.bmp")
	$bm4 = _GDIPlus_ImageLoadFromFile (@ScriptDir & "\images\Multyfarming\Third.bmp")
	$bm5 = _GDIPlus_ImageLoadFromFile (@ScriptDir & "\images\Multyfarming\Fourth.bmp")
	$bm6 = _GDIPlus_ImageLoadFromFile (@ScriptDir & "\images\Multyfarming\Fifth.bmp")
	$bm7 = _GDIPlus_ImageLoadFromFile (@ScriptDir & "\images\Multyfarming\Sixth.bmp")

	If $CheckAccountID = "Main" AND CompareBitmaps($bm1, $bm2) Then
		SetLog("Main Account Detected. No switch is required.", $COLOR_RED)
		_GDIPlus_ImageDispose($bm1)
		_GDIPlus_ImageDispose($bm2)
		_GDIPlus_ImageDispose($bm3)
		_GDIPlus_ImageDispose($bm4)
		_GDIPlus_ImageDispose($bm5)
		_GDIPlus_ImageDispose($bm6)
		_GDIPlus_ImageDispose($bm7)
		Return False
	ElseIf $CheckAccountID = "Second" AND CompareBitmaps($bm3, $bm2) Then
		SetLog("Second Account Detected. No switch is required.", $COLOR_RED)
		_GDIPlus_ImageDispose($bm1)
		_GDIPlus_ImageDispose($bm2)
		_GDIPlus_ImageDispose($bm3)
		_GDIPlus_ImageDispose($bm4)
		_GDIPlus_ImageDispose($bm5)
		_GDIPlus_ImageDispose($bm6)
		_GDIPlus_ImageDispose($bm7)
		Return False
	ElseIf $CheckAccountID = "Third" AND ($iAccount = "3" Or $iAccount = "4") And CompareBitmaps($bm4, $bm2) Then
		SetLog("Third Account Detected. No switch is required.", $COLOR_RED)
		_GDIPlus_ImageDispose($bm1)
		_GDIPlus_ImageDispose($bm2)
		_GDIPlus_ImageDispose($bm3)
		_GDIPlus_ImageDispose($bm4)
		_GDIPlus_ImageDispose($bm5)
		_GDIPlus_ImageDispose($bm6)
		_GDIPlus_ImageDispose($bm7)
		Return False
	ElseIf $CheckAccountID = "Fourth" AND $iAccount = "4" And CompareBitmaps($bm5, $bm2) Then
		SetLog("Fourth Account Detected. No switch is required.", $COLOR_RED)
		_GDIPlus_ImageDispose($bm1)
		_GDIPlus_ImageDispose($bm2)
		_GDIPlus_ImageDispose($bm3)
		_GDIPlus_ImageDispose($bm4)
		_GDIPlus_ImageDispose($bm5)
		_GDIPlus_ImageDispose($bm6)
		_GDIPlus_ImageDispose($bm7)
		Return False
	ElseIf $CheckAccountID = "Fifth" AND ($iAccount = "5" Or $iAccount = "6") And CompareBitmaps($bm6, $bm2) Then
		SetLog("Fifth Account Detected. No switch is required.", $COLOR_RED)
		_GDIPlus_ImageDispose($bm1)
		_GDIPlus_ImageDispose($bm2)
		_GDIPlus_ImageDispose($bm3)
		_GDIPlus_ImageDispose($bm4)
		_GDIPlus_ImageDispose($bm5)
		_GDIPlus_ImageDispose($bm6)
		_GDIPlus_ImageDispose($bm7)
		Return False
	ElseIf $CheckAccountID = "Sixth" AND $iAccount = "6" And CompareBitmaps($bm7, $bm2) Then
		SetLog("Sixth Account Detected. No switch is required.", $COLOR_RED)
		_GDIPlus_ImageDispose($bm1)
		_GDIPlus_ImageDispose($bm2)
		_GDIPlus_ImageDispose($bm3)
		_GDIPlus_ImageDispose($bm4)
		_GDIPlus_ImageDispose($bm5)
		_GDIPlus_ImageDispose($bm6)
		_GDIPlus_ImageDispose($bm7)
		Return False
	EndIf

	_GDIPlus_ImageDispose($bm1)
	_GDIPlus_ImageDispose($bm2)
	_GDIPlus_ImageDispose($bm3)
	_GDIPlus_ImageDispose($bm4)
	_GDIPlus_ImageDispose($bm5)
	_GDIPlus_ImageDispose($bm6)
	_GDIPlus_ImageDispose($bm7)

	Return True
EndFunc  ;==>DetectCurrentAccount
; IceCube (Multy-Farming Revamp v1.6)