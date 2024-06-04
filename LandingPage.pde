class LandingPage extends Page {

  void display() {
    background(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    fill(0);
    text("Tic Tac Toe", width / 2, height / 3);

    // Single Player Button
    if (overButton(width / 2 - 100, height / 2 - 30, 200, 50)) {
      fill(0, 0, 200); // Darker Blue
    } else {
      fill(0, 0, 255); // Blue
    }
    rect(width / 2 - 100, height / 2 - 30, 200, 50);
    fill(255);
    text("Single Player", width / 2, height / 2 - 5);

    // Multiplayer Button
    if (overButton(width / 2 - 100, height / 2 + 40, 200, 50)) {
      fill(200, 0, 0); // Darker Red
    } else {
      fill(255, 0, 0); // Red
    }
    rect(width / 2 - 100, height / 2 + 40, 200, 50);
    fill(255);
    text("Multiplayer", width / 2, height / 2 + 65);
  }

  void mouseClicked() {
    if (overButton(width / 2 - 100, height / 2 - 30, 200, 50)) {
      pg = 2; // Start single player game
      initializeBoard();
      playerTurn = true;
      gameOver = false;
    }
    else if (overButton(width / 2 - 100, height / 2 + 40, 200, 50)) {
      pg = 1; // Go to info page for multiplayer setup
    }
  }
}
