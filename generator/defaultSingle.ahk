#InstallKeybdHook
#UseHook On
#SingleInstance force
#MaxHotkeysPerInterval 2000
#WinActivateForce

BSmode:= false
active:= true
BSU:= 0
BSD:= 0
BSR:= 0
BSL:= 0
!F9::
  active:= !active
return



#if BSmode
Numpad5::
#if
!Numpad5::
  if BSMode {
    sval:= ""
    for _, side in [BSL,BSU,BSR,BSD] {
      sval.= ["_","r","d","b"][1+side]
    }
    f:= FileOpen("boxChars.txt", "r", "utf-8")
    done:= false
    while (!f.AtEOF && !done) {
      line := f.ReadLine()
      if (SubStr(line, 1, 4) == sval) {
        send SubStr(line, 5)
        done:= true
      }
    }
    f.Close()
  } else {
    BSU:= 0
    BSD:= 0
    BSR:= 0
    BSL:= 0
  }
  BSMode:= !BSmode
return

#if BSmode
  Numpad8::
    if (BSmode) BSU++
  return
  Numpad2::
    if (BSmode) BSD++
  return
  Numpad4::
    if (BSmode) BSL++
  return
  Numpad6::
    if (BSmode) BSR++
  return
  
  Numpad7::
    if (BSmode) {
      BSL++
      BSU++
    }
  return
  Numpad9::
    if (BSmode) {
      BSU++
      BSR++
    }
  return
  Numpad3::
    if (BSmode) {
      BSR++
      BSD++
    }
  return
  Numpad1::
    if (BSmode) {
      BSD++
      BSL++
    }
  return
#if

#if active