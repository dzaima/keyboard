﻿#NoEnv
SendMode Input
#InstallKeybdHook
#UseHook On
Menu, Tray, Icon, shell32.dll, 283 ; this changes the tray icon to a little keyboard!
#SingleInstance force
#MaxHotkeysPerInterval 2000
#WinActivateForce


*~F24::
FileRead, key, keypressed.txt
if (key = "Tab")
  send, !{tab}
else if (key = "^Tab")
  send, ^!{tab}
else if (key = "BS")
  send, {backspace}
else if (key = "F1")
  send, ^r
else if (key = "F2")
  send, ^{Enter}
else if (key = "F3")
  send, ^!b
else if (key = "^z")
  send, ^z
else if (key = "^a")
  send, ^a
else if (key = "^x")
  send, ^x
else if (key = "^c")
  send, ^c
else if (key = "^v")
  send, ^v
else if (key = "F12")
  send, throw new Exception("");{Left}{Left}{Left}
else if (key = "F11")
  send, throws Exception
else if (key = "`")
  send, ■
else if (key = "+`")
  send, ’
else if (key = "^`")
  send, □
else if (key = "1")
  send, ¹
else if (key = "+1")
  send, №
else if (key = "^1")
  send, ¡
else if (key = "2")
  send, ²
else if (key = "3")
  send, ³
else if (key = "4")
  send, ⁴
else if (key = "5")
  send, ⁵
else if (key = "6")
  send, ⁶
else if (key = "7")
  send, ⁷
else if (key = "8")
  send, ⁸
else if (key = "+8")
  send, ∙
else if (key = "9")
  send, ⁹
else if (key = "+9")
  send, ⁽
else if (key = "0")
  send, ⁰
else if (key = "+0")
  send, ⁾
else if (key = "!0")
  send, ∆
else if (key = "-")
  send, ┌
else if (key = "+-")
  send, ╔
else if (key = "=")
  send, ≠
else if (key = "+=")
  send, ┼
else if (key = "!=")
  send, ╗
else if (key = "\")
  send, ┘
else if (key = "+\")
  send, ┐
else if (key = "^\")
  send, ╝
else if (key = "NumpadDiv")
  send, ÷
else if (key = "NumpadSub")
  send, κ
else if (key = "e")
  send, ē
else if (key = "r")
  send, ŗ
else if (key = "+r")
  send, β
else if (key = "u")
  send, ζ
else if (key = "+u")
  send, υ
else if (key = "^u")
  send, ū
else if (key = "i")
  send, ī
else if (key = "+i")
  send, Ι
else if (key = "o")
  send, ο
else if (key = "+o")
  send, Ο
else if (key = "p")
  send, ╬
else if (key = "+p")
  send, ╥
else if (key = "^p")
  send, Γ
else if (key = "[")
  send, ⌡
else if (key = "+[")
  send, ∫
else if (key = "]")
  send, ⌠
else if (key = "Insert")
  send, «
else if (key = "Home")
  send, ░
else if (key = "Numpad8")
  send, ▲
else if (key = "Numpad9")
  send, ↕
else if (key = "NumpadAdd")
  send, Κ
else if (key = "a")
  send, ā
else if (key = "+a")
  send, α
else if (key = "s")
  send, Θ
else if (key = "+s")
  send, ∑
else if (key = "d")
  send, δ
else if (key = "+d")
  send, Δ
else if (key = "l")
  send, ⁄
else if (key = "'")
  send, ”
else if (key = "+'")
  send, "
else if (key = "^'")
  send, Ƨ
else if (key = "!'")
  send, ƨ
else if (key = "Enter")
  send, ¶
else if (key = "Delete")
  send, »
else if (key = "end")
  send, █
else if (key = "+end")
  send, ▒
else if (key = "Numpad4")
  send, ◄
else if (key = "Numpad6")
  send, ►
else if (key = "z")
  send, ž
else if (key = "+z")
  send, Ζ
else if (key = "x")
  send, ι
else if (key = "c")
  send, č
else if (key = "v")
  send, æ
else if (key = "+v")
  send, Æ
else if (key = ",")
  send, ≤
else if (key = ".")
  send, ≥
else if (key = "/")
  send, └
else if (key = "+/")
  send, ‽
else if (key = "^/")
  send, ╚
else if (key = "Up")
  send, ─
else if (key = "Numpad2")
  send, ▼
else if (key = "Numpad3")
  send, ↔
else if (key = "Space")
  send, ▓
else if (key = "+Space")
  send, θ
else if (key = "^Space")
  send, θ
else if (key = "!Space")
  send, θ
else if (key = "Left")
  send, ←
else if (key = "Down")
  send, │
else if (key = "Right")
  send, →
else if (key = "Numpad0")
  send, ø
else if (key = "NumpadDel")
  send, ±
return
Launch_Mail::
  Send, ^!b
return
