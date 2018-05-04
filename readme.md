# SOGL & Canvas keyboard

..This is not limited to these languages only though - go in `generator/kbd.txt` and modify as you like.

The LUA macros part of this is mostly taken from Tarans [video on Linus Tech Tips](https://www.youtube.com/watch?v=Arn8ExQ2Gjg), and the code is taken from [here](https://github.com/TaranVH/2nd-keyboard/tree/master/LUAMACROS). Go thank him for the heart of this project!

This, however, doesn't only support keys on an extra keyboard - it has a single keyboard mode too.

## Geting started

### Linux:
Note that the Linux version is still in development, only has the `alt+` mode and is very slow and horrible, but it (kind of) works.
- install `xclip`, `xbindkeys` and `xdotool`
- run the `.sh` file of the language you want.

### Windows:

- Get [Autohotkey **2.0**](https://autohotkey.com/). Then, either
- go multi keyboard:
  1. get LuaMacros [here](http://www.hidmacros.eu/forum/viewtopic.php?f=10&t=241#p794)
  2. open `luaMacros.lua` with that
  3. launch one of the `multiKeyboard.ahk` files


- or use a single keyboard:
  1. launch one of the `singleKeyboard.ahk` files

You can try to use both at the same time, but be aware, problems might arise.

To modify the keyboard layouts, you'll need to get [Processing](processing.org/), and edit `generator/kbd.txt`. Then, after running `generator.pde` in Processing, the files should be updated (you'll need to re-launch them though.)

The Windows version contains a box drawing character creator, which uses a part of [MarkLodato's JavaScript Box Drawing Library](https://github.com/MarkLodato/js-boxdrawing) - press alt+Numpad5 (or just Numpad5 if on the 2nd keyboard) to enter the box drawing mode, then click Numpad2/4/6/8 to add lines to the corresponding direction, and finish with another click on Numpad5 (alt not required). Clicks on the corner numbers count for the two closest directions.

### examples:

click count | line type | examples
:-:|:------------:|:--
1 | regular line | `╵│─┼`
2 | double line  | `╚╬╣`
3 | thick line  | `┣╋╸`