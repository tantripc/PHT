/*vietuni6.js
*/

// interface for HTML
//

function VNOff() { return 0; }

var disabled = false;
var typingMode = VNOff;
var theTyper = null;
var checkerror = 0;
var charmapID = 0;

// for HTML-call:
//------------------------

telexingVietUC = initTyper;
function setCharMap(mapID) { 
  charmapID = mapID; 
  if(theTyper) theTyper.charmap = initCharMap();
} 


function setTypingMode(mode) {
  switch (mode) {
     case 1: typingMode = telexTyping; break;
     case 2: typingMode = vniTyping; break;
     case 3: typingMode = viqrTyping; break;
     default: typingMode = VNOff;
  }
  if (theTyper) theTyper.typingMode = typingMode;
  if (disabled) return true;
  if (!document.all && !document.getElementById) {
     alert("Xin loi, trinh duyet web cua ban khong cho phep dung VietTyping.\n");
     disabled = true;  
  }
}

function convertAtOnce(txtarea) {
  if(!txtarea) return;
  if(!theTyper) theTyper = new CVietString("");
  txtarea.value = theTyper.doConvertIt(txtarea.value);
}
// end from HTML


function initCharMap() {
  switch (charmapID) {
     case 0: return new CVietUniCodeMap();
     case 1: return new CVietVniMap();
     case 2: return new CVietTCVNMap();
     case 3: return new CVietVISCIIMap();
     case 4: return new CVietVPSMap();
     default: return new CVietUniCodeMap();
  }
}

function initTyper(txtarea,evt) {
  if(!txtarea) return; 
  if (document.all) telexingVietUC = ieTyping; 
  else if (document.getElementById) telexingVietUC = ns6Typing;
  else telexingVietUC = VNOff;
}

// event & typing:
//------------------------

function fire (code) {
  if ((code > 40) || (code == 32)) return true;
  else return (checkerror = 0);
}

function ieTyping(txtarea,evt) {
  var c = event.keyCode;
  var curword= getCurrentWord(txtarea);
  if(!theTyper) theTyper = new CVietString(curword);
  else theTyper.setValue(curword);
  if (fire(c) && theTyper.typing()) replaceWord(txtarea, theTyper.value);
  if (c < 49 && theTyper.onEndWord()) replaceWord(txtarea, theTyper.value);
}

function ns6Typing(txtarea,evt) {
  var c = evt ? evt.keyCode: 50;
  if(!theTyper) theTyper = new CVietString(txtarea.value);
  else theTyper.setValue(txtarea.value);
  if ( fire(c) ) { if (theTyper.typing()) txtarea.value = theTyper.value; }
  if (c < 49 && theTyper.onEndWord()) txtarea.value = theTyper.value;
}


// for IE4+,5+: 
// Thanks to HaiNam, vietuni works in a multi-frame page now
//
function getCurrentWord(txtarea) {
  var caret = txtarea.document.selection.createRange();
  var backward = -8;
  do {
     var caret2 = caret.duplicate();
     caret2.moveStart("character", backward++);    
  } while (caret2.parentElement() != txtarea && backward <0);
  txtarea.curword = caret2.duplicate(); 
  return caret2.text;
}

function replaceWord(txtarea, newword) {
  txtarea.curword.text = newword;
  txtarea.curword.collapse(false);
}
// end IE-special

/////////////////////////////////
// end interface



// "class": CVietString
// 
function CVietString(str) {
  var tmp = new String(str);
  this.value = new String(tmp);
  this.charmap = initCharMap();
  this.caretpos = -1;
  this.changed = 0;

  this.setValue = setValue;
  this.typing = typing;
  this.typingMode = typingMode;
  this.telexDau = telexDau;
  this.telexAEOWD = telexAEOWD;
  this.findCharToChange = findCharToChange;
  this.doConvertIt = doConvertIt;
  this.onEndWord = onEndWord;
  return this;
}

function setValue(str) {
  var tmp =  new String(str);
  this.value = new String(tmp);
}


// The script might miss some events due to fast typing,
// and it can't do nothing to make the browser work faster.
// The solution is to build in a mechanism to check and correct
// errors right there where they seem possibly to appear. Long winded, 
// but it works (at least it reduces the error frequency nearly to 0), voila!
//

