class InfoPage {
  String thestate = "rows";

  boolean gameStarted = false;

  String input = "";

  void starter() {
    if (!gameStarted) {
      display();
    } else {
      pg = 2;
    }
  }

  void layout() {
    textAlign(CENTER);
    textSize(30);
  }

  void display() {
    background(255);
    fill(0);
    text("Enter the number of " + thestate, width / 2, height / 2 - 100);
    text(input, width / 2, height / 2);
    text("Press Enter to confirm", width / 2, height / 2 + 100);
  }

  void decide() {
    if (!gameStarted) {
      if (key >= '3' && key <= '6') {
        input += key;
      } else if (key == BACKSPACE && input.length() > 0) {
        input = input.substring(0, input.length() - 1);
      } else if (key == ENTER) {
        if (thestate.equals("rows")) {
          rows = constrain(int(input), 3, 6);
          thestate = "cols";
        } else if (thestate.equals("cols")) {
          cols = constrain(int(input), 3, 6);
          gameStarted = true;
        }
        input = "";
      }
    }
  }
}
