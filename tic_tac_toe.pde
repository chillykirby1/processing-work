//currently 2 player instead of player vs ai

Boolean[] noDraw = new Boolean[9];

void setup() {
  
  //used for text in text_calc
  textSetup();
  
  size(600, 600);
  //fullScreen();
  println("Screen Width:", displayWidth, "\tHeight:", displayHeight);
  println("Starting of Console");

//for noDraw[]
  for(int i=0; i < noDraw.length; i++) {
    noDraw[i] = false;
  }
   
String [] fontList = PFont.list(); // To list all fonts available on system
  printArray(fontList); // For listing all possible fonts to choose
  xoFont = createFont ("harrington", height*6/48);
  scoreFont = createFont ("vivaldii", height*4/48);
  
  background(255);
  
  //tic tac toe board
  line(width*1/4, 0, width*1/4, height);
  line(width*2/4, height*1/4, width*2/4, height);
  line(width*3/4, height*1/4, width*3/4, height);
  
  //side bars
  line(0, height*1/4, width, height*1/4);
  line(width*1/4, height*1/2, width, height*1/2);
  line(width*1/4, height*3/4, width, height*3/4);
  line(0, height*5/8, width*1/4, height*5/8);
  
  //Easy, Medium, hard Buttons
  line(0, height*1/12, width*1/4, height*1/12);
  line(0, height*2/12, width*1/4, height*2/12);
  fill(0); //INK
  
  //easy
  textDraw(easy, levelFont, height, regularButton, CENTER, CENTER, width*0, height*0, easyWidth, easyHeight);
  
  //medium
  textDraw(medium, mediumFont, height, regularButton, CENTER, CENTER, width*0, height*1/12, mediumWidth, mediumHeight);
  
  //hard
  textDraw(hard, levelFont, height, regularButton, CENTER, CENTER, width*0, height*1/12, hardWidth, hardHeight);
  
  fill(255); //for rest of code
  
  //Buttons
  rect(width*7/24, height*7/24, width*4/24, height*4/24); //box 1
  rect(width*13/24, height*7/24, width*4/24, height*4/24); //box 2
  rect(width*19/24, height*7/24, width*4/24, height*4/24); //box 3
  rect(width*7/24, height*13/24, width*4/24, height*4/24); //box 4
  rect(width*13/24, height*13/24, width*4/24, height*4/24); //box 5
  rect(width*19/24, height*13/24, width*4/24, height*4/24); //box 6
  rect(width*7/24, height*19/24, width*4/24, height*4/24); //box 7
  rect(width*13/24, height*19/24, width*4/24, height*4/24); //box 8
  rect(width*19/24, height*19/24, width*4/24, height*4/24); //box 9
  
  
  //Scoreboard
  
  //P1
  rect(width*1/24, height*7/24, width*4/24, height*3/24);
    fill(0);
  textDraw(P1, playerFont, height, black, CENTER, CENTER, width*1/24, height*14/48, player1Width, player1Height);
  
  //points for P1
  rect(width*1/24, height*11/24, width*4/24, height*3/24);
  
  //P2
  rect(width*1/24, height*16/24, width*4/24, height*3/24);
  textDraw(P2, playerFont, height, black, CENTER, CENTER, width*1/24, height*16/24, player2Width, player2Height);
  
  rect(width*1/24, height*20/24, width*4/24, height*3/24); //points for P2
  
  //title (not actual title just placement holder)
  rect(width*7/24, height*1/24, width*16/24, height*4/24);
 
  //title
  textDraw(title, titleFont, height, black, CENTER, CENTER, width*7/24, height*1/24, titleWidth, titleHeight);
}

//color
color black = #000000;
color red = #FF0000;
color white = #FFFFFF;
color buttonColor = white;
color regularButton = black;
color hoverOverButton = red;

