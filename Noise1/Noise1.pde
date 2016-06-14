float xoff = width/2;
float xincrement = 0.005; 
float yoff = height/2;
float yincrement = 0.005; 

void setup() {
  size(1280, 720);
  background(0);
  noStroke();
}

void draw() {
  // Create an alpha blended background
  fill(0, 10);
  rect(0,0,width,height);
  
  //float n = random(0,width);  // Try this line instead of noise
  
  // Get a noise value based on xoff and scale it according to the window's width
  float n = noise(xoff)*width;
  float m = noise(yoff)*height;
  
  // With each cycle, increment xoff
  xoff += xincrement;
  yoff -= yincrement;
  
  // Draw the ellipse at the value produced by perlin noise
  fill(200);
  ellipse(n,m, 64, 64);
}