function typing() {
  this.changed = 0;
  var i = this.value.length-1;
  if (i <= 0) return 0;
  this.caretpos = i;
  if (checkerror) {
     var lastchar = this.value.charAt(this.caretpos);
     this.value = this.value.substring(0, this.caretpos--);
     this.typingMode();
     this.value += lastchar;
     if( this.changed ) { this.typing(); return (this.changed=1); }
     else { this.caretpos++; }
  } 
  checkerror = 1;
  this.typingMode();
  return this.changed;
}
 

function  telexTyping() {
  var ctrlchar = this.value.charAt(this.caretpos).toLowerCase();
  switch (ctrlchar)  {
    case 's': this.telexDau(1); break;  // s, S: sac
    case 'f': this.telexDau(2); break;  // f, F: huyen
    case 'j': this.telexDau(3); break;  // j, J: nang
    case 'r': this.telexDau(4); break;  // r, R: hoi
    case 'x': this.telexDau(5); break;  // x, X: nga
    case 'a': this.telexAEOWD(1); break;
    case 'e': this.telexAEOWD(2); break;
    case 'o': this.telexAEOWD(3); break;
    case 'w': this.telexAEOWD(4); break;
    case 'd': this.telexAEOWD(5); break;
    case 'z': this.telexDau(6); break;  // z, Z: xo'a da^'u
  }
}

function  vniTyping() {
  var ctrlchar = this.value.charAt(this.caretpos);
  switch (ctrlchar)  {
    case '1': this.telexDau(1); break;  // 1 -> sa('c
    case '2': this.telexDau(2); break;  // 2 -> huye^`n
    case '5': this.telexDau(3); break;  // 5 -> nang
    case '3': this.telexDau(4); break;  // 3 -> hoi
    case '4': this.telexDau(5); break;  // 4 -> nga~
    case '7': 
    case '8': this.telexAEOWD(4); break;  // 7,8 -> a(, o+, u+
    case '9': this.telexAEOWD(5); break;  // 9 -> dd
    case '6': this.telexAEOWD(1);         // 6 -> a^,e^ or  o^
              if(!this.changed) this.telexAEOWD(2);
              if(!this.changed) this.telexAEOWD(3); break;

    case '0': this.telexDau(6); break;  // 0 -> xoa dau
  }
}

// VIQR (VietNet) - Thanks to AnhDuc!
// This mode use some double-code keys -> difficult to make it work on all keyboards
// tested on German and US keyboards
//
function  viqrTyping() {
  var lastchar = this.value.charAt(this.caretpos);
  var prevc = this.value.charAt(this.caretpos-1); 
  if ((prevc=='\\') && ((lastchar=='?') || (lastchar=='.'))) {
    this.value= this.value.substring(0, this.caretpos-1)+ lastchar;
    checkerror = 0;
    return (this.changed = 1);
  }
  var ctrlchar = lastchar;
  var germanKB = (prevc == '´') || (prevc == '`') || (prevc == '^');
  if (germanKB) {
    this.value = this.value.substring(0, this.caretpos--);
    ctrlchar = prevc;
  }
  switch (ctrlchar)  {
    case '/' : case "'": case "´": this.telexDau(1); break;
    case '`': this.telexDau(2); break;
    case '.': this.telexDau(3); break;
    case '?': this.telexDau(4); break;
    case '~': this.telexDau(5); break;
    case '^': this.telexAEOWD(1);
              if(!this.changed) this.telexAEOWD(2);
              if(!this.changed) this.telexAEOWD(3); break;
    case '(': case '+': case '*': this.telexAEOWD(4); break;
    case 'd': case 'D': this.telexAEOWD(5); break;
    case '-': this.telexDau(6); break;
  }
  if (germanKB) {
    this.value += lastchar;
    if( this.changed ) { this.typing(); this.changed=1; }
  }
}


function onEndWord() {
  if (!this.charmap.vni) return false;
  var i = this.value.length-1, changed=false;
  while((i>0) && (this.value.charCodeAt(i) < 65)) --i;
  while((i>0) && (this.value.charCodeAt(i) > 32)) --i;
  var tmp = this.value.substring(0,i);
  while (i < this.value.length) {  
    var c = this.value.charCodeAt(i++);
    var c1 = c%256;      
    var c2 = (c-c1)/256;
    tmp += String.fromCharCode(c1);
    if(c2) { tmp += String.fromCharCode(c2); changed=1;}
  }
  this.value = tmp;
  return changed;   
}

