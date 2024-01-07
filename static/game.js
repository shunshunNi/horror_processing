function gameClear() {
  background(255);
  fill(0);
  text("Congrats!", 200, 300);
  text("You Escaped!!", 200, 400);
}

let pPosX = 3;
let pPosY = 3;
let pDir = 0; //up
let map2 = Array.from(new Array(26), () => new Array(26));
let currentMap = map2;
let currentLocation = Array.from(new Array(4), () => new Array(3));

function gamePlay() {
  background(128);
  getCurrentLocation();
  drawPlayerView();
  drawMiniMap();
  if (pPosY == 22 && pPosX == 22) {
    gseq = 4;
  }
}

function drawMiniMap() {
  let tmp = [
    [grcp(-2, -2), grcp(-1, -2), grcp(0, -2), grcp(1, -2), grcp(2, -2)],
    [grcp(-2, -1), grcp(-1, -1), grcp(0, -1), grcp(1, -1), grcp(2, -1)],
    [grcp(-2, 0), grcp(-1, 0), grcp(0, 0), grcp(1, 0), grcp(2, 0)],
    [grcp(-2, 1), grcp(-1, 1), grcp(0, 1), grcp(1, 1), grcp(2, 1)],
    [grcp(-2, 2), grcp(-1, 2), grcp(0, 2), grcp(1, 2), grcp(2, 2)],
  ];
  fill(255);
  let mapWidth = 100;
  let mapHeight = 100;
  translate(-(width / 2) + 10, -(height / 2) + 10);
  push();
  rect(0, 0, mapWidth, mapHeight);
  for (let i = 0; i <= 4; i++) {
    for (let j = 0; j <= 4; j++) {
      if (tmp[i][j] == 1) {
        fill(0);
        rect(
          (j * mapWidth) / 5,
          (i * mapHeight) / 5,
          mapWidth / 5,
          mapHeight / 5
        );
      }
    }
  }
  fill(255, 0, 0);
  translate(mapWidth / 2, mapHeight / 2);
  switch (pDir) {
    case 0:
      break;
    case 1:
      rotate(PI / 2);
      break;
    case 2:
      rotate(PI);
      break;
    case 3:
      rotate((PI * 3) / 2);
      break;
  }
  triangle(-5, 5, 5, 5, 0, -5);
  pop();
}

function getCurrentLocation() {
  switch (pDir) {
    case 0:
      let tmp0 = [
        [grcp(-1, -3), grcp(0, -3), grcp(1, -3)],
        [grcp(-1, -2), grcp(0, -2), grcp(1, -2)],
        [grcp(-1, -1), grcp(0, -1), grcp(1, -1)],
        [grcp(-1, 0), grcp(0, 0), grcp(1, 0)],
      ];
      currentLocation = tmp0;
      break;
    case 1:
      let tmp1 = [
        [grcp(3, -1), grcp(3, 0), grcp(3, 1)],
        [grcp(2, -1), grcp(2, 0), grcp(2, 1)],
        [grcp(1, -1), grcp(1, 0), grcp(1, 1)],
        [grcp(0, -1), grcp(0, 0), grcp(0, 1)],
      ];
      currentLocation = tmp1;
      break;
    case 2:
      let tmp2 = [
        [grcp(1, 3), grcp(0, 3), grcp(-1, 3)],
        [grcp(1, 2), grcp(0, 2), grcp(-1, 2)],
        [grcp(1, 1), grcp(0, 1), grcp(-1, 1)],
        [grcp(1, 0), grcp(0, 0), grcp(-1, 0)],
      ];
      currentLocation = tmp2;
      break;
    case 3:
      let tmp3 = [
        [grcp(-3, 1), grcp(-3, 0), grcp(-3, -1)],
        [grcp(-2, 1), grcp(-2, 0), grcp(-2, -1)],
        [grcp(-1, 1), grcp(-1, 0), grcp(-1, -1)],
        [grcp(0, 1), grcp(0, 0), grcp(0, -1)],
      ];
      currentLocation = tmp3;
      break;
  }
}

function drawPlayerView() {
  translate(width / 2, height / 2);
  drawLayer(1);
  if (gccl(1, 2) == 1) {
    return;
  } else {
    drawLayer(2);
    if (gccl(1, 1) == 1) {
      return;
    } else {
      drawLayer(3);
    }
  }
}

