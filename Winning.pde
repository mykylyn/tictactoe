// Class for displaying the winning screen
class WinningScreen {
  String message;

  WinningScreen(String message) {
    this.message = message;
    display();
  }

  void display() {
    background(0, 200, 0);
    fill(255);
    textSize(32);
    textAlign(CENTER, CENTER);
    text(message, width / 2, height / 2);
  }
}
