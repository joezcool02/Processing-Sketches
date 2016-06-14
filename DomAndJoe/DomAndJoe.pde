import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
AudioPlayer song;
FFT fft;
 
void setup()
{
  size(512, 512);
 frameRate(10);
  minim = new Minim(this);
 
  song = minim.loadFile("Spooky.mp3", 512);
  song.play();
 
  fft = new FFT(song.bufferSize(), song.sampleRate());
}

void skull(int x,int y,int size) {
  strokeWeight(0);
  ellipse(x, y, size, size);
  rect(x-size/4, y-size/4, size/2, size);
  fill(size, size, size);
  ellipse(x+size/6, y, size/5, size/4);
  ellipse(x-size/6, y, size/5, size/4);
  stroke(0);
    filter(BLUR,5);
  strokeWeight(2);

  line(random(width), random(height),random(width), random(height));
}
 
void draw()
{
  background(0);
  fft.forward(song.mix);
 

  stroke(0);
  for(int i = 0; i < fft.specSize(); i++)
  {
    float n1 = noise(random(1))*width;
    float n2 = noise(random(1))*height;
    if(fft.getBand(i)*100 > 60){
      fill(255, 255-fft.getBand(i)*2, 0);
      if (fft.getBand(i) > 50) {
        skull(int(mouseX+random(50)), int(mouseY+random(50)), int(fft.getBand(i)));
      }
      
    }
  }
 
  //stroke(255);
  //for(int i = 0; i < song.left.size() - 1; i++)
  //{
  //  line(i, 225 + song.left.get(i)*500, i+1, 275 + song.left.get(i+1)*500);
  //}
  
}