//buttons
void draw() {
    textSetup();
  println ("Mousex:", mouseX, "\tMouseY:", mouseY);
  
  //hover over effect for quit button
  if (mouseX>width*31/32 && mouseX<width && mouseY>0 && mouseY<height*2/48) {
    fill(hoverOverButton);
    rect(width*31/32, height*0/32, width*2/48, height*2/48);
  } else {
    fill(regularButton);
    rect(width*31/32, height*0/32, width*2/48, height*2/48);
 
  }
  
  //hover for easy
    if (mouseX<width*1/4 && mouseX<width && mouseY>0 && mouseY<height*1/12) {
    fill(hoverOverButton);
    rect(0, 0, width*1/4, height*1/12);
    fill(regularButton);
 textDraw(easy, levelFont, height, regularButton, CENTER, CENTER, width*0, height*0, easyWidth, easyHeight);
  
  } else {
    fill(buttonColor);
    rect(0, 0, width*1/4, height*1/12);
    fill(regularButton);
    textDraw(easy, levelFont, height, regularButton, CENTER, CENTER, width*0, height*0, easyWidth, easyHeight);
  }
  
  //hover for medium
    if (mouseX<width*1/4 && mouseX<width && mouseY>height*1/12 && mouseY<height*2/12) {
    fill(hoverOverButton);
    rect(0, height*1/12, width*1/4, height*1/12);
  textDraw(medium, mediumFont, height, regularButton, CENTER, CENTER, width*0, height*1/12, mediumWidth, mediumHeight);
  } else {
    fill(buttonColor);
    rect(0, height*1/12, width*1/4, height*1/12);
  textDraw(medium, mediumFont, height, regularButton, CENTER, CENTER, width*0, height*1/12, mediumWidth, mediumHeight);
  }
  
  //hover for hard
      if (mouseX<width*1/4 && mouseX<width && mouseY>height*2/12 && mouseY<height*3/12) {
    fill(hoverOverButton);
    rect(0, height*2/12, width*1/4, height*1/12);
    textDraw(hard, levelFont, height, regularButton, CENTER, CENTER, width*0, height*1/12, hardWidth, hardHeight);
  } else {
    fill(buttonColor);
    rect(0, height*2/12, width*1/4, height*1/12);
    textDraw(hard, levelFont, height, regularButton, CENTER, CENTER, width*0, height*1/12, hardWidth, hardHeight);
  }

}

