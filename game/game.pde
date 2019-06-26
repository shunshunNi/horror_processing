int gseq = 2;
Textbox prologueText1;
//float displayWidth = 1280;
//float displayHight = 720;
void setup(){
  size(1280, 720, P2D);
  prologueText1 = new Textbox("test");
}

void draw(){
  switch(gseq){
    case 0: title();
    case 1: prologue();
    case 2: gamePlay();
    case 3: gameOver();
  }
}
/*
void mapLoad(int[][] a, int n){
  String[] tmp = loadStrings(str(char(n)) + ".dot");
  tmp = split(tmp, ',');
  for (int i = 0; i <= 2; i++){
    a[i]    = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
    a[i+23] = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1};
  }
  for (int i = 0; i < 400; i++){

  }
}
*/
