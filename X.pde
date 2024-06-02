class X{

  float progress = 0;
  float totalFrames = 100; // Adjust this for longer/shorter animation
  int size =100;
  void layout(){
    frameRate(60);
  
  }
  void display(){
  // Calculate progress for each frame
  progress += 1 / totalFrames;
  
  // Calculate line lengths based on progress
  float lineLength = progress * size / 2;
  
  // Draw the X
  stroke(0);
  strokeWeight(2);
  line(width/2 - lineLength, height/2 - lineLength, width/2 + lineLength, height/2 + lineLength);
  line(width/2 + lineLength, height/2 - lineLength, width/2 - lineLength, height/2 + lineLength);
  
  // Check if animation is complete and draw the stable X
  if (progress >= 1) {
    line(width/2 - lineLength, height/2 - lineLength, width/2 + lineLength, height/2 + lineLength);
    line(width/2 + lineLength, height/2 - lineLength, width/2 - lineLength, height/2 + lineLength);
    noLoop(); // Stop animation after completion
  }
  
  
  }


}
