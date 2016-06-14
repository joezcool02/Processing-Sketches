import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

float xoff = width/2;
float xincrement = 0.005; 
float yoff = height/2;
float yincrement = 0.005; 

import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioPlayer song;
AudioInput input;

void setup()
{
  size(1280, 720);
  background(0);
  
  minim = new Minim(this);
   frameRate(30);
  // specify 512 for the length of the sample buffers
  // the default buffer size is 1024
  song = minim.loadFile("Toto.mp3", 512);
  song.play();
}


void draw()
{

  fill(0, 10);
  rect(0,0,width,height);
  noStroke();
  // we draw the waveform by connecting neighbor values with a line
  // we multiply each of the values by 50 
  // because the values in the buffers are normalized
  // this means that they have values between -1 and 1. 
  // If we don't scale them up our waveform 
  // will look more or less like a straight line.
  
    //fill(255, 10);

  //background(0);
  //rect(0,0,width,height);
  //stroke(255);
  
  fill(255);
  for(int i = 0; i < song.bufferSize() - 1; i++)
  {
    rect(0,0,1280, song.left.get(i+1)*600);
       // With each cycle, increment xoff
        xincrement =song.left.get(i+1);
        yincrement =song.left.get(i+1);
  }
  
   // Get a noise value based on xoff and scale it according to the window's width
   float n = noise(xoff)*width;
   float m = noise(yoff)*height;
    
   // With each cycle, increment xoff
   xoff += xincrement;
   yoff -= yincrement;
   

   // Draw the ellipse at the value produced by perlin noise
   fill(0,180,186);
   ellipse(n,m, 64, 64);
   fill(253,121,130);
   ellipse(width - n,height - m, 64, 64);
   
   saveFrame("Africa/line-######.png");
 
}