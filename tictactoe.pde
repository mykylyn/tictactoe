class Tictactoe{
  
  PImage x;
  PImage o;
  int dim=3;
  
  int[][] positions= new int[dim][dim];

  void layout(){
    x = loadImage("x.png");
    o = loadImage("o.png");
  }
  
  void display(){
     background(248,248,248);
   strokeWeight(4);
  line(0, height/dim, width, height/dim);
  line(0, (height/dim)*2, width, (height/dim)*2);
  
  line(width/dim, 0, width/dim, height);
  line((width/dim)*2, 0, (width/dim)*2, height);
  
   for(int i=0; i<dim;i++){
    for(int x=0; x<dim;x++){
      if(positions[i][x]==0){
        
      } 
      else if(positions[i][x]==1){
         image(o,(width/dim)*x, (height/dim)*i, 200,200);
       }
       else if(positions[i][x]==2){
       
       }
  
    }
  
  }
  
  
  }
  
  void positioning(){
  
    if (key == '7') {
    // The 7 key was pressed (or released)
    fill(0);
    positions[0][0]=1;
    println(key +" pressed!");
    //image(o, 0, 0, 200,200);
    
  }
  else if (key == '8') {
    // The 7 key was pressed (or released)
    fill(0);
    positions[0][1]=1;
    println(key +" pressed!");
  }
  else if (key == '9') {
    // The 7 key was pressed (or released)
    fill(0);
    positions[0][2]=1;
    println(key +" pressed!");
  }
  else if (key == '4') {
    // The 7 key was pressed (or released)
    fill(0);
    positions[1][0]=1;
    println(key +" pressed!");
  }
  else if (key == '5') {
    // The 7 key was pressed (or released)
    fill(0);
    positions[1][1]=1;
    println(key +" pressed!");
  }
  else if (key == '6') {
    // The 7 key was pressed (or released)
    fill(0);
    positions[1][2]=1;
    println(key +" pressed!");
  }
  else if (key == '1') {
    // The 7 key was pressed (or released)
    fill(0);
    positions[2][0]=1;
    println(key +" pressed!");
  }
  else if (key == '2') {
    // The 7 key was pressed (or released)
    fill(0);
    positions[2][1]=1;
    println(key +" pressed!");
  }
  else if (key == '3') {
    // The 7 key was pressed (or released)
    fill(0);
    positions[2][2]=1;
    println(key +" pressed!");
  }
  
  
  }


}
