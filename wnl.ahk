;@Ahk2Exe-SetName WindowsNightLightCLI
;@Ahk2Exe-SetDescription Changes monitor brightness and Windows Night Light settings.
;@Ahk2Exe-SetVersion 1.0.0
;@Ahk2Exe-SetCopyright 2025 elModo7 - VictorDevLog
;@Ahk2Exe-SetOrigFilename wnl.exe
;@Ahk2Exe-ConsoleApp
#NoEnv
#SingleInstance Force
#NoTrayIcon
global version := "1.0.0"
global appName := "WindowsNightLightCLI"

; Libs
#Include <Screen>
#Include <Chalk>
#Include <ConsoleMessages>
#Include <WindowsNightLight>

; Globals
global nightLight := 0, nightLightStrength := 0, brightness := 0

; Init
initCLIMessages()
Loop, %0%
{
	param := %A_Index%
	switch
	{
		case param == "-h" || param == "-help":
			showHelp()
		case InStr(param, "-nightlight="):
			nightLight := StrSplit(param, "=")[2]
		case InStr(param, "-nightlight_strength="):
			nightLightStrength := StrSplit(param, "=")[2]
		case (InStr(param, "-brightness=")):
			brightness := StrSplit(param, "=")[2]
		default:
			cliLoudErrorMessage("`r`nUnknown command: " param)
			cliWarningMessage("`r`nType -h for a list of available commands`r`n")
			ExitApp
	}
}
if (!param)
	showHelp()

if (nightLightStrength < 0 || nightLightStrength > 100 || nightLightStrength == "") {
	cliLoudWarningMessage("nightlight_strength must be a value between 0 and 100")
	ExitApp
}

if (brightness < 0 || brightness > 100 || brightness == "") {
	cliLoudWarningMessage("brightness must be a value between 0 and 100")
	ExitApp
}

if (nightLight) {
	NightLight_SetStrength(nightLightStrength)
	NightLight_Enable()
} else {
	NightLight_Disable()
}

setMonitorBrightness(brightness)
ExitApp

showHelp() {
	global
	cliLoudSuccessMessage("`r`nAvailable commands:")
	cliInfoMessage("`r`n-nightlight=<0-1> -> Set Night Light mode ON/OFF`r`n-nightlight_strength=<0-100> -> Sets Night Light Intensity`r`n-brightness=<0-100> -> Sets Screen Brigthness`r`n")
	ExitApp
}