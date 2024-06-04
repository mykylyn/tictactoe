// EndPage class
class EndPage extends Page {

  void display() {
    background(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    fill(0);

    if (playerWins) {
      text("Player Wins!", width / 2, height / 2 - 40);
    }

    else if (computerWins) {
      text("Computer Wins!", width / 2, height / 2 - 40);
    } else {
      text("It's a Draw!", width / 2, height / 2 - 40);
    }
    drawConfetti(0);
  }

  void mouseClicked() {
    pg = 0; // Restart the game
  }
}
