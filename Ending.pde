class Ending {
  //Confetti con = new Confetti();
  int buttonWidth = 200;
  int buttonHeight = 50;
  int buttonX;
  int startButtonY;
  int exitButtonY;
  boolean startGame = false;
  boolean exitGame = false;
  // Organizer pgmg= new Organizer();

  void layout() {
    strokeWeight(4);
    buttonX = width / 2 - buttonWidth / 2;
    startButtonY = height / 2 - buttonHeight - 10;
    exitButtonY = height / 2 + 10;
  }

  void display() {
    background(255);

    textAlign(CENTER, 50);
    textSize(100);
    fill(0);
    text("Good job", width / 2, height / 3);

    // start button
    if (overButton(buttonX, startButtonY, buttonWidth, buttonHeight)) {
      fill(100, 150, 255);
    } else {
      fill(0, 100, 200);
    }
    rect(buttonX, startButtonY, buttonWidth, buttonHeight);
    fill(255);
    textSize(24);
    text("exit", buttonX + buttonWidth / 2, startButtonY + buttonHeight / 2);

    // exit button
    if (overButton(buttonX, exitButtonY, buttonWidth, buttonHeight)) {
      fill(255, 100, 100);
    } else {
      fill(200, 0, 0);
    }
    rect(buttonX, exitButtonY, buttonWidth, buttonHeight);
    fill(255);
    textSize(24);
    text("Go back", buttonX + buttonWidth / 2, exitButtonY + buttonHeight / 2);

    //Make the confetti work

    //con.drawConfetti(0);
  }

  void mouseEvents() {
    if (overButton(buttonX, startButtonY, buttonWidth, buttonHeight)) {
      startGame = true;
      println("singel");
      pg = 0;
    }
    if (overButton(buttonX, exitButtonY, buttonWidth, buttonHeight)) {
      exitGame = true;
      println("multi");
      exit();
      pg = 0;
    }
  }

  boolean overButton(int x, int y, int width, int height) {
    return mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height;
  }

  void stop() {
    if (keyCode == ENTER) {
      pg = 0;

    }
  }
}
