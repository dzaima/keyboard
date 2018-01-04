#InstallKeybdHook
#UseHook On
#SingleInstance force
#MaxHotkeysPerInterval 2000
#WinActivateForce

BSmode:= false
BSU:= 0
BSD:= 0
BSR:= 0
BSL:= 0

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

*~F24::
key:= FileRead("keypressed.txt")
if (key == "Numpad5") {
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
}
else if (key = "Tab")
  send "!{tab}"
else if (key = "^Tab")
  send "^!{tab}"
else if (key = "BS")
  send "{backspace}"
else if (key = "F1")
  send "^r"
else if (key = "F2")
  send "^{Enter}"
else if (key = "F3")
  send "^!b"
else if (key = "^z")
  send "^z"
else if (key = "^a")
  send "^a"
else if (key = "^x")
  send "^x"
else if (key = "^c")
  send "^c"
else if (key = "^v")
  send "^v"
else if (key = "1")
  send "１"
else if (key = "+1")
  send "！"
else if (key = "^1")
  send "¹"
else if (key = "2")
  send "２"
else if (key = "+2")
  send "＠"
else if (key = "^2")
  send "²"
else if (key = "3")
  send "３"
else if (key = "+3")
  send "＃"
else if (key = "^3")
  send "³"
else if (key = "4")
  send "４"
else if (key = "^4")
  send "⁴"
else if (key = "5")
  send "５"
else if (key = "+5")
  send "％"
else if (key = "^5")
  send "⁵"
else if (key = "6")
  send "６"
else if (key = "+6")
  send "√"
else if (key = "^6")
  send "⁶"
else if (key = "7")
  send "７"
else if (key = "^7")
  send "⁷"
else if (key = "8")
  send "８"
else if (key = "+8")
  send "×"
else if (key = "^8")
  send "⁸"
else if (key = "9")
  send "９"
else if (key = "+9")
  send "（"
else if (key = "^9")
  send "⁹"
else if (key = "0")
  send "０"
else if (key = "+0")
  send "）"
else if (key = "^0")
  send "⁰"
else if (key = "-")
  send "－"
else if (key = "=")
  send "≡"
else if (key = "+=")
  send "＋"
else if (key = "\")
  send "＼"
else if (key = "+\")
  send "｜"
else if (key = "NumpadDiv")
  send "÷"
else if (key = "NumpadMult")
  send "＊"
else if (key = "NumpadSub")
  send "－"
else if (key = "q")
  send "ｑ"
else if (key = "+q")
  send "Ｑ"
else if (key = "w")
  send "ｗ"
else if (key = "+w")
  send "Ｗ"
else if (key = "^w")
  send "ω"
else if (key = "!w")
  send "ω"
else if (key = "e")
  send "ｅ"
else if (key = "+e")
  send "Ｅ"
else if (key = "r")
  send "ｒ"
else if (key = "+r")
  send "Ｒ"
else if (key = "^r")
  send "ŗ"
else if (key = "t")
  send "ｔ"
else if (key = "+t")
  send "Ｔ"
else if (key = "y")
  send "ｙ"
else if (key = "+y")
  send "Ｙ"
else if (key = "u")
  send "ｕ"
else if (key = "+u")
  send "Ｕ"
else if (key = "i")
  send "ｉ"
else if (key = "+i")
  send "Ｉ"
else if (key = "o")
  send "ｏ"
else if (key = "+o")
  send "Ｏ"
else if (key = "p")
  send "ｐ"
else if (key = "+p")
  send "Ｐ"
else if (key = "[")
  send "［"
else if (key = "+[")
  send "｛"
else if (key = "]")
  send "］"
else if (key = "+]")
  send "｝"
else if (key = "Insert")
  send "«"
else if (key = "Home")
  send "□"
else if (key = "Numpad7")
  send "↶"
else if (key = "Numpad8")
  send "↕"
else if (key = "Numpad9")
  send "↷"
else if (key = "NumpadAdd")
  send "∔"
else if (key = "a")
  send "ａ"
else if (key = "+a")
  send "Ａ"
else if (key = "^a")
  send "α"
else if (key = "!a")
  send "α"
else if (key = "s")
  send "ｓ"
else if (key = "+s")
  send "Ｓ"
else if (key = "^s")
  send "∑"
else if (key = "d")
  send "ｄ"
else if (key = "+d")
  send "Ｄ"
else if (key = "f")
  send "ｆ"
else if (key = "+f")
  send "Ｆ"
else if (key = "g")
  send "ｇ"
else if (key = "+g")
  send "Ｇ"
else if (key = "h")
  send "ｈ"
else if (key = "+h")
  send "Ｈ"
else if (key = "j")
  send "ｊ"
else if (key = "+j")
  send "Ｊ"
else if (key = "k")
  send "ｋ"
else if (key = "+k")
  send "Ｋ"
else if (key = "l")
  send "ｌ"
else if (key = "+l")
  send "Ｌ"
else if (key = ";")
  send "；"
else if (key = "+;")
  send "："
else if (key = "Enter")
  send "¶"
else if (key = "Delete")
  send "»"
else if (key = "end")
  send "✓"
else if (key = "Numpad6")
  send "↔"
else if (key = "z")
  send "ｚ"
else if (key = "+z")
  send "Ｚ"
else if (key = "x")
  send "ｘ"
else if (key = "+x")
  send "Ｘ"
else if (key = "c")
  send "ｃ"
else if (key = "+c")
  send "Ｃ"
else if (key = "v")
  send "ｖ"
else if (key = "+v")
  send "Ｖ"
else if (key = "b")
  send "ｂ"
else if (key = "+b")
  send "Ｂ"
else if (key = "n")
  send "ｎ"
else if (key = "+n")
  send "Ｎ"
else if (key = "m")
  send "ｍ"
else if (key = "+m")
  send "Ｍ"
else if (key = "+,")
  send "＜"
else if (key = "^,")
  send "≤"
else if (key = "+.")
  send "＞"
else if (key = "^.")
  send "≥"
else if (key = "/")
  send "／"
else if (key = "+/")
  send "？"
else if (key = "Numpad1")
  send "⟳"
else if (key = "Numpad2")
  send "⇵"
else if (key = "Numpad3")
  send "↔"
else if (key = "Space")
  send "∙"
else if (key = "+Space")
  send "？"
else if (key = "^Space")
  send "‽"
else if (key = "NumpadDot")
  send "±"
