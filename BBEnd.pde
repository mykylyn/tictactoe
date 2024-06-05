// EndPage class
class BBEnd extends Page {
  //Confetti con=new Confetti();

  void display() {
    background(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    fill(0);

    if (won=true) {
      if (hor_x==rows||ver_x==rows||dia_x==rows|| dia_x2==rows) {
        text("X Wins!", width / 2, height / 2 - 40);
      }
    }

    else if (o_won) {
      if (hor_o==rows||ver_o==rows||dia_o==rows || dia_o2==rows) {
        text("O Wins!", width / 2, height / 2 - 40);
      }
    } else {
      text("It's a Draw!", width / 2, height / 2 - 40);
    }
    //con.drawConfetti(0);
  }

  void mouseClicked() {
    pg = 0; // Restart the game
  }
}