function doConvertIt(txt) {
  var i = 0;
  this.value = "";
  while (i < txt.length) {
    this.value += txt.charAt(i++);
    this.typing();
  }
  return this.value;
}

//------------------------

function telexAEOWD(type) {
  var lastchar = this.value.charCodeAt(this.caretpos);
  var prevchar = this.value.charCodeAt(this.caretpos-1);  
  var telex = this.charmap.getTelexAEOWD (prevchar, type);
  this.changed =  telex[0];
  if (!this.changed) return;
  this.value= this.value.substring(0,this.caretpos-1)+ String.fromCharCode(telex[1]);
  if (!telex[2]) this.value += String.fromCharCode(lastchar);
}


function telexDau( type ) {
  var tochangepos = this.findCharToChange(); 
  if (tochangepos < 0) return;
  var telex = this.charmap.getTelexDau(this.value.charCodeAt(tochangepos), type);
  if (!(this.changed = telex[0])) return;
  var tmp1 = this.value.substring(0,tochangepos);
  var tmp2 = this.value.substring(tochangepos+1, this.value.length);
  this.value = tmp1 + String.fromCharCode(telex[1]) + tmp2;
  if (telex[2]) this.value = this.value.substring(0, this.value.length-1);
}


function findCharToChange() {
  var lastindex = this.caretpos;
  var index = lastindex-1;

  var i = this.value.charCodeAt(index); 
  while( this.charmap.vietvowels.indexOf(i) < 0 ) {
     if ((i < 65) || (index <= lastindex-3) || (index <= 0)) return -1;
     i = this.value.charCodeAt(--index);
  }

  if (index == 0) return index;

  if (index == lastindex-3) { 
    var tmp = this.value.substring(index+1,lastindex);
    tmp = tmp.toLowerCase();
    if ((tmp != "ng") && (tmp != "ch") && (tmp != "nh")) index = -1;
    return index;  
  }
  if (index == lastindex-2) { 
    var regexp = "bdfghjklqrs";
    var c = this.value.charAt(index+1).toLowerCase();  
    if( (c >= 'v') || (regexp.indexOf(c) >= 0)) index = -1;
    return index;
  }
  var c = this.value.charAt(index);
  var prevc = this.value.charAt(index-1);  
  var regexp = "uUyYoOiIaA";

  if ( (this.charmap.vietvowels.indexOf(prevc.charCodeAt(0)) >= 0) && 
         (regexp.indexOf(c) >= 0) ) {
     --index; 
     if ( ((prevc=='o') || (prevc=='O')) && ((c=='a') || (c=='A')) ) ++index;
     if ( ((prevc=='u') || (prevc=='U')) && ((c=='y') || (c=='Y')) ) ++index;
     c = prevc;  prevc = this.value.charAt(index-1);
     if ( ((prevc=='q') || (prevc=='Q')) && ((c=='u') || (c=='U')) ) ++index;
     if ( ((prevc=='g') || (prevc=='G')) && ((c=='i') || (c=='I')) ) ++index;
  }
  return index;
}
// end vietString Obj


///////////////////////////////

Array.prototype.indexOf = function indexOf(code) {
  var ind = 0;
  while ((code != this[ind]) && (ind < this.length)) ++ind;
  if (ind == this.length) ind = -1;
  return ind;
}

// character-map template
// optimized code, not easy to read :-)
//
function CVietCharMap() { return this; }

CVietCharMap.prototype.vietvowels = new Array(144);
CVietCharMap.prototype.vietd = new Array(4);
CVietCharMap.prototype.getTelexAEOWD = getTelexAEOWD;
CVietCharMap.prototype.getTelexDau = getTelexDau;


function getTelexDau(code, type) {
  var result = new Array(0,0,0);
  var ind = this.vietvowels.indexOf(code);
  if (ind < 0) return result;
  var accented = (ind < 24)? 0: 1;
  var ind_i = ind % 24;
  var charset = (type == 6)? 0 : type;

  if ((type == 6) && !accented) return result;   
  if (accented & (charset*24 + ind_i == ind)) charset = 0;
  else result[2] = 1;

  result[1] = this.vietvowels[charset*24 + ind_i]; 
  result[0] = 1;
  checkerror = 0; 
  return result;
}

