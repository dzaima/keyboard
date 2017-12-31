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
!`::
  send "■"
return
!+`::
  send "’"
return
!^`::
  send "□"
return
!1::
  send "¹"
return
!+1::
  send "№"
return
!^1::
  send "¡"
return
!2::
  send "²"
return
!3::
  send "³"
return
!4::
  send "⁴"
return
!5::
  send "⁵"
return
!6::
  send "⁶"
return
!7::
  send "⁷"
return
!8::
  send "⁸"
return
!+8::
  send "∙"
return
!9::
  send "⁹"
return
!+9::
  send "⁽"
return
!0::
  send "⁰"
return
!+0::
  send "⁾"
return
!+^0::
  send "∆"
return
!-::
  send "┌"
return
!+-::
  send "╔"
return
!=::
  send "≠"
return
!+=::
  send "┼"
return
!+^=::
  send "╗"
return
!\::
  send "┘"
return
!+\::
  send "┐"
return
!^\::
  send "╝"
return
!NumpadDiv::
  send "÷"
return
!NumpadSub::
  send "κ"
return
!e::
  send "ē"
return
!r::
  send "ŗ"
return
!+r::
  send "β"
return
!u::
  send "ζ"
return
!+u::
  send "υ"
return
!^u::
  send "ū"
return
!i::
  send "ī"
return
!+i::
  send "Ι"
return
!o::
  send "ο"
return
!+o::
  send "Ο"
return
!p::
  send "╬"
return
!+p::
  send "╥"
return
!^p::
  send "Γ"
return
![::
  send "⌡"
return
!+[::
  send "∫"
return
!]::
  send "⌠"
return
!Insert::
  send "«"
return
!Home::
  send "░"
return
!Numpad8::
  send "▲"
return
!Numpad9::
  send "↕"
return
!NumpadAdd::
  send "Κ"
return
!a::
  send "ā"
return
!+a::
  send "α"
return
!s::
  send "Θ"
return
!+s::
  send "∑"
return
!d::
  send "δ"
return
!+d::
  send "Δ"
return
!l::
  send "⁄"
return
!'::
  send "”"
return
!+'::
  send "ƨ"
return
!^'::
  send "Ƨ"
return
!Enter::
  send "¶"
return
!Delete::
  send "»"
return
!end::
  send "█"
return
!+end::
  send "▒"
return
!Numpad4::
  send "◄"
return
!Numpad6::
  send "►"
return
!z::
  send "ž"
return
!+z::
  send "Ζ"
return
!x::
  send "ι"
return
!c::
  send "č"
return
!v::
  send "æ"
return
!+v::
  send "Æ"
return
!,::
  send "≤"
return
!.::
  send "≥"
return
!/::
  send "└"
return
!+/::
  send "‽"
return
!^/::
  send "╚"
return
!Up::
  send "─"
return
!Numpad2::
  send "▼"
return
!Numpad3::
  send "↔"
return
!Space::
  send " "
return
!+Space::
  send "θ"
return
!^Space::
  send "θ"
return
!+^Space::
  send "θ"
return
!Left::
  send "←"
return
!Down::
  send "│"
return
!Right::
  send "→"
return
!Numpad0::
  send "ø"
return
!NumpadDot::
  send "±"
return
