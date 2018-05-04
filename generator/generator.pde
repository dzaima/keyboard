String linuxVersion = "application.linux64"; // either, application.linux64, application.linux32, application.linux-arm64, application.linux-armv6hf
void setup() {
  String[] langNames = {"SOGL", "Canvas"};
  for (String langName : langNames) {
    String outMulti = "\ufeff"+join(loadStrings("defaultMulti.ahk"), "\n");
    String outLinux = join(loadStrings("default.xbindkeysrc"), "\n");
    String outSingle = "\ufeff"+join(loadStrings("defaultSingle.ahk"), "\n");
    StringList charReps = new StringList(loadStrings("extraHotkeys.txt"));
    String[] kbdMap = loadStrings("kbd.txt");
    String[] cmap = new String[17];
    String[] map = null;
    for (int i = 0; i < kbdMap.length; i++) {
      boolean parse = false;
      if (kbdMap[i].equals("MAP "+langName) || (parse = kbdMap[i].equals("PARSING"))) {
        i++;
        for (int j = 0; j < 17; j++) {
          cmap[j] = kbdMap[j+i];
        }
        //current mapping line
        int cml = i+17;
        HashMap<String, String> longerVersions = new HashMap<String, String>();
        HashMap<String, String> longerVersionsLinux = new HashMap<String, String>();
        while (kbdMap[cml].length() > 0) {
          String[] cline = split(kbdMap[cml], ":");
          if (cline.length == 2) {
            String[] versions = split(cline[1], "|");
            longerVersions.put(cline[0], versions[0]);
            longerVersionsLinux.put(cline[0], versions[1]);
          }
          cml++;
        }
        if (parse) {
          for (int j = 1; j < 17; j+= 3) {
            String cline = cmap[j-1];
            for (int k = 0; k < cline.length(); k++) {
              String nline = cmap[j];
              if (cline.charAt(k) != ' ') {
                String name = cline.charAt(k) +""+ cline.charAt(k+1) + nline.charAt(k) + nline.charAt(k+1);
                String nameLinux = cline.charAt(k) +""+ cline.charAt(k+1) + nline.charAt(k) + nline.charAt(k+1);
                boolean shortened = false;
                if (name.endsWith("!")) {
                  while (name.endsWith("!")) name = name.substring(0, name.length()-1);
                  nameLinux = name;
                  shortened = true;
                }
                if (name.startsWith("N")) {
                  nameLinux = "KP_"+name.substring(1);
                  name = "Numpad"+name.substring(1);
                } else if (!shortened) {
                  if (name.matches("(.)\\1{3}")) {
                    name = name.charAt(0)+"";
                    nameLinux = name;
                    //nameLinux = name.charAt(0)>='a' && name.charAt(0)<='z'? name.toUpperCase() : name;
                  } else {
                    nameLinux = longerVersionsLinux.get(name);
                    name = longerVersions.get(name);
                  }
                }
                for (String[] convs : new String[][]{{map[j-1].charAt(k)+"", ""}, {map[j-1].charAt(k+1)+"", "+"}, {map[j].charAt(k)+"", "^"}, {map[j].charAt(k+1)+"", "!"}}) {
                  if (!convs[0].equals("#")) charReps.append(convs[1] + name + " \"" + convs[0].replace("\"", "`\"")+"\"");
                }
                for (String[] convs : new String[][]{{map[j-1].charAt(k)+"", ""}, {map[j-1].charAt(k+1)+"", "Shift + "}, {map[j].charAt(k)+"", "Control + "}, {map[j].charAt(k+1)+"", "Control + Shift + "}}) {
                  if (!convs[0].equals("#")) {
                    String ks = "Release + Mod1 + " + convs[1] + nameLinux;
                    String res = "'" + convs[0].replace("'", "\'") + "'";
                    String robotPath = dataPath("../../robot/"+linuxVersion+"/robot");
                    String command = "xdotool keyup alt; echo -n " + res + " | xclip -selection clipboard; xdotool key ctrl+v";
                    //command = "xdotool keyup alt; xdotool type " + res;
                    //outLinux+= "\"" + robotPath + " " + res + "\"\n " + ks + "\n";
                    outLinux+= "\"" + command + "\"\n " + ks + "\n";
                    //outLinux+= "\"xset r off; xdotool type "+res+"; xset r on;\"\n " + ks + "\n";
                    //"\"xset r off; xdotool keyup 7 type --clearmodifiers --window 0 '"+res+"'; xset r on; xdotool keyup alt\"\n " + ks + "\n";
                  }
                }
                k+=1;
              }
            }
          }
        }
        map = cmap.clone();
      }
    }

    //print(charReps);
    for (String s : charReps) {
      String[] data = s.split(" ");
      if (data.length > 1) {
        String str = data[1].length()==1? data[1] : data[1].replace('▓', ' ');

        outMulti+= "\nelse if (key = \"" + data[0].replaceAll("^MK", "").replace("`", "``") + "\")\n  send " + str + "";

        if (!data[0].matches("MK.+")) { 
          outSingle+= "\n!" + data[0].replace("!", "+^") + "::\n  send " + str + "\nreturn";
          //change ^ to `<^>!` to use altGr only in single keyboard mode
        }
      }
    }


    String fpathMulti = "../multiKeyboard"+langName+".ahk";
    String fpathSingle = "../singleKeyboard"+langName+".ahk";
    String fnameLinux = langName+".xbindkeysrc";
    String fpathLinux = "../"+langName+".xbindkeysrc";
    saveStrings(fpathMulti, new String[]{outMulti});
    saveStrings(fpathSingle, new String[]{outSingle});
    saveStrings(fpathLinux, new String[]{outLinux});
    saveStrings("../"+langName+".sh", new String[]{"xbindkeys -f " + fnameLinux});
    try {
      Runtime r = Runtime.getRuntime();
      String[] commands = {"chmod", "+x", fnameLinux+".sh"};
      Process p = r.exec(commands);
      p.waitFor();
    } 
    catch (Exception e) {
      e.printStackTrace();
    }
  }
  exit();
}
