import java.awt.Robot;

color black = #000000, white = #FFFFFF, blue = #0000ff, purple = #ff00ff, fakeBlack = #ff0000, fakeWhite = #fefefe;

int gridSize, bulletTimer = 0, threshold = 20, mode, wallTimer = 0, points, camx, camz;
PImage map, block1, block2, block3, block4, block5, block6, end1, end2, end3, glass, point;
PFont font;

PVector cam, focus, tilt, sky;
boolean wkey, skey, akey, dkey, spacebar, showWall, one;
float lrAngle, udAngle;
Robot rbt;

PGraphics world, HUD;
ArrayList<GameObject> objects;
ArrayList<Letter> letters;
final int INTRO = 0, GAME = 1, PAUSE = 2, GAMEOVER = 3;

void setup() {
  world = createGraphics(width, height, P3D);
  HUD = createGraphics(width, height, P2D);
  block1 = loadImage("glasspane.png");
  block2 = loadImage("quartz.png");
  block3 = loadImage("grass.jpg");
  block4 = loadImage("obsidian.png");
  block5 = loadImage("vine.png");
  block6 = loadImage("empty.png");
  end1 = loadImage("side1.png"); //3 unique sides(instead of 6)
  end2 = loadImage("side2.png");
  end3 = loadImage("side3.png");
  glass = loadImage("glass.png");
  point = loadImage("point.png");
  sky = new PVector(0, 110);

  map = loadImage("map.png");
  gridSize = 100;

  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  size(displayWidth, displayHeight, P2D);
  font = loadFont("Times-Roman-48.vlw");
  textFont(font, 32);
  noStroke();
  rectMode(CENTER);
  //noCursor();
  //rbt.mouseMove(width/2, height/2);
  //mouseX = width/2;
  //mouseY = height/2;

  cam = new PVector(width/2, height/2+gridSize*2, height/2);
  focus = new PVector(width/2, height/2, height/2-100);
  tilt = new PVector(0, 1, 0);

  one = false;
  showWall = false;
  mode = 0;
  points = 0;
  objects = new ArrayList<>();
  for (int i = 0; i <200; i++) {
    objects.add(new Weather());
  }
  for (int i=0; i<15; i++) {
    int x = (int)random(-1900, 1900);
    int y = (int)random(-1900, 1900);
    if (map.get(int((x+2000)/gridSize), (int(y+2000)/gridSize)) != white ) {
      i--;
      continue;
    }
    objects.add(new Point(x, y));
  }
  letters = new ArrayList<>();
  HUD.textAlign(CENTER, CENTER);
}

void draw() {
  switch(mode) {
  case INTRO:
    intro();
    break;
  case GAME:
    game();
    break;
  case PAUSE:
    pause();
    break;
  case GAMEOVER:
    gameOver();
    break;
  default:
    println("ERROR! MODE = "+mode);
  }
}
