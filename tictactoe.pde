// Class for the Tic Tac Toe game
class Tictactoe {
  PImage x;
  PImage o;

  int dim = 3;

  boolean playerTurn = true; // Variable to track whose turn it is
  boolean gameOver = false;

  boolean singlePlayerMode = true;

  int[][] positions;
  int[][] keylay;
  int[][] changed;
  ArrayList<Integer> keys = new ArrayList<Integer>();

  String input = "";
  private String user = "";

  int cellSize_cols;
  int cellSize_rows;
  int times;
  boolean won;
  int turn_var = 1;

  // Change background color according to the turn

  void layout() {
    positions = new int[rows][cols];
    keylay = new int[rows][cols];
    changed = new int[rows][cols];
    x = loadImage("x.png");
    o = loadImage("o.png");
    for(int w = 1;
    w <=(rows * cols);
    w++) {
      int i = w;
      keys.add(i - 1, w);
    }
    int r = 0;
    for (int t=0; t<rows; t++) {
      for (int e=0; e<cols; e++) {
        keylay[t][e] = keys.get(r);
        r++;
      }
    }
  }

  void display() {
    if (turn_var == 1) {
      background(245, 162, 163);
    }
    else if (turn_var == 2) {
      background(162, 180, 245);
    } else {
      background(248, 248, 248);
    }
    drawGrid();

    for (int i=0; i<rows; i++) {
      for (int y=0; y<cols; y++) {
        if (positions[i][y] == 1) {
          image(o,(float)((width / rows) * y),(float)(height / cols) * i,(float) cellSize_rows,(float) cellSize_cols);
        }
        else if (positions[i][y] == 2) {
          image(x,(float)((width / rows) * y),(float)(height / cols) * i,(float) cellSize_rows,(float) cellSize_cols);
        }
      }
    }
    win();
    decide();
  }

  void positioning() {
    if (key >= '0' && key <= '9') {
      input += key;
    }
    if (keyCode == ENTER) {
      user = input;
      input = "";
      turn();
    }
    for (int q=0; q<rows; q++) {
      for (int u=0; u<cols; u++) {
        String num = Integer.toString(keylay[q][u]);
        if (user.equals(num)) {
          if (positions[q][u] == 0) {
            positions[q][u] = turn_var;
          }
        }
      }
    }
  }

  void mouseClicked() {
    int row = mouseY /(height / rows);
    int col = mouseX /(width / cols);

    if (isValidMove(row, col)) {
      positions[row][col] = playerTurn ? 1 : 2; // X for player, O for opponent
      playerTurn = !playerTurn; // Switch turns
      checkGameOver();

      if (singlePlayerMode && !playerTurn && !gameOver) {
        computerMove();
        playerTurn = true;
        checkGameOver();
      }
    }
  }

  void drawGrid() {
    cellSize_cols = width / cols;
    cellSize_rows = height / rows;

    stroke(0);
    for (int i=0; i<=rows; i++) {
      line(0, i * cellSize_rows, cols * cellSize_cols, i * cellSize_rows);
    }
    for (int j=0; j<=cols; j++) {
      line(j * cellSize_cols, 0, j * cellSize_cols, rows * cellSize_cols);
    }
  }

  void win() {
    checkWin(1);
    checkWin(2);
  }

  void decide() {
    int count = 0;
    for (int q=0; q<rows; q++) {
      for (int u=0; u<cols; u++) {
        if (positions[q][u] == 1 || positions[q][u] == 2) {
          count++;
        }
      }
    }
    if (count == rows * cols) {
      tie=true;
      println("Tie game");
    }
  }

  void reset() {
    for (int i=0; i<rows; i++) {
      for (int x=0; x<rows; x++) {
        positions[i][x] = 0;
      }
    }
  }

  void turn() {
    times++;
    turn_var =(times % 2) + 1;
  }

  void checkGameOver() {
    if (checkWin(1)) {
      gameOver = true;
      xWins = true;
      oWins = false;
      println("Player wins! x");
    }
    else if (checkWin(2)) {
      gameOver = true;
      xWins = false;
      oWins = true;
      println("Computer wins! o");
    }
    else if (isPositionsFull()) {
      gameOver = true;
      xWins = false;
      oWins = false;
      println("It's a draw!");
    }
  }

  boolean checkWin(int player) {
    for (int i=0; i<rows; i++) {
      if (allEqual(player, positions[i]) || allEqual(player, column(i))) {
        won = true;
        return true;
      }
    }
    // Check diagonals
    if (allEqual(player, diagonal1()) || allEqual(player, diagonal2())) {
      won = true;
      return true;
    }
    return false;
  }
  boolean allEqual(int player, int[] line) {
    for(int value : line) {
      if (value != player) return false;
    }
    return true;
  }

  int[] column(int colIndex) {
    int[] col = new int[rows];
    for (int i=0; i<rows; i++) {
      col[i] = positions[i][colIndex];
    }
    return col;
  }

  int[] diagonal1() {
    int[] diag = new int[rows];
    for (int i=0; i<rows; i++) {
      diag[i] = positions[i][i];
    }
    return diag;
  }

  int[] diagonal2() {
    int[] diag = new int[rows];
    for (int i=0; i<rows; i++) {
      diag[i] = positions[i][rows - 1 - i];
    }
    return diag;
  }

  boolean isPositionsFull() {
    for (int i=0; i<rows; i++) {
      for (int j=0; j<cols; j++) {
        if (positions[i][j] == 0) return false;
      }
    }
    return true;
  }

  void computerMove() {
    for (int i=0; i<rows; i++) {
      for (int j=0; j<cols; j++) {
        if (positions[i][j] == 0) {
          positions[i][j] = 2;
          if (checkWin(2)) {
            return;
          } else {
            positions[i][j] = 0;
          }
        }
      }
    }
    for (int i=0; i<rows; i++) {
      for (int j=0; j<cols; j++) {
        if (positions[i][j] == 0) {
          positions[i][j] = 1;
          if (checkWin(1)) {
            positions[i][j] = 2;
            return;
          } else {
            positions[i][j] = 0;
          }
        }
      }
    }

    while(true) {
      int row = int(random(rows));
      int col = int(random(cols));
      if (isValidMove(row, col)) {
        positions[row][col] = 2;
        return;
      }
    }
  }

  boolean isValidMove(int row, int col) {
    return row >= 0 && row < rows && col >= 0 && col < cols && positions[row][col] == 0;
  }
}
