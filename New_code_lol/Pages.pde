int rows = 3;
int cols = 3;
int[][] board;
boolean playerTurn = true; // Variable to track whose turn it is
boolean gameOver = false;
boolean playerWins = false;
boolean computerWins = false;
int pg = 0; // Page tracking variable

void setup() {
  size(800, 800);
  initializeBoard();
}

void draw() {
  if (pg == 0) {
    landingPage.display();
  } else if (pg == 1) {
    infoPage.display();
  } else if (pg == 2) {
    gamePage.display();
  } else if (pg == 3) {
    endPage.display();
  }
}

void mouseClicked() {
  if (pg == 0) {
    landingPage.mouseClicked();
  } else if (pg == 1) {
    infoPage.mouseClicked();
  } else if (pg == 2 && !gameOver && playerTurn) {
    gamePage.mouseClicked();
  } else if (pg == 3) {
    endPage.mouseClicked();
  }
}

void initializeBoard() {
  board = new int[rows][cols];
}

// Base Page class
class Page {
  void display() {
  }
  void mouseClicked() {
  }
}

// LandingPage class
class LandingPage extends Page {
  void display() {
    background(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    fill(0);
    text("Tic Tac Toe", width / 2, height / 3);

    // Single Player Button
    if (overButton(width / 2 - 100, height / 2 - 30, 200, 50)) {
      fill(0, 0, 200); // Darker Blue
    } else {
      fill(0, 0, 255); // Blue
    }
    rect(width / 2 - 100, height / 2 - 30, 200, 50);
    fill(255);
    text("Single Player", width / 2, height / 2 - 5);

    // Multiplayer Button
    if (overButton(width / 2 - 100, height / 2 + 40, 200, 50)) {
      fill(200, 0, 0); // Darker Red
    } else {
      fill(255, 0, 0); // Red
    }
    rect(width / 2 - 100, height / 2 + 40, 200, 50);
    fill(255);
    text("Multiplayer", width / 2, height / 2 + 65);
  }

  void mouseClicked() {
    if (overButton(width / 2 - 100, height / 2 - 30, 200, 50)) {
      pg = 2; // Start single player game
      initializeBoard();
      playerTurn = true;
      gameOver = false;
    } else if (overButton(width / 2 - 100, height / 2 + 40, 200, 50)) {
      pg = 1; // Go to info page for multiplayer setup
    }
  }
}

// InfoPage class
class InfoPage extends Page {
  void display() {
    background(255);
    textAlign(CENTER, CENTER);
    textSize(24);
    fill(0);
    text("Enter the number of rows and columns (3-6)", width / 2, height / 2 - 50);
    text(rows + " x " + cols, width / 2, height / 2);
  }

  void mouseClicked() {
    if (mouseX > width / 2 - 50 && mouseX < width / 2 + 50 && mouseY > height / 2 - 25 && mouseY < height / 2 + 25) {
      rows = constrain(rows + 1, 3, 6);
      cols = constrain(cols + 1, 3, 6);
    } else if (mouseX > width / 2 - 50 && mouseX < width / 2 + 50 && mouseY > height / 2 + 25 && mouseY < height / 2 + 75) {
      pg = 2; // Start multiplayer game
      initializeBoard();
      playerTurn = true;
      gameOver = false;
    }
  }
}

// GamePage class
class GamePage extends Page {
  void display() {
    if (gameOver) {
      background(255);
      fill(0);
      textSize(32);
      textAlign(CENTER, CENTER);
      text("Game Over", width / 2, height / 2);
      delay(2000);
      pg = 3;
    } else {
      if (playerTurn) {
        background(0, 0, 255); // Blue background for player's turn
      } else {
        background(255, 0, 0); // Red background for computer's turn
      }
      drawBoard();
    }
  }

  void mouseClicked() {
    int row = mouseY / (height / rows);
    int col = mouseX / (width / cols);

    if (isValidMove(row, col)) {
      board[row][col] = 1; // Player move
      playerTurn = false;
      checkGameOver();

      if (!gameOver) {
        computerMove();
        playerTurn = true;
        checkGameOver();
      }
    }
  }
}

// EndPage class
class EndPage extends Page {
  void display() {
    background(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    fill(0);
    if (playerWins) {
      text("Player Wins!", width / 2, height / 2 - 40);
    } else if (computerWins) {
      text("Computer Wins!", width / 2, height / 2 - 40);
    } else {
      text("It's a Draw!", width / 2, height / 2 - 40);
    }
    drawConfetti(0);
  }

  void mouseClicked() {
    pg = 0; // Restart the game
  }
}

LandingPage landingPage = new LandingPage();
InfoPage infoPage = new InfoPage();
GamePage gamePage = new GamePage();
EndPage endPage = new EndPage();

boolean overButton(int x, int y, int w, int h) {
  return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
}

void drawBoard() {
  float cellWidth = width / cols;
  float cellHeight = height / rows;

  strokeWeight(2);
  for (int i = 1; i < rows; i++) {
    line(0, i * cellHeight, width, i * cellHeight);
  }
  for (int i = 1; i < cols; i++) {
    line(i * cellWidth, 0, i * cellWidth, height);
  }

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (board[i][j] == 1) {
        drawX(j * cellWidth, i * cellHeight, cellWidth, cellHeight);
      } else if (board[i][j] == 2) {
        drawO(j * cellWidth, i * cellHeight, cellWidth, cellHeight);
      }
    }
  }
}

void drawX(float x, float y, float w, float h) {
  line(x, y, x + w, y + h);
  line(x, y + h, x + w, y);
}

void drawO(float x, float y, float w, float h) {
  ellipse(x + w / 2, y + h / 2, w, h);
}

boolean isValidMove(int row, int col) {
  return row >= 0 && row < rows && col >= 0 && col < cols && board[row][col] == 0;
}

void checkGameOver() {
  if (checkWin(1)) {
    gameOver = true;
    playerWins = true;
    computerWins = false;
    println("Player wins!");
  } else if (checkWin(2)) {
    gameOver = true;
    playerWins = false;
    computerWins = true;
    println("Computer wins!");
  } else if (isBoardFull()) {
    gameOver = true;
    playerWins = false;
    computerWins = false;
    println("It's a draw!");
  }
}

boolean checkWin(int player) {
  // Check rows and columns
  for (int i = 0; i < rows; i++) {
    if (board[i][0] == player && board[i][1] == player && board[i][2] == player) return true; // Rows
    if (board[0][i] == player && board[1][i] == player && board[2][i] == player) return true; // Columns
  }

  // Check diagonals
  if (board[0][0] == player && board[1][1] == player && board[2][2] == player) return true; // Diagonal from top-left to bottom-right
  if (board[0][2] == player && board[1][1] == player && board[2][0] == player) return true; // Diagonal from top-right to bottom-left

  return false;
}

boolean isBoardFull() {
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (board[i][j] == 0) return false;
    }
  }
  return true;
}

void computerMove() {
  // Check if the computer can win
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (board[i][j] == 0) {
        board[i][j] = 2;
        if (checkWin(2)) {
          return;
        } else {
          board[i][j] = 0;
        }
      }
    }
  }

  // Check if the player can win, block them
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      if (board[i][j] == 0) {
        board[i][j] = 1;
        if (checkWin(1)) {
          board[i][j] = 2;
          return;
        } else {
          board[i][j] = 0;
        }
      }
    }
  }

  // If neither, make a random move
  while (true) {
    int row = int(random(rows));
    int col = int(random(cols));
    if (isValidMove(row, col)) {
      board[row][col] = 2; // Computer move
      return;
    }
  }
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
