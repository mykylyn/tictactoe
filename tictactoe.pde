// Class for the Tic Tac Toe game
class Tictactoe {
  PImage x;
  PImage o;

  //int dim = 3;

  int[][] positions;
  int[][] keylay;
  ArrayList<Integer> keys = new ArrayList<Integer>();

  private String input = "";
  private String user = "";

  int cellSize_cols;
  int cellSize_rows;
  int times;
  int turn_var;
  boolean win;

  //TODO: Change background color according to the turn

  void layout() {
    positions = new int[rows][cols];
    keylay = new int[rows][cols];
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
    //System.out.println(rows * rows);
    //System.out.println();
    for(int w = 1;
    w <=(rows * rows);
    w++) {
      System.out.println(w);
      int i=w;
      keys.add(w-1,i);
      //System.out.print(keys.get(i-1)+ " ");

    }
    //System.out.println();
    int r = 0;

    for (int t=0; t<rows; t++) {
      for (int e=0; e<rows; e++) {
        keylay[t][e] = keys.get(r);
        r++;
      }
    }
    for (int q=0; q<rows; q++) {
      for (int u=0; u<rows; u++) {
        String num = Integer.toString(keylay[q][u]);

        if (user.equals(num)) {
          //fill(0);
          positions[q][u] = turn_var;
          //println(num + " pressed!");
          // image(o, 0, 0, 200, 200);
        }
        //System.out.print(positions[q][u]);
      }
      System.out.println();
    }
    /** char num=(char)(i + '0'); // Convert integer to character
    if (keyPressed && key == num) {
      // The key corresponding to the number 'i' is pressed
      fill(0);
      positions[0][0] = 1;
      println(key + " pressed!");
      // image(o, 0, 0, 200, 200);
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
  //println("ran");
  turn();
  int row = mouseY /(height / rows);
  int col = mouseX /(width / cols);
  //println(row+","+col+"="+turn_var);
  positions[row][col] = turn_var;

}


void drawGrid() {
  background(248, 248, 248);
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
      //System.out.println("You won by rows");
      textSize(40);
      text("WON!!", width/2, height/2);
      drawConfetti(0);
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
      //System.out.println("You won by cols");
      textSize(40);
      text("WON!!", width/2, height/2);
      drawConfetti(0);
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
      //System.out.println("You won by dia");
      textSize(40);
      text("WON!!", width/2, height/2);
      drawConfetti(0);
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
          //System.out.println("No winning symbol found on the diagonal.");
          break;
        }
      }
      else if (positions[i][cols - 1 - i] != winningSymbol) {
        //System.out.println("Winning symbol not found on the diagonal.");
        break;
      }
      else if (i == rows - 1) {
        //System.out.println("Diagonal win detected!");
        //diagonalWin = true;
        win=true;
      }
    }
  }
  //System.out.println(" hor_x "+hor_x);
  //System.out.println(" ver_x "+ver_x);
  //System.out.println(" dia_x "+dia_x);

  //

}

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
    textSize(40);
    text("Tie game", width/2, height/2);

    //pg = 3;

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

void turn() {
  times++;
  turn_var=(times%2)+1;
}
}
