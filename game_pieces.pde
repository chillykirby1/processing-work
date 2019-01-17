int numberOfBoardPieces = 9;
String[] boardPiece = new String[numberOfBoardPieces];
String[] onlyXPiece = new String[numberOfBoardPieces];
String[] onlyOPiece = new String[numberOfBoardPieces];

// "X" or "O" or null
// Test 1:X, 3:X, 5:X (Math will see as a win unless answers are limited

void gamePieces() {
  boardPiece[0] = null; //First Corner, left
  boardPiece[1] = null; //First Middle //"O"
  boardPiece[2] = null; //First Corner, right
  boardPiece[3] = null; //Second Corner, left
  boardPiece[4] = null; //Second Middle //
  boardPiece[5] = null; //Second Corner, right
  boardPiece[6] = null; //Third Corner, left
  boardPiece[7] = null; //Third Middle //"O"
  boardPiece[8] = null; //Third Corner, right

  onlyX();
  onlyO();
}

void onlyX() {
  for (int i=0; i<numberOfBoardPieces; i++) {
    if (boardPiece[i] == "X") {
      onlyXPiece[i] = "X";
    }
  }
}

void onlyO() {
  for (int i=0; i<numberOfBoardPieces; i++) {
    if (boardPiece[i] == "O") {
      onlyOPiece[i] = "O";
    }
  }
}
