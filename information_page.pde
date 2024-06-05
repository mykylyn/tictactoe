

// InfoPage class
class InfoPage extends Page {

  void display() {
    background(255);
    textAlign(CENTER, CENTER);
    textSize(24);
    fill(0);
    text("Enter the number of rows and columns(3-5)", width / 2, height / 2 - 50);
    text(rows + " x " + cols, width / 2, height / 2);

    // Increase rows and columns
    if (overButton(width / 2 - 100, height / 2 + 40, 50, 50)) {
      fill(200, 0, 0); // Darker Red
    } else {
      fill(255, 0, 0); // Red
    }
    rect(width / 2 - 100, height / 2 + 40, 50, 50);
    fill(255);
    text("+", width / 2 - 75, height / 2 + 65);

    // Decrease rows and columns
    if (overButton(width / 2 + 50, height / 2 + 40, 50, 50)) {
      fill(0, 0, 200); // Darker Blue
    } else {
      fill(0, 0, 255); // Blue
    }
    rect(width / 2 + 50, height / 2 + 40, 50, 50);
    fill(255);
    text("-", width / 2 + 75, height / 2 + 65);
  }

  void mouseClicked() {
    if (overButton(width / 2 - 100, height / 2 + 40, 50, 50)) {
      rows = constrain(rows + 1, 3, 5);
      cols = constrain(cols + 1, 3, 5);
    }
    else if (overButton(width / 2 + 50, height / 2 + 40, 50, 50)) {
      rows = constrain(rows - 1, 3, 5);
      cols = constrain(cols - 1, 3, 5);
    } else {
      pg = 2; // Start multiplayer game
      //initializeBoard();
      
    }
  }
}
