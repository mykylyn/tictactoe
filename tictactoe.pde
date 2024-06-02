class Tictactoe {
  //PImage x;
  //PImage o;

  int dim = 3;

  int[][] positions;
  int[][] keylay;
  ArrayList<Integer> keys = new ArrayList<Integer>();

  private String input = "";

  private String user = "";

  int cellSize_cols;
  int cellSize_rows;
  
  X x;

  void layout() {
    positions = new int[rows][cols];
    keylay = new int[rows][cols];
    x= new X(width/2,height/2);
    //x = loadImage("x.png");
    //o = loadImage("o.png");
  }

  void display() {
    background(248, 248, 248);
    

    /**
    //the grid maker
   line(0, height/dim, width, height/dim);
   line(0, (height/dim)*2, width, (height/dim)*2);

   line(width/dim, 0, width/dim, height);
   line((width/dim)*2, 0, (width/dim)*2, height);

   *
 */
    drawGrid();
    
    x.display();

    for (int i = 0; i < rows; i++) {
      for (int u = 0; u < cols; u++) {
        if (positions[i][u] == 1) {
         // image(o, (float) ((width / rows) * x), (float) (height / cols) * i,
          //    (float) cellSize_rows, (float) cellSize_rows);
          int nx=(width / rows) * u;
          int ny=(height / cols) * i;
          x=new X(nx,ny);
        } else if (positions[i][u] == 2) {
        }
      }
    }
    
    decide();
  }

  void positioning() {
    if (key >= '0' && key <= '9') {
      // The key corresponding to the number 'i' is pressed

      input += key;
      // println("User input: " + key);
    }
    if (keyCode == ENTER) {
      // Do something with the user input (e.g., print it)
      println("User input: " + input);
      user = input;
      // Clear the string for new input
      input = "";
    }

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

    for (int q = 0; q < rows; q++) {
      for (int u = 0; u < cols; u++) {
        String num = Integer.toString(keylay[q][u]);
        if (user.equals(num)) {
          fill(0);
          positions[q][u] = 1;
          println(num + " pressed!");
          // image(o, 0, 0, 200, 200);
        }
      }
    }

    /**
  char num = (char) (i + '0'); // Convert integer to character
  if (keyPressed && key == num) {
    // The key corresponding to the number 'i' is pressed
    fill(0);
    positions[0][0] = 1;
    println(key + " pressed!");
    // image(o, 0, 0, 200, 200);
  }
}
*
*/

    /**
        for (int t = 0; t < rows; t++) {

            for (int e = 0; e < cols; e++) {

              System.out.print(keylay[t][e]);;
            }
            System.out.println();

          }

          *
     */
  }
  void drawGrid() {
    background(248, 248, 248);
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
  
  void decide(){
    int count=0;
    for (int q = 0; q < rows; q++) {
      for (int u = 0; u < cols; u++) {
        if (positions[q][u]==1 || positions[q][u]==2) {
          count++;
          //System.out.println("update made");
        }
      }
    }
    
    if(count==rows*cols){
      pg=3;
    
    }
  
  }
}
