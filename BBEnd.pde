// EndPage class


class BBEnd extends Page {
  //Confetti con=new Confetti();

  

  void display() {
    //System.out.println("I am here");
    background(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    fill(0);

    if (xWins) {
      text("X Wins!", width / 2, height / 2 - 40);
      if (hor_x==rows||ver_x==rows||dia_x==rows|| dia_x2==rows) {
        
      }
    }

    else if (oWins) {
      text("O Wins!", width / 2, height / 2 - 40);
      if (hor_o==rows||ver_o==rows||dia_o==rows || dia_o2==rows) {
        
      }
    } else if(tie){
      text("It's a Draw!", width / 2, height / 2 - 40);
    }
    drawConfetti(0);
  }

  void mouseClicked() {
    pg = 0; // Restart the game
  }
  void drawConfetti(int depth) {
  if (depth > 200) return;

  float x = random(width);
  float y = random(height);
  float size = random(10, 20);
  fill(random(255), random(255), random(255));
  noStroke();
  ellipse(x, y, size, size);

  drawConfetti(depth + 1);
}

}
