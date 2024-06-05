class Confetti {

  Confetti() {
    drawConfetti(0);
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