function getTelexAEOWD(code, type) {
  var result = new Array(0,0,0); 
  var newind = -1;
  var ind = 0;
  while ((ind < 24) && (code != this.vietvowels[ind])) { ind++; }
  if ((ind < 24) && (type == 5)) return result;
  switch (type) {
    case 1: 
      if ((ind==0) || (ind==12)) newind=ind+1;
      else if ((ind==1) || (ind==13)) newind= ind-1;
      break;
    case 2:
      if ((ind==3) || (ind==15)) newind=ind+1;
      else if ((ind==4) || (ind==16)) newind=ind-1;
      break;
    case 3: 
      if ((ind==6) || (ind==18)) newind=ind+1;
      else if ((ind==7) || (ind==19)) newind=ind-1;
      break;
    case 4:
      if ((ind==0) || (ind==12) || (ind==6) || (ind==18)) newind=ind+2;
      else if ((ind==2) || (ind==14) || (ind==8) || (ind==20)) newind=ind-2;
      else if ((ind==9) || (ind==21)) newind=ind+1;
      else if ((ind==10) || (ind==22)) newind=ind-1;
      break;
    case 5: 
      ind = 3; 
      while (this.vietd[ind] != code) { if (--ind < 0) return result; }
      if ((ind==0) || (ind==2)) newind=ind+1;
      else if ((ind==1) || (ind==3)) newind=ind-1;
      break;
  }
  if(newind >= 0) {
    result[0] = 1; 
    result[1] = (type == 5)? this.vietd[newind] : this.vietvowels[newind]; 
    if(newind > ind) { result[2] = 1; }
    checkerror = 0; 
  }
  return result;
}
// end CVietCharMap prototype

///////////////////////////////


// class: CVietUniCodeMap (child of CVietCharMap)
//
function CVietUniCodeMap() {
  var map = new CVietCharMap();

  // vietvowels: [a, a^, a(, e, e^, i, o, o^, o+, u, u+, y, A,...,Y,a'..a`..a...a?..a~]
  map.vietvowels = new Array(  
    97, 226, 259, 101, 234, 105, 111, 244, 417, 117, 432, 121, 
    65, 194, 258, 69, 202, 73, 79, 212, 416, 85, 431, 89,
    225, 7845, 7855, 233, 7871, 237, 243, 7889, 7899, 250, 7913, 253, 
    193, 7844, 7854, 201, 7870, 205, 211, 7888, 7898, 218, 7912, 221,
    224, 7847, 7857, 232, 7873, 236, 242, 7891, 7901, 249, 7915, 7923,
    192, 7846, 7856, 200, 7872, 204, 210, 7890, 7900, 217, 7914, 7922,
    7841, 7853, 7863, 7865, 7879, 7883, 7885, 7897, 7907, 7909, 7921, 7925,
    7840, 7852, 7862, 7864, 7878, 7882, 7884, 7896, 7906, 7908, 7920, 7924,
    7843, 7849, 7859, 7867, 7875, 7881, 7887, 7893, 7903, 7911, 7917, 7927,
    7842, 7848, 7858, 7866, 7874, 7880, 7886, 7892, 7902, 7910, 7916, 7926,
    227, 7851, 7861, 7869, 7877, 297, 245, 7895, 7905, 361, 7919, 7929,
    195, 7850, 7860, 7868, 7876, 296, 213, 7894, 7904, 360, 7918, 7928 );

  map.vietd = new Array(100, 273, 68, 272);

  return map;
}

