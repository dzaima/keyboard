# SOGL keyboard

..This is not limited to SOGL only though - go in `generator/kbd.txt` and modify as you like.

The LUA macros part of this is mostly taken from Tarans [video on Linus Tech Tips](https://www.youtube.com/watch?v=Arn8ExQ2Gjg), and the code is taken from  [here](https://github.com/TaranVH/2nd-keyboard/tree/master/LUAMACROS). Go thank him for the heart of this project!

This, however, doesn't only support keys on an extra keyboard - it has a single keyboard mode too.

## Geting started

- Get [Autohotkey **2.0**](https://autohotkey.com/). Then, either
- go multi keyboard:
  1. get LuaMacros [here](http://www.hidmacros.eu/forum/viewtopic.php?f=10&t=241#p794)
  2. open `luaMacros.lua` with that
  3. launch `multiKeyboard.ahk`


- or use a single keyboard:
  1. launch `singleKeyboard.ahk`

You can try to use both at the same time, but be aware, problems might arise.

To modify the keys that this types, you'll need to get [Processing](processing.org/), and edit `generator/kbd.txt`. Then, after running `generator.pde` in Processing, the AHK files should be updated (you'll need to re-launch them though.)

This contains a box drawing character creator too, which uses a part of [MarkLodato's JavaScript Box Drawing Library](https://github.com/MarkLodato/js-boxdrawing) - press alt+Numpad5 (or just N5 on the 2nd keyboard) to enter the box drawing mode, then click N2/4/6/8 to add lines to the corresponding direction, and finish with another click on N5 (alt not required). Clicks on the corner numbers count for the two closest directions.
  
click count | line type | examples
:-:|:------------:|:--
1 | regular line | `╵│─┼`
2 | double line  | `╚╬╣`
3 | thick line  | `┣╋╸`