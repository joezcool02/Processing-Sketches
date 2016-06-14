char[] Alpha = new char[]{'S','W'};
//https://forum.processing.org/two/discussion/6908/how-to-make-objects-move-with-pressing-either-the-up-down-left-right-key
//void setup(){
//  size(1280,720);
//  background(0);
//}

//void draw(){
//  fill(0,255,0);
//  text(Alpha[int(random(3))],random(width),5);
//}
import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioPlayer song;
FFT fft;
 

Rain r1;

int numDrops = 15;
Rain[] drops = new Rain[numDrops]; // Declare and create the array

void setup() {
  size(1280,720);
  background(0);
  smooth();
  noStroke();
  frameRate(30);
  
  minim = new Minim(this);
 
  // specify 512 for the length of the sample buffers
  // the default buffer size is 1024
  song = minim.loadFile("Greek.mp3", 512);
  song.play();
 
  // an FFT needs to know how 
  // long the audio buffers it will be analyzing are
  // and also needs to know 
  // the sample rate of the audio it is analyzing
  fft = new FFT(song.bufferSize(), song.sampleRate());
  
  
  //Loop through array to create each object
  for (int i = 0; i < drops.length; i++) {

    drops[i] = new Rain(); // Create each object
    r1 = new Rain();
  }
}

void draw(){
  fill(255,80);
  //Loop through array to use objects.
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
  }
  
  fill(0,0,0,10);
  rect(0,0,width,height);

  saveFrame("temp/anim_####.png");
}

class Rain {
  float r = random(width);
  float y = random(-height);

  void fall() {
    y = y + random(40);
    fill(232,227,105);
    textSize(26); 
    text(Alpha[int(random(2))],r,y);
   if(y>height){
   r = random(width);
   y = random(-200);
   }

  }
}