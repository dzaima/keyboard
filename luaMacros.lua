-- Most of the code here is from https://www.youtube.com/watch?v=Arn8ExQ2Gjg&ab_channel=LinusTechTips
-- github link of it - https://github.com/TaranVH/2nd-keyboard/tree/master/LUAMACROS


-- get luamacros HERE: http://www.hidmacros.eu/forum/viewtopic.php?f=10&t=241#p794
-- plug in your 2nd keyboard, load this script into LUAmacros, and press the triangle PLAY button.
-- Then, press any key on that keyboard to assign logical name ('MACROS') to macro keyboard
-- When done this way, you have to reassign the name to your 2nd keyboard every time you open LUAmacros, using the play button located above.
-- There may be a better, more permanent solution, but I don't know it.
lmc_assign_keyboard('MACROS');

sendToAHK = function (key)
  local file = io.open("keypressed.txt", "w") -- writing this string to a text file on disk is probably NOT the best method. Feel free to program something better!
  --Make sure to substitute the path that leads to your own "keypressed.txt" file, using the double backslashes.
  file:write(key)
  file:flush() --"flush" means "save"
  file:close()
  lmc_send_keys('{F24}')  -- This presses F24. Using the F24 key to trigger AutoHotKey is probably NOT the best method. Feel free to program something better!
end
local config = {
  [45]  = "Insert",
  [36]  = "Home",
  [33]  = "PgUp",
  [46]  = "Delete",
  [35]  = "End",
  [34]  = "PgDn",

  [145]  = "ScrollLock",
  [27]  = "Esc",

  [112] = "F1",
  [113] = "F2",
  [114] = "F3",
  [115] = "F4",
  [116] = "F5",
  [117] = "F6",
  [118] = "F7",
  [119] = "F8",
  [120] = "F9",
  [121] = "F10",
  [122] = "F11",
  [123] = "F12",

  [8]   = "BS",
  [9]   = "Tab",
  [220] = "\\",
  [13]  = "Enter",
  [38]  = "Up",
  [37]  = "Left",
  [40]  = "Down",
  [39]  = "Right",
  [32]  = "Space",
  [186] = "\"",
  [222] = "'",
  [190] = ".",
  [191] = "/",
  [188] = ",",
  [219] = "[",
  [221] = "]",
  [189] = "-",
  [187] = "=",

  [96]  = "Numpad0",
  [97]  = "Numpad1",
  [98]  = "Numpad2",
  [99]  = "Numpad3",
  [100] = "Numpad4",
  [101] = "Numpad5",
  [102] = "Numpad6",
  [103] = "Numpad7",
  [104] = "Numpad8",
  [105] = "Numpad9",

  [106] = "NumpadMult",
  [107] = "NumpadAdd",
  [109] = "NumpadSub",
  [110] = "NumpadDot",
  [111] = "NumpadDiv",
  [144] = "NumpadLock", --probably it is best to avoid this key. I keep numlock ON, or it has unexpected effects

  [192] = "`",
  [string.byte('Q')] = "q",
  [string.byte('W')] = "w",
  [string.byte('E')] = "e",
  [string.byte('R')] = "r",
  [string.byte('T')] = "t",
  [string.byte('Y')] = "y",
  [string.byte('U')] = "u",
  [string.byte('I')] = "i",
  [string.byte('O')] = "o",
  [string.byte('P')] = "p",
  [string.byte('A')] = "a",
  [string.byte('S')] = "s",
  [string.byte('D')] = "d",
  [string.byte('F')] = "f",
  [string.byte('G')] = "g",
  [string.byte('H')] = "h",
  [string.byte('J')] = "j",
  [string.byte('K')] = "k",
  [string.byte('L')] = "l",
  [string.byte('Z')] = "z",
  [string.byte('X')] = "x",
  [string.byte('C')] = "c",
  [string.byte('V')] = "v",
  [string.byte('B')] = "b",
  [string.byte('N')] = "n",
  [string.byte('M')] = "m",

  [string.byte('0')] = "0",
  [string.byte('1')] = "1",
  [string.byte('2')] = "2",
  [string.byte('3')] = "3",
  [string.byte('4')] = "4",
  [string.byte('5')] = "5",
  [string.byte('6')] = "6",
  [string.byte('7')] = "7",
  [string.byte('8')] = "8",
  [string.byte('9')] = "9",
  [16] = "+",
  [17] = "^",
  [18] = "!",

}
--modifiers
local MDs = {
  ['+'] = 0,
  ['^'] = 0,
  ['!'] = 0
}
-- define callback for whole device
lmc_set_handler('MACROS', function(button, direction)
  local name = config[button];
  if type(name) == "string" then
    if (name == '+' or name == '^' or name == '!') then
      MDs[name] = direction
      print('MD ' .. MDs[name] .. ' ' .. button .. ' : ' .. name)
    else
      if direction == 1 then
        local fullName = name
        for mdname,mdval in pairs(MDs) do
          --print(mdname .. ' : ' .. mdval)
          if mdval == 1 then
            fullName = mdname .. fullName
          end
        end
        print('Key pressed: ' .. direction .. ' ' .. button .. ' : ' .. fullName)
        sendToAHK(fullName)
        --
      end
    end
  else
    print('Not yet assigned: ' .. button)
  end
end)
