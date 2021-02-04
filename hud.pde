void drawCrossHair() {
  HUD.stroke(white);
  HUD.strokeWeight(2);
  HUD.line(width/2-10, height/2, width/2+10, height/2);
  HUD.line(width/2, height/2-10, width/2, height/2+10);
}

void drawMinimap() {
  image(map, width-150, height-150, 100, 100);
  int miniX = int(cam.x+2000)/gridSize;
  int miniY = int(cam.z+2000)/gridSize;
  HUD.fill(black);
  HUD.textSize(15);
  HUD.text("Y: " + miniY, width-130, height-160);
  HUD.text("X: " + miniX, width-130, height-180);

  HUD.strokeWeight(0);
  HUD.stroke(255, 0, 0);
  HUD.fill(255, 0, 0);
  HUD.rect(miniX*2.5+width-150, miniY*2.5+height-150, 4, 4);
}

void drawPoints() {
  textSize(50);
  HUD.fill(white);
  HUD.textSize(15);
  HUD.text("POINTS:", 50, 30);
  int x = points;
  for (int i = 0; i < 10; i++) {
    if (x!=0) {
      image(point, 90+i*28, 20, 21, 21);
      x--;
    } else {
      HUD.rect(100+i*28, 30, 20, 20);
    }
  }
}

void drawVictoryScreen() {
  HUD.noStroke();
  HUD.fill(0, 100);
  HUD.rect(width/2, height/2, width, height, 10);
  HUD.fill(0);
  HUD.strokeWeight(10);
  float g = random(1, 5);
  HUD.stroke(g*30, 255-g*10, g*30);
  HUD.rect(width/2, height/2, points, points/2);
  if (points>=500) {
    for (Letter l : letters) {
      l.act();
      l.show();
    }
    button(width/2-150, height/2+80, 100, 50, 15, "RESTART");
    button(width/2+150, height/2+80, 100, 50, 15, "EXIT");
  }
}

void button(int x, int y, int w, int h, int textSize, String label) {
  if (onButton(x, y, w, h)) { //hover
    HUD.strokeWeight(4);
    HUD.stroke(0);
  } else {
    HUD.strokeWeight(1);
    HUD.stroke(0);
  }
  HUD.fill(255);
  HUD.rectMode(CENTER);
  HUD.rect(x, y, w, h);
  HUD.fill(0);
  HUD.textSize(textSize);
  HUD.textAlign(CENTER, CENTER);
  HUD.text(label, x, y); //text, xy
}

void newText(String txt, float x, float y, int size, color col) {
  HUD.fill(col);
  HUD.textSize(size);
  HUD.text(txt, x, y);
}

boolean onButton(int x, int y, int w, int h) {
  if ( mouseX>x-w/2 && mouseX<x+w/2 && mouseY<y+h/2 && mouseY>y-h/2) return true;
  return false;
}
