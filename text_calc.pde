//String[] fontList = PFont.list(); //To list all fonts available on system

float geometry;

//font stuff
PFont titleFont,levelFont, mediumFont, xoFont, playerFont, scoreFont;
String title = "Tic-Tac-Toe", easy="easy", medium="medium", hard="hard", P1="P1:", P2="P2:", X="X", o="O";
float titleWidth, titleHeight , easyWidth, easyHeight, mediumWidth, mediumHeight, hardWidth, hardHeight, player1Height, player1Width, player2Width,player2Height;

//tic-tac-toe board
float x1width, x1Height, o1width, o1Height, x2width, x2Height, o2width, o2Height, x3width, x3Height, o3width, o3Height;
float x4width, x4Height, o4width, o4Height, x5width, x5Height, o5width, o5Height, x6width, x6Height, o6width, o6Height;
float x7width, x7Height, o7width, o7Height, x8width, x8Height, o8width, o8Height, x9width, x9Height, o9width, o9Height;

String footer; 
float footerY;

void textSetup() {
  
//title
 title= "Tic-Tac-Toe";
 titleFont = createFont("stencil", height*24/48);
 titleWidth = width*16/24;
 titleHeight = height*4/24;

//easy
 easy = "easy";
 levelFont = createFont ("stencil", height*1/16);
 easyWidth = width*1/4;
 easyHeight= height*3/32;
 
//medium
medium = "medium";
mediumFont = createFont ("stencil", height*1/16);
mediumWidth = width*1/4;
mediumHeight = height*1/12;

//hard
hard = "hard";
levelFont = createFont ("stencil", height*1/16);
hardWidth=width*1/4;
hardHeight=height*3/12;

//P1
P1 = "P1:X";
playerFont = createFont("ravie", height*4/48);
player1Width = width*8/48;
player1Height = height*3/24;

//P2
P2 = "P2:O";
playerFont = createFont("ravie", height*4/48);
player2Width = width*8/48;
player2Height = height*3/24;

//X block 1
X = "X";
xoFont = createFont ("harrington", height*6/48);
x1width = width*4/24;
x1Height = height*4/24;

//O block 1
o = "O";
xoFont = createFont ("harrington", height*6/48);
o1width = width*4/24;
o1Height = height*4/24;

//X block 2
x2width = width*4/24;
x2Height = height*4/24;

//O block 2
o2width = width*4/24;
o2Height = height*4/24;

//X block 3
x3width = width*4/24;
x3Height = height*4/24;

//O block 3
o3width = width*4/24;
o3Height = height*4/24;

//X block 4
x4width = width*4/24;
x4Height = height*4/24;

//O block 4
o4width = width*4/24;
o4Height = height*4/24;

//X block 5
x5width = width*4/24;
x5Height = height*4/24;

//O block 5
o5width = width*4/24;
o5Height = height*4/24;

//X block 6
x6width = width*4/24;
x6Height = height*4/24;

//O block 6
o6width = width*4/24;
o6Height = height*4/24;

//X block 7
x7width = width*4/24;
x7Height = height*4/24;

//O block 7
o7width = width*4/24;
o7Height = height*4/24;

//X block 8
x8width = width*4/24;
x8Height = height*4/24;

//O block 8
o8width = width*4/24;
o8Height = height*4/24;

//X block 9
x9width = width*4/24;
x9Height = height*4/24;

//O block 9
o9width = width*4/24;
o9Height = height*4/24;

}
//Exemplar VOID with Parameters
void textDraw(String string, PFont font, float height, color ink, int alignHorizontal, int alignVertical, float rectX, float rectY, float rectWidth, float rectHeight) {
 println(string);
  float fontSize = height;
  fill(ink); //Blue Ink, copied from Color Selector
  textAlign (alignHorizontal, alignVertical); //Align X&Y, see Processing.org / Reference
  //Values: LEFT | CENTER | RIGHT & TOP | CENTER | BOTTOM | BASELINE

  //Reference to Text Calculator
  println(string.length());
  if (string.length() >= 13) { //Number changes depending on geometry ratio (width/height)
    fontSize = textCalculator(height, string, rectWidth);
  } else {
    //Catch for string less than 13 characters
    fontSize = fontSize * 0.05; //
  }
 
 
  textFont(font, fontSize); //Change the number until it fits, largest font sizetextFont(titleFont, titleFontSize); //Change the number until it fits, largest font size //titleFontSize
  text(string, rectX, rectY, rectWidth, rectHeight);
  fill(255); //Reset to white for rest of the program
}

//Exemplar RETURN with Parameters
float textCalculator(float size, String string, float rectWidth) {
  float i = 1;
  textSize(size); //For textWidth Sizing
  while (textWidth(string) > rectWidth) {
    size = size * i;
    textSize (size);
    i = i - 0.0001;
  }
  return size; //Purpose of Calculator
}
