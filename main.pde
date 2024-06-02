import processing.dxf.*;

// the error is in the ending class
// TODO: intergrate the dynamic tic tac toe grid to the Tictactoe pg XXXXX
// TODO: Make the networking work
// TODO: Make the rounds functionality work
  //TOD0: Need to make the update functionality effecient
// TODO: Make the point functionality work
// TODO: The circle is not centered
// TODO: Repeated modification to already filled boxes

int pg = 0;
int rows = 3;
int cols = 3;
int round = 1;
boolean finished = false;

InfoPage infopg = new InfoPage();
Tictactoe tttpg = new Tictactoe();
landingPage home = new landingPage();
// Ending end= new Ending();

// Organizer pgmg= new Organizer();

public void setup() {
  size(1000, 800);

  // landing screen
  home.layout();
  // info screen
  infopg.layout();

  // end.layout();
}

public void draw() {
  System.out.println("I ran");
  if (pg == 0) {
    home.display();

  } else if (pg == 1) {
    infopg.display();
    // infopg.decide();
    infopg.starter();
    tttpg.layout();
    //tttpg.decide();
  } else if (pg == 2) {
    tttpg.display();
    System.out.println("I ran inside");

  } else if (pg == 3) {
    home.display();
  }

  // if(positions.length()>0){}
}

void keyPressed() {
  loop();
  if (pg == 0) {
    // home.display();

  } else if (pg == 1) {
    infopg.decide();
  } else if (pg == 2) {
    tttpg.positioning();

  } else if (pg == 3) {
    // home.display();
  }
}

void mousePressed() {
  
  if (pg == 0) {
    home.mouseEvents();

  } else if (pg == 1) {
    
  } else if (pg == 2) {
    

  } else if (pg == 3) {
    
  }
}
