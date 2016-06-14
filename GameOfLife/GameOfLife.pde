int[][] board;
int value = 0;

void setup(){
  size(500,500);
  frameRate(5);
  board = new int[10][10];
  board[5][5] = 1;
  
  stroke(0,255,0);
   for (int y = 0; y < 10; y++) {
    for (int x = 0; x < 10; x++) {
      if(board[x][y] == 1){
        fill(0,value,0);
        rect(x*50,y*50,50,50);
      } else {
        fill(0);
        rect(x*50,y*50,50,50);
      }
      
    }
  }
}

void draw(){
   if (keyPressed) {
    if (key == 'r' || key == 'R') {
      for (int y = 0; y < 10; y++) {
        for (int x = 0; x < 10; x++) {
          board[x][y] = int(random(2));
        }
      }
    }
  }
  
  
  int[][] newBoard = board;
  
  for (int y = 0; y < 10; y++) {
    for (int x = 0; x < 10; x++) {
     
        
        if(getCount(x,y) <= 2){
          newBoard[x][y] = 0;
        } else if (getCount(x,y) == 3) {
          newBoard[x][y] = 1;
        } else if (getCount(x,y) >= 4) {
          newBoard[x][y] = 0;
        }
      
    }
  } 
  
  board = newBoard;
  
   for (int y = 0; y < 10; y++) {
    for (int x = 0; x < 10; x++) {
      if(board[x][y] == 1){
        fill(0,255,0);
        rect(x*50,y*50,50,50);
      } else {
        fill(0);
        rect(x*50,y*50,50,50);
      }
    }
  }
  
  
}

void mouseClicked() {
  int cellX = mouseX / 50;
  int cellY = mouseY / 50;
  
  if(board[cellX][cellY] == 1){
    board[cellX][cellY] = 0;
  } else {
    board[cellX][cellY] = 1;
  }
}

void keyPress(){
  if(key == 'r'){
   for (int y = 0; y < 10; y++) {
    for (int x = 0; x < 10; x++) {
      board[x][y] = int(random(1));
      print("running");
    }
  }
  }
}

int getCount(int x, int y){
   int count = board[x][y];
   
   if(x == 9){
     x = 8;
   }
   if(y == 9){
     y = 8;
   }
   if(x == 0){
     x = 1;
   }
   if(y == 0){
     y = 1;
   }
   
   if(board[x + 1][y] == 1){
     count += 1;
   }
   if(board[x - 1][y] == 1){
     count += 1;
   }
   if(board[x][y + 1] == 1){
     count += 1;
   }
   if(board[x][y - 1] == 1){
     count += 1;
   }
   if(board[x + 1][y + 1] == 1){
     count += 1;
   }
   if(board[x + 1][y - 1] == 1){
     count += 1;
   }
   if(board[x - 1][y + 1] == 1){
     count += 1;
   }
   if(board[x - 1][y - 1] == 1){
     count += 1;
   }
   return count;
}