// Class for displaying confetti using recursion
class Confetti {

  Confetti() {
    drawConfetti(0);
  }

  void drawConfetti(int count) {
    if (count < 50) {
      fill(random(255), random(255), random(255));
      ellipse(random(width), random(height), 10, 10);
      delay(50);
      drawConfetti(count + 1);
    }
  }
}
