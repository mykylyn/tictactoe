import processing.dxf.*;

// the error is in the ending class
// TODO: intergrate the dynamic tic tac toe grid to the Tictactoe pg XXXXX
// TODO: Make the networking work
// TODO: Make the rounds functionality work
//TOD0: Need to make the update functionality effecient
// TODO: Make the point functionality work
// TODO: The circle is not centered
// TODO: Repeated modification to already filled boxes
// TODO: Have to make sure the you are be to change fields already filled

int pg = 0;
int rows = 3;
int cols = 3;
int rounds = 2;
int[][] positions;

int cellSize_cols;
int cellSize_rows;

ArrayList<Boolean> win_record= new ArrayList<Boolean>();
boolean finished = false;
boolean won = false;
int turn_var;

boolean x_won;
boolean o_won;

boolean tie;
boolean xWins = false;
boolean oWins = false;



boolean done_in=false;

boolean make_sure=true;

int nim;



int hor_x = 0;
int ver_x = 0;
int dia_x = 0;

int hor_o = 0;
int ver_o = 0;
int dia_o = 0;

int dia_x2 = 0;
int dia_o2 = 0;




InfoPage infopg = new InfoPage();
Tictactoe tttpg = new Tictactoe();
landingPage home = new landingPage();
//BPage end= new BPage();

BBEnd go= new BBEnd();

// Organizer pgmg= new Organizer();

public void setup() {
  size(800, 800);

  //landing screen
  home.layout();
  //info screen
  //infopg.layout();

  //end.layout();
}

boolean overButton(int x, int y, int w, int h) {
  return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
}

public void draw() {
  background(0, 0, 255);
  if (pg == 0) {
    home.display();

  }
  else if (pg == 1) {
    infopg.display();
    // infopg.decide();
    //infopg.starter();
    tttpg.layout();

    //tttpg.decide();
  }
  else if (pg == 2) {
    
    tttpg.display();

    if (xWins || oWins || tie) {
      System.out.println("YOU WON!!");
      //tttpg.reset();
      pg = 3;
      win_record.add(won);
      won=false;
    }
    finished = true;
    

  }
  else if (pg == 3) {
    go.display();
    
  }
  //if (positions.length()>0) {
  }

void keyPressed() {
  if (pg == 0) {
    // home.display();

  }
  else if (pg == 1) {
    //infopg.decide();
  }
  else if (pg == 2) {
    tttpg.positioning();

  }
  else if (pg == 3) {
    //end.stop();

  }
}

void mousePressed() {
  if (pg == 0) {
    home.mouseEvents();

  }
  else if (pg == 1) {
    infopg.mouseClicked();
  }
  else if (pg == 2) {
    tttpg.mouseClicked();
  }
  else if (pg == 3) {
    go.mouseClicked();
  }
}
