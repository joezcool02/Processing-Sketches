void setup() {
  size(1280, 720, P3D);
  background(0);
  noStroke();
}

void draw() {
  pointLight(238,232,0, mouseX, mouseY, 1000);
  translate(1280/2, 720/2, 0);
  sphere(300);
}