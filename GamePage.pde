// GamePage class
class GamePage extends Page {

  void display() {

    if (gameOver) {
      background(255);
      fill(0);
      textSize(32);
      textAlign(CENTER, CENTER);
      text("Game Over", width / 2, height / 2);
      delay(2000);
      pg = 3;
    } else {

      if (playerTurn) {
        background(0, 0, 255); // Blue background for player's turn
      } else {
        background(255, 0, 0); // Red background for computer's turn
      }
      drawpositions();
    }
  }

  void mouseClicked() {
    int row = mouseY /(height / rows);
    int col = mouseX /(width / cols);

    if (isValidMove(row, col)) {
      positions[row][col] = 1; // Player move
      playerTurn = false;
      checkGameOver();

      if (!gameOver) {
        computerMove();
        playerTurn = true;
        checkGameOver();
      }
    }
  }
}
