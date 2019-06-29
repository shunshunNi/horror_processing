int gseq = 0;
Textbox prologueText1;
//float displayWidth = 1280;
//float displayHight = 720;
void setup(){
  size(1280, 720, P2D);
  //prologueText1 = new Textbox("test");
  mapLoad(map2,"2");
  currentMap = map2;
}

void draw(){
  println(gseq);
  switch(gseq){
    case 0: title();
    break;
    //case 1: prologue();
    case 2: gamePlay();
    break;
    case 3: gameOver();
    break;
    case 4: gameClear();
  }
}

void mapLoad(int[][] a, String n){
  String[] loaded = loadStrings(n + ".dot");
  String[] tmp = split(loaded[0], ',');
  for (int i = 0; i <= 2; i++){
    for (int j = 0; j <= 25; j++){
      a[i][j]    = 1;
      a[i+23][j] = 1;
    }
  }
  for (int i = 0; i <= 19; i++){
    for (int j = 0; j<= 2; j++){
      a[i+3][j]    = 1;
      a[i+3][j+23] = 1;
    }
  }
  for (int i = 0; i < 400; i++){
    if (tmp[i+2].equals("0")){
      a[(i/20) + 3][i%20 + 3 ] = 0;
    } else{
      a[(i/20) + 3][i%20 + 3 ] = 1;
    }
  }
}
