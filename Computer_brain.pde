class Computer_brain {

  boolean isValidMove(int row, int col) {
    return row >= 0 && row < rows && col >= 0 && col < cols && positions[row][col] == 0;
  }

  void computerMove() {
    // Check if the computer can win
    for (int i=0; i<rows; i++) {
      for (int j=0; j<cols; j++) {
        if (positions[i][j] == 0) {
          positions[i][j] = 2;
          playerTurn=true;
          if (checkWin(2)) {
            return;
          } else {
            positions[i][j] = 0;
            playerTurn=true;
          }
        }
      }
    }
    // Check if the player can win, block them
    for (int i=0; i<rows; i++) {
      for (int j=0; j<cols; j++) {
        if (positions[i][j] == 0) {
          positions[i][j] = 1;
          if (checkWin(1)) {
            positions[i][j] = 2;
            playerTurn=true;
            return;
          } else {
            positions[i][j] = 0;
            playerTurn=true;
          }
        }
      }
    }
    // If neither, make a random move

    while(true) {
      int row = int(random(rows));
      int col = int(random(cols));
      if (isValidMove(row, col)) {
        positions[row][col] = 2;
        playerTurn=true; // Computer move
        return;
      }
    }
  }

  void checkGameOver() {
    if (checkWin(1)) {
      gameOver = true;
      playerWins = true;
      computerWins = false;
      println("Player wins!");
    }
    else if (checkWin(2)) {
      gameOver = true;
      playerWins = false;
      computerWins = true;
      println("Computer wins!");
    }
    else if (ispositionsFull()) {
      gameOver = true;
      playerWins = false;
      computerWins = false;
      println("It's a draw!");
    }
  }

  boolean checkWin(int who) {
    //state=false;
    return win;
  }

  boolean ispositionsFull() {
    for (int i=0; i<rows; i++) {
      for (int j=0; j<cols; j++) {
        if (positions[i][j] == 0) return false;
      }
    }
    return true;
  }
}
