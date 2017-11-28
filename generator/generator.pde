void setup() {
  String outMulti = "\ufeff"+join(loadStrings("defaultMulti.ahk"), "\n");
  String outSingle = "\ufeff"+join(loadStrings("defaultSingle.ahk"), "\n");
  StringList charReps = new StringList(loadStrings("extraHotkeys.txt"));
  String[] kbdMap = loadStrings("kbd.txt");
  String[] cmap = new String[17];
  String[] map = null;
  for (int i = 0; i < kbdMap.length; i++) {
    boolean parse = false;
    if (kbdMap[i].equals("MAP") || (parse = kbdMap[i].equals("PARSING"))) {
      i++;
      for (int j = 0; j < 17; j++) {
        cmap[j] = kbdMap[j+i];
      }
      //current mapping line
      int cml = i+17;
      HashMap<String, String> longerVersions = new HashMap<String, String>();
      while (kbdMap[cml].length() > 0) {
        String[] cline = split(kbdMap[cml], ":");
        if (cline.length == 2) {
          longerVersions.put(cline[0], cline[1]);
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
              boolean shortened = false;
              if (name.endsWith("!")) {
                while (name.endsWith("!")) name = name.substring(0, name.length()-1);
                shortened = true;
              }
              if (name.startsWith("N")) {
                name = "Numpad"+name.substring(1);
              } else if (!shortened) {
                if (name.matches("(.)\\1{3}")) {
                  name = name.charAt(0)+"";
                } else {
                  //if (name.equals("abcd")) println(longerVersions);
                  name = longerVersions.get(name);
                }
              }
              for (String[] convs : new String[][]{{map[j-1].charAt(k)+"", ""}, {map[j-1].charAt(k+1)+"", "+"}, {map[j].charAt(k)+"", "^"}, {map[j].charAt(k+1)+"", "!"}}) {
                if (!convs[0].equals("#")) charReps.append(convs[1] + name + " " + convs[0]);
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
  boolean first = true;
  for (String s : charReps) {
    String[] data = s.split(" ");
    if (data.length > 1) {
      String str = data[1].length()==1? data[1] : data[1].replace('▓', ' ');
      
      outMulti+= "\n" + (first? "" : "else ") + "if (key = \"" + data[0].replaceAll("^MK","") + "\")\n  send, " + str;
      
      if (!data[0].matches("MK.+")) { 
        outSingle+= "\n!" + data[0].replace("!", "+^") + "::\n  send, " + str + "\nreturn";
              //change ^ to `<^>!` to use altGr only in single keyboard mode
      }
    }
    first = false;
  }
  
  
  outMulti+= "\nreturn\nLaunch_Mail::\n  Send, ^!b\nreturn";
  String fnameMulti = "../multiKeyboard.ahk";
  String fnameSingle = "../singleKeyboard.ahk";
  saveStrings(fnameMulti, new String[]{outMulti});
  saveStrings(fnameSingle, new String[]{outSingle});
  exit();
}