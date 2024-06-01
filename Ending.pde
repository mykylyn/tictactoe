class Ending{

  int EbuttonWidth = 200;
  int EbuttonHeight = 50;
  int EbuttonX;
  int EstartButtonY;
  int EexitButtonY;
  
  boolean EstartGame = false;
  boolean EexitGame = false;

  void layout(){
    EbuttonX = width / 2 - EbuttonWidth / 2;
    EstartButtonY = height / 2 - EbuttonHeight - 10;
    EexitButtonY = height / 2 + 10;
  
  
  }
  
  void display(){
  
   background(255);

  textAlign(CENTER, 50);
  textSize(100);
  fill(0);
  text("Good job", width / 2, height / 3);

  // start button
  if (EoverButton(EbuttonX, EstartButtonY, EbuttonWidth, EbuttonHeight)) {
    fill(100, 150, 255);
  } else {
    fill(0, 100, 200);
  }
  rect(EbuttonX, EstartButtonY, EbuttonWidth, EbuttonHeight);
  fill(255);
  textSize(24);
  text("Go back to home", EbuttonX + EbuttonWidth / 2, EstartButtonY + EbuttonHeight / 2);




/**exit button
  if (overButton(EbuttonX, exitButtonY, EbuttonWidth, EbuttonHeight)) {
    fill(255, 100, 100);
  } else {
    fill(200, 0, 0);
  }
  rect(EbuttonX, exitButtonY, EbuttonWidth, EbuttonHeight);
  fill(255);
  textSize(24);
  text("Multiplayer", EbuttonX + EbuttonWidth / 2, exitButtonY + EbuttonHeight / 2);
  
  
 **/







}

boolean EoverButton(int x, int y, int width, int height) {
  return mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height;
}


void Click(){

if (EoverButton(EbuttonX, EstartButtonY, EbuttonWidth, EbuttonHeight)) {
    EstartGame = true;
    println("Start Game button clicked");
    pg=0;
    

}
