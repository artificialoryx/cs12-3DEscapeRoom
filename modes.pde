void intro() {
  HUD.beginDraw();
  HUD.clear();
  background(184, 207, 201);
  newText("ESCAPE ROOM", width/2, height/2-20, 40, 0);
  newText("except it's more boring", width/2, height/2+10, 10, 0);
  button(width/2, height/2+50, 100, 50, 20, "START");
  HUD.endDraw();
  image(HUD, 0, 0);
}

void pause() {
  clear();
  HUD.beginDraw();
  HUD.clear();
  HUD.background(0);
  one = true;
  newText("PAUSED", width/2, height/2, 40, 255);
  newText("Click 1 to Resume", width/2, height-20, 10, 255);
  HUD.endDraw();
  image(HUD, 0, 0);
}

void game() {
  noCursor();
  if (wallTimer > 0) {
    wallTimer--;
  } else showWall = true;
  sky.rotate(radians(0.1));
  camx = int(cam.x+2000)/gridSize;
  camz = int(cam.z+2000)/gridSize;

  world.beginDraw();
  world.textureMode(NORMAL);
  world.background(sky.y, sky.y*1.2, sky.y*1.6);
  world.pointLight(255, 255, 255, cam.x, cam.y, cam.z);
  world.camera(cam.x, cam.y, cam.z, focus.x, focus.y, focus.z, tilt.x, tilt.y, tilt.z);
  lrAngle = map(mouseX, 0, width, 0, 2*PI);
  move();
  drawPlane(-3500, 3500, height, gridSize, block3);

  for (int i = objects.size()-1; i >= 0; i--) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj instanceof Point) {
      if (camx == int(obj.loc.x+2000)/gridSize && camz == int(obj.loc.z+2000)/gridSize) {
        obj.lives = 0;
        points++;
      }
    }
    if (obj.lives == 0 || obj instanceof Wall) {
      objects.remove(i);
    }
  }

  drawPlane(-2000, 2000, height, gridSize, block2);
  drawPlane(-2000, 2000, height-gridSize*5, gridSize, block1);
  drawMap();

  world.endDraw();
  image(world, 0, 0);

  HUD.beginDraw();
  HUD.clear();
  drawCrossHair();
  drawMinimap();
  drawPoints();
  if (!one) {
    newText("click 1 to pause", 170, height-20, 15, 255);
  }
  HUD.endDraw();
  image(HUD, 0, 0);

  if (points >= 10 && map.get(int(cam.x+2000)/gridSize, int(cam.z+2000)/gridSize) == fakeWhite) {
    letters.add(new Letter("V", width/2-240, height/2-50));
    letters.add(new Letter("I", width/2-140, height/2-50));
    letters.add(new Letter("C", width/2-80, height/2-50));
    letters.add(new Letter("T", width/2, height/2-50));
    letters.add(new Letter("O", width/2+80, height/2-50));
    letters.add(new Letter("R", width/2+160, height/2-50));
    letters.add(new Letter("Y", width/2+240, height/2-50));
    mode = GAMEOVER;
    points = 0;
  }
}

void gameOver() {
  cursor();
  if (points <= 700) points+=100;
  world.beginDraw();
  world.textureMode(NORMAL);
  world.background(sky.y, sky.y*1.2, sky.y*1.6);
  world.pointLight(255, 255, 255, cam.x, cam.y, cam.z);
  world.camera(cam.x, cam.y, cam.z, focus.x, focus.y, focus.z, tilt.x, tilt.y, tilt.z);
  lrAngle = map(mouseX, 0, width, 0, 2*PI);
  drawPlane(-3500, 3500, height, gridSize, block3);
  drawPlane(-2000, 2000, height, gridSize, block2);
  drawPlane(-2000, 2000, height-gridSize*5, gridSize, block1);
  drawMap();
  world.endDraw();
  image(world, 0, 0);

  HUD.beginDraw();
  HUD.clear();
  HUD.fill(200);
  HUD.rectMode(CENTER); // putting this in draw() did not work :(
  drawVictoryScreen();
  HUD.endDraw();
  image(HUD, 0, 0);
}
