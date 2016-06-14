int animationCount = 0;
boolean isIncreasing = true;
int topLeftX = 0;
int topLeftY = 0;
int topRightX = 400;
int topRightY = 0;
int bottomRightX = 400;
int bottomRightY = 400;
int bottomLeftX = 0;
int bottomLeftY = 400;

void setup(){
  size(400,400);
}

void draw(){
  background(255);
  
  fill(0);
  
  ellipse((animationCount * mouseX) / 100, (animationCount * mouseY) / 100, 25,25);
  ellipse(400 - ((animationCount * (400-mouseX)) / 100), (animationCount * mouseY) / 100, 25,25);
  ellipse(400 - ((animationCount * (400-mouseX)) / 100), 400 - ((animationCount * (400-mouseY)) / 100), 25,25);
  ellipse(((animationCount * mouseX) / 100), 400 - ((animationCount * (400-mouseY)) / 100), 25,25);
  
  line(topLeftX, topLeftY, mouseX, mouseY);
  line(topRightX, topRightY, mouseX, mouseY);
  line(bottomRightX, bottomRightY, mouseX, mouseY);
  line(bottomLeftX,bottomLeftY, mouseX, mouseY);


  if(animationCount >= 100){
     isIncreasing = false;
  } else if(animationCount <= 0){
    isIncreasing = true;
  }
  
  if(isIncreasing){
    animationCount++;
  } else {
   animationCount--; 
  }};