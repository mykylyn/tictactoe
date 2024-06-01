import processing.dxf.*;

//the error is in the ending class
//TODO: intergrate the dynamic tic tac toe grid to the Tictactoe pg
//TODO: Make the networking work
//TODO: Make the rounds functionality work
//TODO: Make the point functionality work

int pg=0;




InfoPage infopg=new InfoPage();
Tictactoe tttpg=new Tictactoe();
landingPage home=new landingPage();
Ending end= new Ending();

//Organizer pgmg= new Organizer();

public void setup() {
  size(1000,800);
  
  
  //landing screen
  home.layout();
  //info screen
  infopg.layout();
  
  end.layout();
  
  
}





public void draw(){
    if(pg==0){
      home.display();
  
    }
    else if(pg==1){
      infopg.display();
      //infopg.decide();
      infopg.starter();
    }
    else if(pg==2){
      tttpg.display();
      
  
    }
    else if(pg==3){
     end.display();
  
    }
 
  
  
 
  
   
  //if(positions.length()>0){}
  
}

void keyPressed() {  
   infopg.decide();
 
}


void mousePressed() {
  home.mouseEvents();

}
