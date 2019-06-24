int gseq = 0;

void setup(){
  size(1280,720,P2D);
}

void draw(){
  switch(gseq){
    case 0: title();
    case 1: prologue();
    case 2: gamePlay();
    case 3: gameOver();
  }
}
