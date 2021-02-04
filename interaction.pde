// key and mouse

void keyPressed() {
  //  if (mode == INTRO) mode = GAME;
  if (key == '1' && mode == GAME) {
    mode = PAUSE;
  } else if (key == '1' && mode == PAUSE) {
    mode = GAME;
  } else if (key == 'w' || key == 'W') wkey = true;
  else if (key == 's' || key == 'S') skey = true;
  else if (key == 'a' || key == 'A') akey = true;
  else if (key == 'd' || key == 'D') dkey = true;
  else if (key == ' ' && bulletTimer > threshold) {
    objects.add(new Bullet());
    bulletTimer = 0;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (key == 'v') {
    letters.add(new Letter("V", width/2-240, height/2-50));
    letters.add(new Letter("I", width/2-140, height/2-50));
    letters.add(new Letter("C", width/2-80, height/2-50));
    letters.add(new Letter("T", width/2, height/2-50));
    letters.add(new Letter("O", width/2+80, height/2-50));
    letters.add(new Letter("R", width/2+160, height/2-50));
    letters.add(new Letter("Y", width/2+240, height/2-50));
    mode = GAMEOVER;
  }
}
void mouseMoved() {
  if (udAngle > PI/2.3) udAngle = PI/2.3;
  else if (udAngle < -PI/2.3) udAngle = -PI/2.3;

  if (mouseX == width-1)
    rbt.mouseMove(1, mouseY+52);
  else if (mouseX == 0)
    rbt.mouseMove(width-2, mouseY+52);

  lrAngle += (mouseX - pmouseX)*0.01;
  udAngle += (mouseY - pmouseY)*0.01;
}

void mouseReleased() {
  if (mode == INTRO && onButton(width/2, height/2+50, 100, 50)) {
    clear();
    mode = GAME;
  }
  if (mode == GAMEOVER && onButton(width/2-150, height/2+80, 100, 50)) {
    setup();
  }
  if (mode == GAMEOVER && onButton(width/2+150, height/2+80, 100, 50)) {
    exit();
  }
}