function drawLayer(l) {
  switch (l) {
    case 1:
      l = 3;
      break;
    case 2:
      l = 2;
      break;
    case 3:
      l = 1;
      break;
  }
  let cBR = [
    [gccl(1, l - 1), gccl(2, l - 1)], // checkBoxR
    [gccl(1, l), gccl(2, l)],
  ];
  let cBL = [
    [gccl(0, l - 1), gccl(1, l - 1)], // checkBoxL
    [gccl(0, l), gccl(1, l)],
  ];
  lineHelper("R", cBR, l);
  lineHelper("L", cBL, l);
}

function lineHelper(dir, gCB, l) {
  let type1 = new Array(4);
  let type2 = new Array(4);
  let type3 = new Array(4);
  let type4 = new Array(4);
  let type5 = new Array(4);
  let type6 = new Array(4);
  let type7 = new Array(4);
  let tmp1 = [0, 1, 0, 0];
  let tmp2 = [1, 0, 0, 0];
  let tmp3 = [0, 0, 0, 1];
  let tmp4 = [1, 1, 0, 0];
  let tmp5 = [1, 0, 0, 1];
  let tmp6 = [1, 1, 0, 1];
  let tmp7 = [0, 1, 0, 1];
  let w = width;
  let h = height;
  let u0x = 0;
  let u0y = (-1 * h * (l - 1)) / 6;
  let u1x = (w * (l - 1)) / 6;
  let u1y = u0y;
  let u2x = (w * l) / 6;
  let u2y = (-1 * h * l) / 6;
  let u3x = u2x;
  let u3y = u0y;
  let d0x = u0x;
  let d0y = -1 * u0y;
  let d1x = u1x;
  let d1y = -1 * u1y;
  let d2x = u2x;
  let d2y = -1 * u2y;
  let d3x = u3x;
  let d3y = -1 * u3y;
  let ex = 0;
  switch (dir) {
    case "R":
      typeHelper(type1, tmp1);
      typeHelper(type2, tmp2);
      typeHelper(type3, tmp3);
      typeHelper(type4, tmp4);
      typeHelper(type5, tmp5);
      typeHelper(type6, tmp6);
      typeHelper(type7, tmp7);
      ex = 2;
      break;
    case "L":
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
  if (boxChecker(gCB, type1)) {
    line(pow(-1, ex) * u1x, u1y, pow(-1, ex) * u3x, u3y);
    line(pow(-1, ex) * d1x, d1y, pow(-1, ex) * d3x, d3y);
    line(pow(-1, ex) * u1x, u1y, pow(-1, ex) * d1x, d1y);
  } else if (boxChecker(gCB, type2)) {
    line(pow(-1, ex) * u0x, u0y, pow(-1, ex) * u1x, u1y);
    line(pow(-1, ex) * d0x, d0y, pow(-1, ex) * d1x, d1y);
    line(pow(-1, ex) * u1x, u1y, pow(-1, ex) * d1x, d1y);
  } else if (boxChecker(gCB, type3)) {
    line(pow(-1, ex) * u1x, u1y, pow(-1, ex) * u2x, u2y);
    line(pow(-1, ex) * d1x, d1y, pow(-1, ex) * d2x, d2y);
    line(pow(-1, ex) * u1x, u1y, pow(-1, ex) * d1x, d1y);
  } else if (boxChecker(gCB, type4)) {
    line(pow(-1, ex) * u0x, u0y, pow(-1, ex) * u3x, u3y);
    line(pow(-1, ex) * d0x, d0y, pow(-1, ex) * d3x, d3y);
  } else if (boxChecker(gCB, type5)) {
    line(pow(-1, ex) * u0x, u0y, pow(-1, ex) * u1x, u1y);
    line(pow(-1, ex) * d0x, d0y, pow(-1, ex) * d1x, d1y);
    line(pow(-1, ex) * u1x, u1y, pow(-1, ex) * u2x, u2y);
    line(pow(-1, ex) * d1x, d1y, pow(-1, ex) * d2x, d2y);
    line(pow(-1, ex) * u1x, u1y, pow(-1, ex) * d1x, d1y);
  } else if (boxChecker(gCB, type6)) {
    line(pow(-1, ex) * u0x, u0y, pow(-1, ex) * u1x, u1y);
    line(pow(-1, ex) * d0x, d0y, pow(-1, ex) * d1x, d1y);
    line(pow(-1, ex) * u1x, u1y, pow(-1, ex) * u2x, u2y);
    line(pow(-1, ex) * d1x, d1y, pow(-1, ex) * d2x, d2y);
    line(pow(-1, ex) * u1x, u1y, pow(-1, ex) * d1x, d1y);
  } else if (boxChecker(gCB, type7)) {
    line(pow(-1, ex) * u1x, u1y, pow(-1, ex) * u2x, u2y);
    line(pow(-1, ex) * d1x, d1y, pow(-1, ex) * d2x, d2y);
  }
}

function boxChecker(ar, a) {
  if (
    ar[0][0] == a[0] &&
    ar[0][1] == a[1] &&
    ar[1][0] == a[2] &&
    ar[1][1] == a[3]
  ) {
    return true;
  } else {
    return false;
  }
}

function typeHelper(a, b) {
  for (let i = 0; i <= 3; i++) {
    a[i] = b[i];
  }
  return a;
}

function switchArray(a) {
  let b = new Array(4);
  b[0] = a[1];
  b[1] = a[0];
  b[2] = a[3];
  b[3] = a[2];
  return b;
}

function grcp(x, y) {
  //grcp means "Get Relative Coordinate of Player"
  return currentMap[pPosY + y][pPosX + x];
}

function gccl(x, y) {
  //grcp means "Get Coordinate of Current Location"
  return currentLocation[y][x];
}

function keyPressed() {
  switch (keyCode) {
    case ENTER:
    case RETURN:
      if (gseq == 0) {
        console.log("changed");
        gseq = 2;
      }
      break;
    case RIGHT_ARROW:
      pDir += 1;
      pDir %= 4;
      break;
    case DOWN_ARROW:
      pDir += 2;
      pDir %= 4;
      break;
    case LEFT_ARROW:
      pDir += 3;
      pDir %= 4;
      break;
    case UP_ARROW:
      switch (pDir) {
        case 0:
          if (grcp(0, -1) == 1) {
            console.log("壁だ");
          } else {
            pPosY -= 1;
            console.log("上に進んだ");
          }
          break;
        case 1:
          if (grcp(1, 0) == 1) {
            console.log("壁だ");
          } else {
            pPosX += 1;
            console.log("右に進んだ");
          }
          break;
        case 2:
          if (grcp(0, 1) == 1) {
            console.log("壁だ");
          } else {
            pPosY += 1;
            console.log("下に進んだ");
          }
          break;
        case 3:
          if (grcp(-1, 0) == 1) {
            console.log("壁だ");
          } else {
            pPosX -= 1;
            console.log("左に進んだ");
          }
          break;
      }
  }
  return false;
}

function title() {
  textSize(100);
  fill(0);
  text("Escape Game", 100, 80);
  text("Press Enter to Start", 100, 200);
  text("Up Key: Move", 100, 320);
  text("LR, Down Key: Turn", 100, 440);
}
let gseq = 0;
let prologueText1;
function setup() {
  createCanvas(1280, 720, P2D);
  mapLoad(map2, "2");
  currentMap = map2;
}

function draw() {
  switch (gseq) {
    case 0:
      title();
      break;
    case 2:
      gamePlay();
      break;
    case 3:
      gameOver();
      break;
    case 4:
      gameClear();
      break;
  }
}

let mapString;
function preload() {
  mapString = loadStrings("./static/maze_dots/" + 2 + ".dot");
}

function mapLoad(a, n) {
  let tmp = split(mapString[0], ",");
  for (let i = 0; i <= 2; i++) {
    for (let j = 0; j <= 25; j++) {
      a[i][j] = 1;
      a[i + 23][j] = 1;
    }
  }
  for (let i = 0; i <= 19; i++) {
    for (let j = 0; j <= 2; j++) {
      a[i + 3][j] = 1;
      a[i + 3][j + 23] = 1;
    }
  }
  for (let i = 0; i < 400; i++) {
    if (tmp[i + 2] == "0") {
      a[Math.floor(i / 20) + 3][(i % 20) + 3] = 0;
    } else {
      a[Math.floor(i / 20) + 3][(i % 20) + 3] = 1;
    }
  }
}
