int pPosX = 3;
int pPosY = 3;
int pDir  = 0; //up
int[][] map1 = {{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
                {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
                {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
                {1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1},
                {1,1,1,0,1,1,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,1},
                {1,1,1,0,1,1,1,1,1,0,1,0,1,0,1,1,1,1,1,1,0,0,0,1,1,1},
                {1,1,1,0,1,1,0,0,0,0,1,0,0,0,0,0,0,0,1,1,0,1,0,1,1,1},
                {1,1,1,0,1,1,0,1,1,0,1,1,1,1,1,0,1,0,1,1,0,1,0,1,1,1},
                {1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,1,0,0,1,0,1,1,1},
                {1,1,1,0,1,1,1,1,0,1,1,1,0,0,1,1,1,0,1,1,0,1,0,1,1,1},
                {1,1,1,0,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,1,1,1},
                {1,1,1,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1},
                {1,1,1,1,0,0,0,1,0,0,0,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1},
                {1,1,1,1,0,1,1,1,0,1,1,0,0,0,0,0,0,0,0,0,1,0,1,1,1,1},
                {1,1,1,1,0,0,0,0,0,1,1,0,1,1,1,1,1,1,1,0,1,0,1,1,1,1},
                {1,1,1,1,0,1,1,1,1,1,1,0,0,0,1,0,1,0,0,0,0,1,1,1,1,1},
                {1,1,1,1,0,1,1,1,1,1,1,0,1,0,1,0,1,0,1,1,0,1,1,1,1,1},
                {1,1,1,0,0,1,1,0,0,0,1,1,0,0,0,0,1,0,1,0,0,0,1,1,1,1},
                {1,1,1,0,1,0,0,0,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1},
                {1,1,1,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1},
                {1,1,1,1,0,1,1,1,1,0,0,1,0,1,1,1,1,1,1,0,1,1,0,1,1,1},
                {1,1,1,1,0,0,0,0,1,0,1,1,0,0,0,0,0,0,0,0,1,1,0,1,1,1},
                {1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1},
                {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
                {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
                {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}};
int[][] map2 = new int[26][26];
int[][] currentMap = map2;
int[][] currentLocation = new int[4][3];

void gamePlay(){
  background(128);
  getCurrentLocation();
  drawPlayerView();
  drawMiniMap();
  if (pPosY == 22 && pPosX == 22){
    gseq = 4;
  }
}

void drawMiniMap(){
  int[][] tmp = {{grcp(-2,-2),grcp(-1,-2),grcp(0,-2),grcp(1,-2),grcp(2,-2)},
                 {grcp(-2,-1),grcp(-1,-1),grcp(0,-1),grcp(1,-1),grcp(2,-1)},
                 {grcp(-2,0 ),grcp(-1,0 ),grcp(0,0 ),grcp(1,0 ),grcp(2,0 )},
                 {grcp(-2,1 ),grcp(-1,1 ),grcp(0,1 ),grcp(1,1 ),grcp(2,1 )},
                 {grcp(-2,2 ),grcp(-1,2 ),grcp(0,2 ),grcp(1,2 ),grcp(2,2 )}};
  fill(255);
  float mapWidth  = 100;
  float mapHeight = 100;
  translate(-(width/2)+10, -(height/2)+10);
  pushMatrix();
  rect(0, 0, mapWidth, mapHeight);
  for (int i = 0; i <= 4; i++){
    for (int j = 0; j <=4; j++){
      if(tmp[i][j] == 1){
        fill(0);
        rect(j*mapWidth/5,i*mapHeight/5,mapWidth/5,mapHeight/5);
      }
    }
  }
  fill(255,0,0);
  translate(mapWidth/2, mapHeight/2);
  switch(pDir){
      case 0:
        break;
      case 1:
        rotate(PI/2);
        break;
      case 2:
        rotate(PI);
        break;
      case 3:
        rotate(PI*3/2);
        break;
  }
  triangle(-5,5,5,5,0,-5);
  popMatrix();
}

void getCurrentLocation(){
  switch(pDir){
    case 0:
      int[][] tmp0    = {{grcp(-1,-3),grcp(0,-3),grcp(1,-3)},
                         {grcp(-1,-2),grcp(0,-2),grcp(1,-2)},
                         {grcp(-1,-1),grcp(0,-1),grcp(1,-1)},
                         {grcp(-1,0),grcp(0,0),grcp(1,0)}};
      currentLocation = tmp0;
      break;
    case 1:
      int[][] tmp1    = {{grcp(3,-1),grcp(3,0),grcp(3,1)},
                         {grcp(2,-1),grcp(2,0),grcp(2,1)},
                         {grcp(1,-1),grcp(1,0),grcp(1,1)},
                         {grcp(0,-1),grcp(0,0),grcp(0,1)}};
      currentLocation = tmp1;
      break;
    case 2:
      int[][] tmp2    = {{grcp(1,3),grcp(0,3),grcp(-1,3)},
                         {grcp(1,2),grcp(0,2),grcp(-1,2)},
                         {grcp(1,1),grcp(0,1),grcp(-1,1)},
                         {grcp(1,0), grcp(0,0), grcp(-1,0)}};
      currentLocation = tmp2;
      break;
    case 3:
      int[][] tmp3    = {{grcp(-3,1),grcp(-3,0),grcp(-3,-1)},
                         {grcp(-2,1),grcp(-2,0),grcp(-2,-1)},
                         {grcp(-1,1),grcp(-1,0),grcp(-1,-1)},
                         {grcp(0,1), grcp(0,0), grcp(0,-1)}};
      currentLocation = tmp3;
      break;
  }
}

void drawPlayerView(){
  translate(width/2, height/2);
  drawLayer(1);
  if(gccl(1,2) == 1){
    return;
  } else{
    drawLayer(2);
    if(gccl(1,1) == 1){
      return;
    } else{
      drawLayer(3);
    }
  }
}

void drawLayer(int l){
  switch(l){
    case 1: l = 3; break;
    case 2: l = 2; break;
    case 3: l = 1; break;
  }
  int[][] cBR = {{gccl(1,l-1), gccl(2,l-1)}, // checkBoxR
                 {gccl(1,l  ), gccl(2,l  )}};
  int[][] cBL = {{gccl(0,l-1), gccl(1,l-1)}, // checkBoxL
                 {gccl(0,l  ), gccl(1,l  )}};


  lineHelper('R', cBR, l);
  lineHelper('L', cBL, l);
}

void lineHelper(char dir, int[][] gCB, int l){
  int[] type1 = new int[4];
  int[] type2 = new int[4];
  int[] type3 = new int[4];
  int[] type4 = new int[4];
  int[] type5 = new int[4];
  int[] type6 = new int[4];
  int[] type7 = new int[4];
  int[] tmp1 = {0,1,0,0};
  int[] tmp2 = {1,0,0,0};
  int[] tmp3 = {0,0,0,1};
  int[] tmp4 = {1,1,0,0};
  int[] tmp5 = {1,0,0,1};
  int[] tmp6 = {1,1,0,1};
  int[] tmp7 = {0,1,0,1};

  float w = width;
  float h = height;
  float u0x = 0;
  float u0y = (-1)*h*(l-1)/6;
  float u1x = w*(l-1)/6;
  float u1y = u0y;
  float u2x = w*l/6;
  float u2y = (-1)*h*l/6;
  float u3x = u2x;
  float u3y = u0y;

  float d0x = u0x;
  float d0y = (-1)*u0y;
  float d1x = u1x;
  float d1y = (-1)*u1y;
  float d2x = u2x;
  float d2y = (-1)*u2y;
  float d3x = u3x;
  float d3y = (-1)*u3y;
  int ex = 0;
  switch(dir){
    case 'R':
      typeHelper(type1, tmp1);
      typeHelper(type2, tmp2);
      typeHelper(type3, tmp3);
      typeHelper(type4, tmp4);
      typeHelper(type5, tmp5);
      typeHelper(type6, tmp6);
      typeHelper(type7, tmp7);
      ex = 2;
      break;
    case 'L':
      tmp1 = switchArray(tmp1);
      tmp2 = switchArray(tmp2);
      tmp3 = switchArray(tmp3);
      tmp4 = switchArray(tmp4);
      tmp5 = switchArray(tmp5);
      tmp6 = switchArray(tmp6);
      tmp7 = switchArray(tmp7);
      typeHelper(type1, tmp1);
      typeHelper(type2, tmp2);
      typeHelper(type3, tmp3);
      typeHelper(type4, tmp4);
      typeHelper(type5, tmp5);
      typeHelper(type6, tmp6);
      typeHelper(type7, tmp7);
      ex = 1;
      break; //type set for left and right
  }
  if (boxChecker(gCB,type1)){
    line(pow(-1, ex)*u1x, u1y, pow(-1, ex)*u3x, u3y);
    line(pow(-1, ex)*d1x, d1y, pow(-1, ex)*d3x, d3y);
    line(pow(-1, ex)*u1x, u1y, pow(-1, ex)*d1x, d1y);
  }
  else if (boxChecker(gCB,type2)){
    line(pow(-1, ex)*u0x, u0y, pow(-1, ex)*u1x, u1y);
    line(pow(-1, ex)*d0x, d0y, pow(-1, ex)*d1x, d1y);
    line(pow(-1, ex)*u1x, u1y, pow(-1, ex)*d1x, d1y);
  }
  else if (boxChecker(gCB,type3)){
    line(pow(-1, ex)*u1x, u1y, pow(-1, ex)*u2x, u2y);
    line(pow(-1, ex)*d1x, d1y, pow(-1, ex)*d2x, d2y);
    line(pow(-1, ex)*u1x, u1y, pow(-1, ex)*d1x, d1y);
  }
  else if (boxChecker(gCB,type4)){
    line(pow(-1, ex)*u0x, u0y, pow(-1, ex)*u3x, u3y);
    line(pow(-1, ex)*d0x, d0y, pow(-1, ex)*d3x, d3y);
  }
  else if (boxChecker(gCB,type5)){
    line(pow(-1, ex)*u0x, u0y, pow(-1, ex)*u1x, u1y);
    line(pow(-1, ex)*d0x, d0y, pow(-1, ex)*d1x, d1y);
    line(pow(-1, ex)*u1x, u1y, pow(-1, ex)*u2x, u2y);
    line(pow(-1, ex)*d1x, d1y, pow(-1, ex)*d2x, d2y);
    line(pow(-1, ex)*u1x, u1y, pow(-1, ex)*d1x, d1y);
  }
  else if(boxChecker(gCB,type6)){
    line(pow(-1, ex)*u0x, u0y, pow(-1, ex)*u1x, u1y);
    line(pow(-1, ex)*d0x, d0y, pow(-1, ex)*d1x, d1y);
    line(pow(-1, ex)*u1x, u1y, pow(-1, ex)*u2x, u2y);
    line(pow(-1, ex)*d1x, d1y, pow(-1, ex)*d2x, d2y);
    line(pow(-1, ex)*u1x, u1y, pow(-1, ex)*d1x, d1y);
  }
  else if(boxChecker(gCB,type7)){
    line(pow(-1, ex)*u1x, u1y, pow(-1, ex)*u2x, u2y);
    line(pow(-1, ex)*d1x, d1y, pow(-1, ex)*d2x, d2y);
  }
}

boolean boxChecker(int[][] ar, int[] a){
  if (ar[0][0] == a[0] && ar[0][1] == a[1] && ar[1][0] == a[2] && ar[1][1] == a[3]){
    return true;
  } else{
    return false;
  }
}

int[] typeHelper(int[] a, int[] b){
  for(int i = 0; i <= 3; i ++){
    a[i] = b[i];
  }
  return a;
}

int[] switchArray(int[] a){
  int[] b = new int[4];
  b[0] = a[1];
  b[1] = a[0];
  b[2] = a[3];
  b[3] = a[2];
  return b;
}

int grcp(int x, int y){ //grcp means "Get Relative Coordinate of Player"
  int tmp = currentMap[pPosY + y][pPosX + x];
  return tmp;
}

int gccl(int x, int y){ //grcp means "Get Coordinate of Current Location"
  int tmp = currentLocation[y][x];
  return tmp;
}

void keyPressed(){
  switch(key){
    case ENTER:
    case RETURN:
      if (gseq == 0){
          println("changed");
          gseq = 2;
      }
      break;
    case 'd':
      pDir += 1;
      pDir %= 4;
      break;
    case 's':
      pDir += 2;
      pDir %= 4;
      break;
    case 'a':
      pDir += 3;
      pDir %= 4;
      break;
    case 'w':
      switch(pDir){
        case 0:
        if (grcp(0,-1) == 1){println("壁だ");}
        else{
          pPosY -= 1;
          println("上に進んだ");}
        break;
        case 1:
        if (grcp(1,0) == 1){println("壁だ");}
        else{
          pPosX += 1;
          println("右に進んだ");}
        break;
        case 2:
        if (grcp(0,1) == 1){println("壁だ");}
        else{
          pPosY += 1;
          println("下に進んだ");}
        break;
        case 3:
        if (grcp(-1,0) == 1){println("壁だ");}
        else{
          pPosX -= 1;
          println("左に進んだ");}
        break;
      }
  }
}
