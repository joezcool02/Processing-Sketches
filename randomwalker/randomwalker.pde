int drawX;
int drawY;
float r;
float r2;
import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
AudioPlayer song;
FFT fft;
 
void setup()
{
    fill(0);
  size(1280,720);
  drawX = width/2;
  drawY = height/2;
  
  // always start Minim first!
  minim = new Minim(this);
 
  // specify 512 for the length of the sample buffers
  // the default buffer size is 1024
  song = minim.loadFile("Bowie.mp3", 512);
  song.play();
 
  // an FFT needs to know how 
  // long the audio buffers it will be analyzing are
  // and also needs to know 
  // the sample rate of the audio it is analyzing
  fft = new FFT(song.bufferSize(), song.sampleRate());
}
//song.left.get(i)*500
void draw() {
  fill(255);
  point(drawX, drawY);
  ellipse(drawX,drawY,50,50);
  
  r = random(1);
  r2 = song.left.get(0)*500;
  
  if (r <= 0.5){
     drawX+= int(r2); 
  } else {
    drawX-= int(r2);
  }
  
    r = random(1);
  if (r <= 0.5){
     drawY+= int(r2); 
  } else {
    drawY-= int(r2);
  }
  
}