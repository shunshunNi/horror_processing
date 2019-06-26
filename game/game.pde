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
  String[] loaded = loadStrings(str(char(n)) + ".dot");
  loaded = split(tmp, ',');
  for (int i = 0; i <= 2; i++){
    for (int j = 0; j <= 25; j++){
      a[i][j]    = 1;
      a[i+23][j] = 1;
    }
  }
  for (int i = 0; i < 400; i++){
    a[i/20 + 3][(i+2)%20] = loaded[i+2];
  }
}
*/
