PShape bot;
float xoff = width/2;
float xincrement = 0.005; 
float yoff = height/2;
float yincrement = 0.005; 

//void setup() {
//  size(1280, 720);
//  // The file "bot1.svg" must be in the data folder
//  // of the current sketch to load successfully
//  
//} 

//void draw(){
//  background(102);
//              // Draw at coordinate (280, 40) at the default size
//}

import ddf.minim.*;
import ddf.minim.analysis.*;
 
Minim minim;
AudioPlayer song;
FFT fft;
 
void setup()
{
  size(1280, 720);
 frameRate(30);
 bot = loadShape("Nick.svg");
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
 
void draw()
{
  background(0);
  fft.forward(song.mix);
  //song.left.get(i)
  xincrement =song.left.get(1);
  yincrement =song.left.get(1);
  
     // Get a noise value based on xoff and scale it according to the window's width
   float n = noise(xoff)*width;
   float m = noise(yoff)*height;
    
   // With each cycle, increment xoff
   xoff += xincrement;
   yoff -= yincrement;
   
   
  shape(bot, 0, 0,768 + 1280*yincrement,640 + 720*xincrement);
  
}