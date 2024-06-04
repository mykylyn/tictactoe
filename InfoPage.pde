class InfoPage extends Page {

  void display() {
    background(255);
    textAlign(CENTER, CENTER);
    textSize(24);
    fill(0);
    text("Enter the number of rows and columns(3-6)", width / 2, height / 2 - 50);
    text(rows + " x " + cols, width / 2, height / 2);
  }

  void mouseClicked() {
    if (mouseX > width / 2 - 50 && mouseX < width / 2 + 50 && mouseY > height / 2 - 25 && mouseY < height / 2 + 25) {
      rows = constrain(rows + 1, 3, 6);
      cols = constrain(cols + 1, 3, 6);
    }
    else if (mouseX > width / 2 - 50 && mouseX < width / 2 + 50 && mouseY > height / 2 + 25 && mouseY < height / 2 + 75) {
      pg = 2; // Start multiplayer game
      initializeBoard();
      playerTurn = true;
      gameOver = false;
    }
  }
}
