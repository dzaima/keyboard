#NoEnv
SendMode Input
#InstallKeybdHook
#UseHook On
Menu, Tray, Icon, shell32.dll, 283 ; this changes the tray icon to a little keyboard!
#SingleInstance force
#MaxHotkeysPerInterval 2000
#WinActivateForce


*~F24::
FileRead, key, keypressed.txt
