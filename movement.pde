// move()
// canMove()
void move() {

  if (wkey && canW()) {
    cam.x += cos(lrAngle)*20; //speed
    cam.z += sin(lrAngle)*20;
  }
  if (skey && canS()) {
    cam.x -= cos(lrAngle)*20; //speed
    cam.z -= sin(lrAngle)*20;
  }
  if (akey && canA()) {
    cam.x -= cos(lrAngle + PI/2)*20; //speed
    cam.z -= sin(lrAngle + PI/2)*20;
  }

  if (dkey && canD()) {
    cam.x += cos(lrAngle + PI/2)*10; //speed
    cam.z += sin(lrAngle + PI/2)*10;
  }
  focus.x = cam.x + cos(lrAngle)*100;
  focus.y = cam.y + tan(udAngle)*100;
  focus.z = cam.z + sin(lrAngle)*100;
}

boolean canW() {
  PVector move = new PVector(cam.x + cos(lrAngle)*100, cam.y, cam.z + sin(lrAngle)*100);
  PVector left = new PVector(cos(lrAngle+PI/8)*100+cam.x, cam.z + sin(lrAngle+PI/8)*100);
  PVector right = new PVector(cos(lrAngle-PI/8)*100+cam.x, sin(lrAngle-PI/8)*100 +cam.z);

  int mapx, mapy, mapxL, mapyL, mapxR, mapyR;

  mapx = int(move.x+2000)/gridSize;
  mapy = int(move.z+2000)/gridSize;
  mapxL = int(left.x+2000)/gridSize;
  mapyL = int(left.y+2000)/gridSize;
  mapxR = int(right.x+2000)/gridSize;
  mapyR = int(right.y+2000)/gridSize;

  if (map.get(mapx, mapy) == white && map.get(mapxL, mapyL) == white && map.get(mapxR, mapyR) == white || map.get(mapx, mapy) == fakeWhite && points >= 10)
    return true;
  else if ((map.get(mapx, mapy) == fakeBlack || map.get(mapxL, mapyL) == fakeBlack || map.get(mapxR, mapyR) == fakeBlack) && !showWall)
    return true;
  else return false;
}

boolean canS() {
  PVector move = new PVector(cam.x - cos(lrAngle)*100, cam.y, cam.z - sin(lrAngle)*100);
  int mapx, mapy;
  mapx = int(move.x+2000)/gridSize;
  mapy = int(move.z+2000)/gridSize;
  if (map.get(mapx, mapy) == white)
    return true;
  else if (map.get(mapx, mapy) == fakeBlack && !showWall)
    return true;
  else return false;
}

boolean canA() {
  PVector move = new PVector(cam.x - cos(lrAngle + PI/2)*100, cam.y, cam.z - sin(lrAngle + PI/2)*100);
  int mapx, mapy;
  mapx = int(move.x+2000)/gridSize;
  mapy = int(move.z+2000)/gridSize;
  if (map.get(mapx, mapy) == white) {
    return true;
  } else if (map.get(mapx, mapy) == fakeBlack && !showWall) {
    return true;
  } else return false;
}

boolean canD() {
  PVector move = new PVector(cam.x + cos(lrAngle + PI/2)*100, cam.y, cam.z + sin(lrAngle + PI/2)*100);
  int mapx, mapy;
  mapx = int(move.x+2000)/gridSize;
  mapy = int(move.z+2000)/gridSize;
  if (map.get(mapx, mapy) == white )
    return true;
  else if (map.get(mapx, mapy) == fakeBlack && !showWall)
    return true;
  else return false;
}
