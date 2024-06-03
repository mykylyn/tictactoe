class Tictactoe {
    PImage x;
    PImage o;
    
    int dim = 3;
    
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
        
        for (int i = 0; i < rows; i++) {
            for (int x = 0; x < cols; x++) {
                if (positions[i][x] == 0) {
                } else if (positions[i][x] == 1) {
                    image(o,(float)((width / rows) * x),(float)(height / cols) * i,
                       (float) cellSize_rows,(float) cellSize_cols);
                } else if (positions[i][x] == 2) {
                }
        }
        }
        win();
        decide();
        
}
    
    void positioning() {
        if (key >= '0' && key <= '9') {
           // Thekey corresponding to the number 'i' is pressed
            
            input += key;
           // println("User input: " + key);
        }
        if (keyCode == ENTER) {
           // Do something with the user input (e.g., print it)
            //println("User input: " + input);
            user =input;
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
                    //println(num + " pressed!");
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
            line(j* cellSize_cols, 0, j * cellSize_cols, rows * cellSize_cols);
        }
}
    void win() {
        boolean diagonalWin = false;
        int winningSymbol = 1; // 1 integer
        int hor = 0;
        int ver = 0;
        int dia = 0;
        //when type 3*4 some error happened about out of bound
        for (int q = 0; q < rows; q++) {
            for (int u = 0; u < rows; u++) {
                if (positions[q][u] ==  1) {
                    hor++;
            }
                else if (positions[u][q] ==  1) {
                    ver++;
            }
        }
            
        }
        
        // Check the main diagonal
        for (int i = 0; i < rows; i++) {
            if (positions[i][i] != 0) { // Changed to check for non-zero value
                //System.out.println("10   "+positions[i][i]);
                if (i == 0) {
                    //System.err.println(positions[i][i]);
                    winningSymbol = positions[i][i];
                } else if (positions[i][i] != winningSymbol) {
                    //System.out.println("hi");
                    break;
                } else if (i == rows - 1) {
                    //System.out.println("hi2");
                    diagonalWin = true;
                    
                    
                }
            }
        }
        
        if (!diagonalWin) {
            // Check the secondary diagonal
            for (int i = 0; i < rows; i++) {
                if (i == 0) {
                    winningSymbol = positions[i][cols - 1 - i];
                    if (winningSymbol == 0) { // Changed to check for non-zero value
                        //System.out.println("No winning symbol found on the diagonal.");
                        break;
                    }
                } else if (positions[i][cols - 1 - i] != winningSymbol) {
                    //System.out.println("Winning symbol not found on the diagonal.");
                    break;
                } else if (i == rows - 1) {
                    //System.out.println("Diagonal win detected!");
                    diagonalWin = true;
                }
            }
        }
        
        
        if (hor ==  rows || ver ==  cols) {
            //System.out.println("You won");
            won = true;
            
        }
        elseif (diagonalWin) {
            won = true;
        }
        
        
        
}
    
    void decide() {
        int count = 0;
        for (int q = 0; q < rows; q++) {
            for (int u = 0; u < cols; u++) {
                if (positions[q][u] ==  1 || positions[q][u] ==  2) {
                    count++;
                    //System.out.println("update made");
                }
        }
        }
        
        if (count ==  rows * cols) {
            pg = 3;
            
        }
        
}
}
