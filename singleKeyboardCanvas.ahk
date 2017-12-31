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
!1::
  send "１"
return
!+1::
  send "！"
return
!^1::
  send "¹"
return
!2::
  send "２"
return
!+2::
  send "＠"
return
!^2::
  send "²"
return
!3::
  send "３"
return
!+3::
  send "＃"
return
!^3::
  send "³"
return
!4::
  send "４"
return
!^4::
  send "⁴"
return
!5::
  send "５"
return
!+5::
  send "％"
return
!^5::
  send "⁵"
return
!6::
  send "６"
return
!^6::
  send "⁶"
return
!7::
  send "７"
return
!^7::
  send "⁷"
return
!8::
  send "８"
return
!+8::
  send "×"
return
!^8::
  send "⁸"
return
!9::
  send "９"
return
!+9::
  send "（"
return
!^9::
  send "⁹"
return
!0::
  send "０"
return
!+0::
  send "）"
return
!^0::
  send "⁰"
return
!-::
  send "－"
return
!=::
  send "≡"
return
!+=::
  send "＋"
return
!\::
  send "＼"
return
!+\::
  send "｜"
return
!NumpadDiv::
  send "÷"
return
!NumpadMult::
  send "＊"
return
!NumpadSub::
  send "－"
return
!q::
  send "ｑ"
return
!+q::
  send "Ｑ"
return
!w::
  send "ｗ"
return
!+w::
  send "Ｗ"
return
!^w::
  send "ω"
return
!+^w::
  send "ω"
return
!e::
  send "ｅ"
return
!+e::
  send "Ｅ"
return
!r::
  send "ｒ"
return
!+r::
  send "Ｒ"
return
!^r::
  send "√"
return
!t::
  send "ｔ"
return
!+t::
  send "Ｔ"
return
!y::
  send "ｙ"
return
!+y::
  send "Ｙ"
return
!u::
  send "ｕ"
return
!+u::
  send "Ｕ"
return
!i::
  send "ｉ"
return
!+i::
  send "Ｉ"
return
!o::
  send "ｏ"
return
!+o::
  send "Ｏ"
return
!p::
  send "ｐ"
return
!+p::
  send "Ｐ"
return
![::
  send "［"
return
!+[::
  send "｛"
return
!]::
  send "］"
return
!+]::
  send "｝"
return
!Insert::
  send "«"
return
!Home::
  send "□"
return
!Numpad8::
  send "⇵"
return
!Numpad9::
  send "↕"
return
!NumpadAdd::
  send "∔"
return
!a::
  send "ａ"
return
!+a::
  send "Ａ"
return
!^a::
  send "α"
return
!+^a::
  send "α"
return
!s::
  send "ｓ"
return
!+s::
  send "Ｓ"
return
!^s::
  send "∑"
return
!d::
  send "ｄ"
return
!+d::
  send "Ｄ"
return
!f::
  send "ｆ"
return
!+f::
  send "Ｆ"
return
!g::
  send "ｇ"
return
!+g::
  send "Ｇ"
return
!h::
  send "ｈ"
return
!+h::
  send "Ｈ"
return
!j::
  send "ｊ"
return
!+j::
  send "Ｊ"
return
!k::
  send "ｋ"
return
!+k::
  send "Ｋ"
return
!l::
  send "ｌ"
return
!+l::
  send "Ｌ"
return
!;::
  send "；"
return
!+;::
  send "："
return
!Enter::
  send "¶"
return
!Delete::
  send "»"
return
!end::
  send "✓"
return
!Numpad6::
  send "↔"
return
!z::
  send "ｚ"
return
!+z::
  send "Ｚ"
return
!x::
  send "ｘ"
return
!+x::
  send "Ｘ"
return
!c::
  send "ｃ"
return
!+c::
  send "Ｃ"
return
!v::
  send "ｖ"
return
!+v::
  send "Ｖ"
return
!b::
  send "ｂ"
return
!+b::
  send "Ｂ"
return
!n::
  send "ｎ"
return
!+n::
  send "Ｎ"
return
!m::
  send "ｍ"
return
!+m::
  send "Ｍ"
return
!+,::
  send "＜"
return
!^,::
  send "≤"
return
!+.::
  send "＞"
return
!^.::
  send "≥"
return
!/::
  send "／"
return
!+/::
  send "？"
return
!Numpad2::
  send "⇵"
return
!Numpad3::
  send "↔"
return
!Space::
  send "∙"
return
!+Space::
  send "？"
return
!^Space::
  send "‽"
return
!NumpadDot::
  send "±"
return