function CVietVniMap() {
var map = new CVietCharMap();

map.vietvowels = new Array(
 97, 57953, 60001, 101, 57957, 105, 111, 57967, 244, 117, 246, 121,
 65, 49729, 51777, 69, 49733, 73, 79, 49743, 212, 85, 214, 89,
 63841, 57697, 59745, 63845, 57701, 237, 63855, 57711, 63988, 63861, 63990, 63865,
 55617, 49473, 51521, 55621, 49477, 205, 55631, 49487, 55764, 55637, 55766, 55641,
 63585, 57441, 59489, 63589, 57445, 236, 63599, 57455, 63732, 63605, 63734, 63609,
 55361, 49217, 51265, 55365, 49221, 204, 55375, 49231, 55508, 55381, 55510, 55385,
 61281, 58465, 60257, 61285, 58469, 242, 61295, 58479, 61428, 61301, 61430, 238,
 53057, 50241, 52033, 53061, 50245, 210, 53071, 50255, 53204, 53077, 53206, 206,
 64353, 58721, 64097, 64357, 58725, 230, 64367, 58735, 64500, 64373, 64502, 64377,
 56129, 50497, 55873, 56133, 50501, 198, 56143, 50511, 56276, 56149, 56278, 56153,
 62817, 58209, 64609, 62821, 58213, 243, 62831, 58223, 62964, 62837, 62966, 62841,
 54593, 49985, 56385, 54597, 49989, 211, 54607, 49999, 54740, 54613, 54742, 54617);

map.vietd = new Array(100, 241, 68, 209);
map.vni = 1;

return map;
}

function CVietTCVNMap() {
var map = new CVietCharMap();
map.vietvowels = new Array(
 97, 169, 168, 101, 170, 105, 111, 171, 172, 117, 173, 121, 
 65, 162, 161, 69, 163, 73, 79, 164, 165, 85, 166, 89,
 184, 202, 190, 208, 213, 221, 227, 232, 237, 243, 248, 253,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 181, 199, 187, 204, 210, 215, 223, 229, 234, 239, 245, 250,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 185, 203, 198, 209, 214, 222, 228, 233, 238, 244, 249, 254,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 182, 200, 188, 206, 211, 216, 225, 230, 235, 241, 246, 251,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 183, 201, 189, 207, 212, 220, 226, 231, 236, 242, 247, 252,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

map.vietd = new Array(100, 174, 68, 167);
return map;
}

function CVietVISCIIMap() {
var map = new CVietCharMap();

map.vietvowels = new Array(
97, 226, 229, 101, 234, 105, 111, 244, 189, 117, 223, 121,
65, 194, 197, 69, 202, 73, 79, 212, 180, 85, 191, 89,
225, 164, 237, 233, 170, 237, 243, 175, 190, 250, 209, 253,
193, 8222, 129, 201, 352, 205, 211, 143, 8226, 218, 186, 221,
224, 165, 162, 232, 171, 236, 242, 176, 182, 249, 215, 207,
192, 8230, 8218, 200, 8249, 204, 210, 144, 8211, 217, 187, 376,
213, 167, 163, 169, 174, 184, 247, 181, 254, 248, 241, 220,
8364, 8225, 402, 8240, 381, 732, 353, 8220, 8221, 382, 185, 220,
228, 166, 198, 235, 172, 239, 246, 177, 183, 252, 216, 214,
196, 8224, 198, 203, 338, 8250, 8482, 8216, 8212, 339, 188, 214,
227, 231, 199, 168, 173, 238, 245, 178, 222, 251, 230, 219,
195, 231, 199, 710, 141, 206, 245, 8217, 179, 157, 255, 219);

map.vietd = new Array(100, 240, 68, 208);
return map;
}


function CVietVPSMap() {
var map = new CVietCharMap();

map.vietvowels = new Array(
97, 226, 230, 101, 234, 105, 111, 244, 214, 117, 220, 121,
65, 194, 710, 69, 202, 73, 79, 212, 247, 85, 208, 89,
225, 195, 161, 233, 8240, 237, 243, 211, 167, 250, 217, 353,
193, 402, 141, 201, 144, 180, 185, 8211, 157, 218, 173, 221,
224, 192, 162, 232, 352, 236, 242, 210, 169, 249, 216, 255,
0, 8222, 0, 215, 8220, 181, 188, 8212, 0, 168, 175, 178,
229, 198, 165, 203, 338, 206, 8224, 182, 174, 248, 191, 339,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 339,
228, 196, 163, 200, 8249, 204, 213, 176, 170, 251, 186, 8250,
129, 8230, 163, 222, 8221, 183, 189, 732, 376, 209, 177, 8250,
227, 197, 164, 235, 205, 239, 245, 8225, 171, 219, 187, 207,
8218, 197, 164, 254, 8226, 184, 245, 8482, 166, 172, 0, 207);

map.vietd = new Array(100, 199, 68, 241);
return map;
}

// end vietuni.js