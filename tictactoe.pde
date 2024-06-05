// Class for the Tic Tac Toe game
class Tictactoe {
  PImage x;
  PImage o;

  int dim = 3;

  boolean playerTurn = true; // Variable to track whose turn it is
boolean gameOver = false;
boolean xWins = false;
boolean oWins = false;
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
  boolean win;

  //TODO: Change background color according to the turn

  void layout() {
    positions = new int[rows][cols];
    keylay = new int[rows][cols];
    changed = new int[rows][cols];
    x = loadImage("x.png");
    o = loadImage("o.png");
    for(int w = 1;
    w <=(rows * cols);
    w++) {
      keys.add(w);
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
    background(248, 248, 248);
    //turn_var not working properly
    if (turn_var == 1) {
      background(245, 162, 163);
    }
    else if (turn_var == 2) {
      background(162, 180, 245);
    }
    /** //the grid maker
    line(0, height/dim, width, height/dim);
    line(0,(height/dim)*2, width,(height/dim)*2);

    line(width/dim, 0, width/dim, height);
    line((width/dim)*2, 0,(width/dim)*2, height);

    * */
    drawGrid();

    for (int i=0; i<rows; i++) {
      for (int y=0; y<cols; y++) {
        if (positions[i][y] == 0) {
        }
        else if (positions[i][y] == 1) {
          //System.out.println("was there "+positions[i][y]);
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
    // Thekeycorresponding to the number 'i' is pressed

    input +=key;
    // println("User input: " + key);
  }
  if (keyCode == ENTER) {
  // Do something with the user input(e.g., print it)
  //println("User input: " + input);
  user = input;
  input = "";
  turn();
}
    /* if (nim <= rows * rows) {
      if (keyCode == ENTER) {
        // Do something with the user input(e.g., print it)
        //println("User input: " + input);
        user = input;
        input = "";
        turn();

      }
    } else {
      input = ""; */

      for(int w = 1;
      w <=(rows * rows);
      w++) {
        //System.out.println(w);
        int i = w;
        keys.add(w - 1,i);
        //System.out.print(keys.get(i-1)+ " ");

      }
      int r = 0;

      for (int t=0; t<rows; t++) {
        for (int e=0; e<cols; e++) {
          keylay[t][e] = keys.get(r);
          r++;
        }
      }
      
      for (int q=0; q<rows; q++) {
        for (int u=0; u<cols; u++) {
          String num = Integer.toString(keylay[q][u]);
          if (user.equals(num)) {
            //fill(0);
            if (positions[q][u]==0) {
              positions[q][u] = turn_var;
              println("can");

            }
            if (positions[q][u]==1 || positions[q][u]==2) {
            }
            //changed[q][u]=1;

            //make_sure=true;

            //println(num + " pressed!");
            // image(o, 0, 0, 200, 200);
          } 
        }
      }
      /** char num=(char)(i + '0'); // Convert integer to character
      if (keyPressed && key == num) {
        //The key corresponding to the number 'i' is pressed
        fill(0);
        positions[0][0] = 1;
        println(key + " pressed!");
        //image(o, 0, 0, 200, 200);
      }
    }
    * */

    /** for(intt = 0;
    t < rows;
    t++) {
      for(inte = 0;
      e < cols;
      e++) {
        System.out.print(keylay[t][e]);;
      }
      System.out.println();

    }
    * */
  }



  void mouseClicked() {
  int row = mouseY /(height / rows);
  int col = mouseX /(width / cols);

  if (isValidMove(row, col)) {
    positions[row][col] = playerTurn ? 1 : 2; // X for player, O for opponent
    positioning();
    playerTurn = !playerTurn; // Switch turns
    checkGameOver();

    if (!singlePlayerMode && !gameOver) {
      drawGrid();
    }
    if (singlePlayerMode && !playerTurn && !gameOver) {
      computerMove();
      positioning();
      playerTurn = true;
      checkGameOver();
    }
  }
}


  void drawGrid() {
    //background(248, 248, 248);
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
  boolean diagonalWin = false;
  int winningSymbol = turn_var; // 1 integer
  int hor_x = 0;
  int ver_x = 0;
  int dia_x = 0;

  int hor_o = 0;
  int ver_o = 0;
  int dia_o = 0;

  int dia_x2 = 0;
  int dia_o2 = 0;

  //when type 3*4 some error happened about out of bound
  for (int q=0; q<rows; q++) {
    for (int u=0; u<cols; u++) {
      if (positions[q][u] == winningSymbol) {
        //System.out.println("added 1 to hor_x");
        if (winningSymbol==2) {
          hor_x ++;
        }
        if (winningSymbol==1) {
          hor_o ++;
        }
      }
    }
    if (hor_x == rows || hor_o == rows) {
      System.out.println("You won by rows");
      won = true;
      break;

    }
    hor_x=0;
    hor_o=0;

  }
  for (int q=0; q<rows; q++) {
    for (int u=0; u<cols; u++) {
      if (positions[u][q] == winningSymbol) {
        //System.out.println("added 1 to hor_x");
        if (winningSymbol==2) {
          ver_x ++;
        }
        if (winningSymbol==1) {
          ver_o ++;
        }
      }
    }
    if (ver_x == rows || ver_o == rows) {
      System.out.println("You won by cols");
      won = true;
      break;

    }
    ver_x=0;
    ver_o=0;

  }
  for (int q=0; q<rows; q++) {
    for (int u=0; u<cols; u++) {
      if (positions[u][u] == winningSymbol) {
        //System.out.println("added 1 to dia_x");
        if (winningSymbol==2) {
          dia_x ++;
        }
        if (winningSymbol==1) {
          dia_o ++;
        }
      }
    }
    if (dia_x == rows || dia_o == rows) {
      System.out.println("You won by dia");
      won = true;
      break;

    }
    dia_x=0;
    dia_o=0;

  }
  if (!diagonalWin) {
    // Check the secondary diagonal
    for (int i=0; i<rows; i++) {
      if (i == 0) {
        winningSymbol = positions[i][cols - 1 - i];
        if (winningSymbol == 0) {
          // Changed to check for non-zero value
          System.out.println("No winning symbol found on the diagonal.");
          break;
        }
      }
      else if (positions[i][cols - 1 - i] != winningSymbol) {
        System.out.println("Winning symbol not found on the diagonal.");
        break;
      }
      else if (i == rows - 1) {
        System.out.println("Diagonal win detected!");
        //diagonalWin = true;
        won=true;
      }
    }
  }
  //System.out.println(" hor_x "+hor_x);
  //System.out.println(" ver_x "+ver_x);
  //System.out.println(" dia_x "+dia_x);

  //

}


  /* Computer logic not working property has syntax error and bugs need fixing void decide() {
    if (checkWin(1)) {
      println("User wins!");
      noLoop();
      new WinningScreen("User wins!");
      new Confetti();
    }
    else if (checkWin(2)) {
      println("Computer wins!");
      noLoop();
      new WinningScreen("Computer wins!");
      new Confetti();
    }
    else if (ispositionsFull()) {
      println("Draw!");
      noLoop();
      new WinningScreen("Draw!");
    }
  }

  boolean checkWin(int player) {
    for (int i=0; i<rows; i++) {
      if (positions[i][0] == player && positions[i][1] == player && positions[i][2] == player) return true;
    }
    for (int j=0; j<cols; j++) {
      if (positions[0][j] == player && positions[1][j] == player && positions[2][j] == player) return true;
    }
    if (positions[0][0] == player && positions[1][1] == player && positions[2][2] == player) return true;
    if (positions[0][2] == player && positions[1][1] == player && positions[2][0] == player) return true;
    return false;
  }

  boolean ispositionsFull() {
    for (int i=0; i<rows; i++) {
      for (int j=0; j<cols; j++) {
        if (positions[i][j] == 0) return false;
      }
    }
    return true;
  }
}
*/

void decide() {
  int count = 0;
  for (int q=0; q<rows; q++) {
    for (int u=0; u<cols; u++) {
      if (positions[q][u] == 1 || positions[q][u] == 2) {
        count++;
        //System.out.println("update made");
      }
    }
  }
  if (count == rows *cols) {
    System.out.println("tie game");
    pg = 3;

  }
}

void reset() {
  for (int i=0; i<rows; i++) {
    for (int x=0; x<rows; x++) {
      System.out.print(positions[i][x]);
    }
    System.out.println();
  }
  for (int i=0; i<rows; i++) {
    for (int x=0; x<rows; x++) {
      positions[i][x]=0;
    }
  }
  System.out.println(" ");
  System.out.println("After ");
  System.out.println(" ");
  for (int i=0; i<rows; i++) {
    for (int x=0; x<rows; x++) {
      System.out.print(positions[i][x]);
    }
    System.out.println();
  }
}

void turn() {
  times++;
  turn_var=(times%2)+1;
}

void checkGameOver() {
  if (checkWin(1)) {
    gameOver = true;
    xWins = true;
    oWins = false;
    println("X wins!");
  }
  else if (checkWin(2)) {
    gameOver = true;
    xWins = false;
    oWins = true;
    println("O wins!");
  }
  else if (ispositionsFull()) {
    gameOver = true;
    xWins = false;
    oWins = false;
    println("It's a draw!");
  }
}

boolean checkWin(int player) {

  return won;
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

boolean ispositionsFull() {
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
