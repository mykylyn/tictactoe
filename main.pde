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

InfoPage infopg = new InfoPage();
Tictactoe tttpg = new Tictactoe();
landingPage home = new landingPage();
BPage end= new BPage();

// Organizer pgmg= new Organizer();

public void setup() {
  size(800, 800);

  //landing screen
  home.layout();
  //info screen
  infopg.layout();

  //end.layout();
}

public void draw() {
  if (pg == 0) {
    home.display();

  }
  else if (pg == 1) {
    infopg.display();
    // infopg.decide();
    infopg.starter();
    tttpg.layout();

    //tttpg.decide();
  }
  else if (pg == 2) {
    tttpg.display();

    if (won) {
      System.out.println("YOU WON!!");
      //tttpg.reset();
      pg = 3;
      win_record.add(won);
      won=false;
    }
    finished = true;

  }
  else if (pg == 3) {
    //end.display();
  }
  //if (positions.length()>0) {
  }

void keyPressed() {
  if (pg == 0) {
    // home.display();

  }
  else if (pg == 1) {
    infopg.decide();
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
  }
  else if (pg == 2) {
  }
  else if (pg == 3) {
  }
}
