class O{

float radius = 10; // Initial radius
float maxRadius = 100; // Maximum radius
float growthRate = 0.5f; // Growth speed

  void layout(){
    frameRate(60);
    stroke(0); // Set outline color
  strokeWeight(2); // Set outline thickness
  
  }
  void display(){
// Calculate the current radius based on growth rate and time
  radius += growthRate;

  // Stop growing when reaching maximum radius
  if (radius >= maxRadius) {
    radius = maxRadius;
  }

  // Draw the O using ellipse with no fill
  ellipse(width/2, height/2, radius, radius);
  
  }


}
