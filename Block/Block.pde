
myRect aRect,bRect; 

void setup(){
  size(400,400);
    aRect = new myRect(int(random(width)),int(random(height)));
}

void draw(){

  
  aRect.thisDraw();
  if(frameCount<1024){
    saveFrame("temp/anim_#####.png");
  }
}

class myRect{
   int w;
   int h;
   int countDown = 50;
   
   myRect(int iw , int ih){
     w = iw;
     h = ih;
   }
   
    void thisDraw () {
      if(countDown == 0){
         this.w = int(random(width));
         this.h = int(random(height));
         countDown = int(random(width));
      }
      rect(countDown,countDown,w,h);
      this.countDown = countDown - 1;
    }  
}