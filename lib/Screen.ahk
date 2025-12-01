getMonitorHandle() {
  ; Initialize Monitor handle
  hMon := DllCall("MonitorFromPoint"
	, "int64", 0 ; point on monitor
	, "uint", 1) ; flag to return primary monitor on failure

	
  ; Get Physical Monitor from handle
  VarSetCapacity(Physical_Monitor, 8 + 256, 0)

  DllCall("dxva2\GetPhysicalMonitorsFromHMONITOR"
	, "int", hMon   ; monitor handle
	, "uint", 1   ; monitor array size
	, "int", &Physical_Monitor)   ; point to array with monitor

  return hPhysMon := NumGet(Physical_Monitor)
}

destroyMonitorHandle(handle) {
  DllCall("dxva2\DestroyPhysicalMonitor", "int", handle)
}

setMonitorBrightnessProgressive(target) {
    currentBrightness := getMonitorBrightness()

	if (currentBrightness == target)
        return
	
	steps := 15
    Loop, %steps% {
        val := Round(currentBrightness + (target - currentBrightness) * (A_Index / steps))
        if (val < 0)
            val := 0
        else if (val > 100)
            val := 100
        setMonitorBrightness(val)
    }
}

setMonitorBrightness(source) {
  handle := getMonitorHandle()
  DllCall("dxva2\SetVCPFeature"
	, "int", handle
	, "char", 0x10
	, "uint", source)
  destroyMonitorHandle(handle)
}

getMonitorBrightness() {
  handle := getMonitorHandle()
  DllCall("dxva2\GetVCPFeatureAndVCPFeatureReply"
	, "int", handle
	, "char", 0x10
	, "Ptr", 0
	, "uint*", currentValue
	, "uint*", maximumValue)
  destroyMonitorHandle(handle)
  return currentValue
}