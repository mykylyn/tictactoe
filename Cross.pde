class Cross{

int startX ; // Starting x-coordinate of the line
  int endX ; // Current x-coordinate of the line
  int speed ;
boolean reachedEnd;

int size;


void layout(){

stroke(0);
  strokeWeight(2);
  startX = 0;
  endX = 0;
  speed = 2;
  reachedEnd = false; // Flag to track if the line reached the end
  size=width;



}

void display(){

// Update the line's x-coordinate
  endX += speed;

  // Check if the line reached the end
  if (endX >= size) {
    endX = size;
    reachedEnd = true;
  }

  // Change the line color if reached the end
  if (reachedEnd) {
    stroke(255, 0, 0); // Change to red when reaching the end
  }

  // Draw the line
  line(startX, height/2, endX, height/2);


}





}