void mouseClicked () {
  
  //exit press
  if (mouseX>width*15/16 && mouseX<width && mouseY>0 && mouseY<height*1/16) {
    exit();
  }
  
  //button for box 1 (X)
  if (noDraw[0] == false && mouseX>width*7/24 && mouseX<width*11/24 && mouseY>height*7/24 && mouseY<height*11/24 && (mouseButton == LEFT)){
   noDraw[0] = true;
   boardPiece[0] = "X"; 
  textDraw(X, xoFont, height*2.5, regularButton, CENTER, CENTER, width*7/24, height*7/24, x1width, x1Height);
  }
  
  //button for box 1 (O)
    if (noDraw[0] == false && mouseX>width*7/24 && mouseX<width*11/24 && mouseY>height*7/24 && mouseY<height*11/24 && (mouseButton == RIGHT)){
    noDraw[0] = true;
    boardPiece[0] = "O"; 
 textDraw(o, xoFont, height*2.5, regularButton, CENTER, CENTER, width*7/24, height*7/24, o1width, o1Height);
  }
  
  //button for box 2 (X)
      if (noDraw[1] == false && mouseX>width*13/24 && mouseX<width*18/24 && mouseY>height*7/24 && mouseY<height*11/24 && (mouseButton == LEFT)){
   noDraw[1] = true;
   boardPiece[1] = "X"; 
  textDraw(X, xoFont, height*2.5, regularButton, CENTER, CENTER, width*13/24, height*7/24, x2width, x2Height);
  }
  
  //button for box 2 (O)
        if (noDraw[1] == false && mouseX>width*13/24 && mouseX<width*18/24 && mouseY>height*7/24 && mouseY<height*11/24 && (mouseButton == RIGHT)){
    noDraw[1] = true;
    boardPiece[1] = "O"; 
  textDraw(o, xoFont, height*2.5, regularButton, CENTER, CENTER, width*13/24, height*7/24, o2width, o2Height);
  }
  
  //button for box 3 (X)
         if (noDraw[2] == false && mouseX>width*19/24 && mouseX<width*23/24 && mouseY>height*7/24 && mouseY<height*11/24 && (mouseButton == LEFT)){
     noDraw[2] = true;
     boardPiece[2] = "X"; 
  textDraw(X,xoFont, height*2.5, regularButton, CENTER, CENTER, width*19/24, height*7/24, x3width, x3Height);
  }
  
  //button for box 3 (O)
            if (noDraw[2] == false && mouseX>width*19/24 && mouseX<width*23/24 && mouseY>height*7/24 && mouseY<height*11/24 && (mouseButton == RIGHT)){
  noDraw[2] = true;
  boardPiece[2] = "O"; 
  textDraw(o, xoFont, height*2.5, regularButton, CENTER, CENTER, width*19/24, height*7/24, o3width, o3Height);
  }
  
  //button for box 4 (X)
            if (noDraw[3] == false && mouseX>width*7/24 && mouseX<width*11/24 && mouseY>height*13/24 && mouseY<height*17/24 && (mouseButton == LEFT)){
                noDraw[3] = true;
                boardPiece[3] = "X"; 
  textDraw(X, xoFont, height*2.5, regularButton, CENTER, CENTER, width*7/24, height*13/24, x4width, x4Height);
  }
  
  //button for box 4 (O)
              if (noDraw[3] == false && mouseX>width*7/24 && mouseX<width*11/24 && mouseY>height*13/24 && mouseY<height*17/24 && (mouseButton == RIGHT)){
              noDraw[3] = true;
              boardPiece[3] = "O"; 
  textDraw(o, xoFont, height*2.5, regularButton, CENTER, CENTER, width*7/24, height*13/24, o4width, o4Height);
  }
  
  //buton for box 5 (X)
              if (noDraw[4] == false &&mouseX>width*13/24 && mouseX<width*17/24 && mouseY>height*13/24 && mouseY<height*17/24 && (mouseButton == LEFT)){
                noDraw[4] = true;
                boardPiece[4] = "X"; 
  textDraw(X, xoFont, height*2.5, regularButton, CENTER, CENTER, width*13/24, height*13/24, x5width, x5Height);
  }
  
  //button for box 5 (O)
                if (noDraw[4] == false && mouseX>width*13/24 && mouseX<width*17/24 && mouseY>height*13/24 && mouseY<height*17/24 && (mouseButton == RIGHT)){
                  noDraw[4] = true;
                  boardPiece[4] = "O"; 
  textDraw(o, xoFont, height*2.5, regularButton, CENTER, CENTER, width*13/24, height*13/24, o5width, o5Height);
  }
  
  //button for box 6 (X)
                  if (noDraw[5] == false && mouseX>width*19/24 && mouseX<width*23/24 && mouseY>height*13/24 && mouseY<height*17/24 && (mouseButton == LEFT)){
                    noDraw[5] = true;
                    boardPiece[5] = "X"; 
  textDraw(X, xoFont, height*2.5, regularButton, CENTER, CENTER, width*19/24, height*13/24, x6width, x6Height);
  }
  
  //button for box 6 (O)
                    if (noDraw[5] == false && mouseX>width*19/24 && mouseX<width*23/24 && mouseY>height*13/24 && mouseY<height*17/24 && (mouseButton == RIGHT)){
                      noDraw[5] = true;
                      boardPiece[5] = "O"; 
  textDraw(o, xoFont, height*2.5, regularButton, CENTER, CENTER, width*19/24, height*13/24, o6width, o6Height);
  }
  
  //button for box 7 (X)
                    if (noDraw[6] == false && mouseX>width*7/24 && mouseX<width*11/24 && mouseY>height*19/24 && mouseY<height*23/24 && (mouseButton == LEFT)){
                      noDraw[6] = true;
                      boardPiece[6] = "X"; 
  textDraw(X, xoFont, height*2.5, regularButton, CENTER, CENTER, width*7/24, height*19/24, x7width, x7Height);
  }
  
  //button for box 7 (O)
                      if (noDraw[6] == false && mouseX>width*7/24 && mouseX<width*11/24 && mouseY>height*19/24 && mouseY<height*23/24 && (mouseButton == RIGHT)){
                        noDraw[6] = true;
                        boardPiece[6] = "O"; 
  textDraw(o, xoFont, height*2.5, regularButton, CENTER, CENTER, width*7/24, height*19/24, o7width, o7Height);
  }
  
  //button for box 8 (X)
                      if (noDraw[7] == false && mouseX>width*13/24 && mouseX<width*17/24 && mouseY>height*19/24 && mouseY<height*23/24 && (mouseButton == LEFT)){
                        noDraw[7] = true;
                        boardPiece[7] = "X"; 
  textDraw(X, xoFont, height*2.5, regularButton, CENTER, CENTER, width*13/24, height*19/24, x8width, x8Height);
  }
  
  //button for box 8 (O)
                        if (noDraw[7] == false && mouseX>width*13/24 && mouseX<width*17/24 && mouseY>height*19/24 && mouseY<height*23/24 && (mouseButton == RIGHT)){
                          noDraw[7] = true;
                          boardPiece[7] = "O"; 
  textDraw(o, xoFont, height*2.5, regularButton, CENTER, CENTER, width*13/24, height*19/24, o8width, o8Height);
  }
  
  //button for box 9 (X)
                        if (noDraw[8] == false && mouseX>width*19/24 && mouseX<width*23/24 && mouseY>height*19/24 && mouseY<height*23/24 && (mouseButton == LEFT)){
                          noDraw[8] = true;
                          boardPiece[8] = "X"; 
  textDraw(X, xoFont, height*2.5, regularButton, CENTER, CENTER, width*19/24, height*19/24, x9width, x9Height);
  }
  
  //button for box 9 (O)
                          if (noDraw[8] == false && mouseX>width*19/24 && mouseX<width*23/24 && mouseY>height*19/24 && mouseY<height*23/24 && (mouseButton == RIGHT)){
                            noDraw[8] = true;
                            boardPiece[8] = "O"; 
  textDraw(o, xoFont, height*2.5, regularButton, CENTER, CENTER, width*19/24, height*19/24, o9width, o9Height);
  }
} 
