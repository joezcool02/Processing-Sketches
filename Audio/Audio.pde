import ddf.minim.*;
 
Minim minim;
AudioPlayer song1;
AudioPlayer song2;
 
void setup()
{
  size(400, 400);
 
  minim = new Minim(this);
 
  // this loads mysong.wav from the data folder
  song1 = minim.loadFile("Tiger1.mp3");
  song2 = minim.loadFile("Tiger2.mp3");
  song1.play();
  song2.play();
}
 
void draw()
{
  background(0);
  
  for(int i = 0; i < song1.bufferSize() - 1; i++)
  {
    stroke(0,song2.left.get(i)*1000 + 100,0);
    fill(0,song2.left.get(i)*1000 + 100,0);
    rect(200,200,-song2.left.get(i)*1000,song2.left.get(i)*1000);
    
    stroke(song1.left.get(i)*1000 + 100,0,0);
    fill(song1.left.get(i)*1000 + 100,0,0);
    rect(200,200,song1.right.get(i)*1000,song1.right.get(i)*1000);
    //
  }
  
  saveFrame("output-####.png");
}