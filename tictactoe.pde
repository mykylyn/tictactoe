// Class for the Tic Tac Toe game
class Tictactoe {
  PImage x;
  PImage o;

  int dim = 3;
  int rows = 3;
  int cols = 3;
  int[][] positions;
  int[][] keylay;
  ArrayList<Integer> keys = new ArrayList<Integer>();

  private String input = "";
  private String user = "";

  int cellSize_cols;
  int cellSize_rows;

  void layout() {
    positions = new int[rows][cols];
    keylay = new int[rows][cols];
    x = loadImage("x.png");
    o = loadImage("o.png");
    for (int w = 1; w <= (rows * cols); w++) {
      keys.add(w);
    }
    int r = 0;
    for (int t = 0; t < rows; t++) {
      for (int e = 0; e < cols; e++) {
        keylay[t][e] = keys.get(r);
        r++;
      }
    }
  }

  void display() {
    background(248, 248, 248);
    drawGrid();
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (positions[i][j] == 1) {
          image(x, (width / rows) * j, (height / cols) * i, cellSize_rows, cellSize_cols);
        } else if (positions[i][j] == 2) {
          image(o, (width / rows) * j, (height / cols) * i, cellSize_rows, cellSize_cols);
        }
      }
    }
    decide();
  }

  void positioning() {
    if (key >= '0' && key <= '9') {
      input += key;
    }
    if (keyCode == ENTER) {
      user = input;
      input = "";
      boolean userMoved = false;
      for (int q = 0; q < rows; q++) {
        for (int u = 0; u < cols; u++) {
          String num = Integer.toString(keylay[q][u]);
          if (user.equals(num) && positions[q][u] == 0) {
            positions[q][u] = 1;
            userMoved = true;
            break;
          }
        }
        if (userMoved) break;
      }
      if (userMoved) computerMove();
    }
  }

  void computerMove() {
    int[] move = findWinningMove(2); // Check if computer can win
    if (move == null) {
      move = findWinningMove(1); // Check if user can win and block it
    }
    if (move == null) {
      ArrayList<int[]> openCells = new ArrayList<int[]>();
      for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
          if (positions[i][j] == 0) {
            openCells.add(new int[]{i, j});
          }
        }
      }
      if (openCells.size() > 0) {
        move = openCells.get((int) random(openCells.size())); // Random move
      }
    }
    if (move != null) {
      positions[move[0]][move[1]] = 2;
    }
  }

  int[] findWinningMove(int player) {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (positions[i][j] == 0) {
          positions[i][j] = player;
          if (checkWin(player)) {
            positions[i][j] = 0;
            return new int[]{i, j};
          }
          positions[i][j] = 0;
        }
      }
    }
    return null;
  }

  void drawGrid() {
    cellSize_cols = width / cols;
    cellSize_rows = height / rows;
    stroke(0);
    for (int i = 0; i <= rows; i++) {
      line(0, i * cellSize_rows, cols * cellSize_cols, i * cellSize_rows);
    }
    for (int j = 0; j <= cols; j++) {
      line(j * cellSize_cols, 0, j * cellSize_cols, rows * cellSize_cols);
    }
  }

  void decide() {
    if (checkWin(1)) {
      println("User wins!");
      noLoop();
      new WinningScreen("User wins!");
      new Confetti();
    } else if (checkWin(2)) {
      println("Computer wins!");
      noLoop();
      new WinningScreen("Computer wins!");
      new Confetti();
    } else if (isBoardFull()) {
      println("Draw!");
      noLoop();
      new WinningScreen("Draw!");
    }
  }

  boolean checkWin(int player) {
    for (int i = 0; i < rows; i++) {
      if (positions[i][0] == player && positions[i][1] == player && positions[i][2] == player) return true;
    }
    for (int j = 0; j < cols; j++) {
      if (positions[0][j] == player && positions[1][j] == player && positions[2][j] == player) return true;
    }
    if (positions[0][0] == player && positions[1][1] == player && positions[2][2] == player) return true;
    if (positions[0][2] == player && positions[1][1] == player && positions[2][0] == player) return true;
    return false;
  }

  boolean isBoardFull() {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (positions[i][j] == 0) return false;
      }
    }
    return true;
  }
}

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
