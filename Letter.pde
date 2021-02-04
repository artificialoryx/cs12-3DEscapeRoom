class Letter {
  String ch;
  float rotation;
  PVector loc, dir;
  int size;
  color green;

  Letter(String ch, float x, float y) {
    super();
    this.ch = ch;
    loc = new PVector(x, y);
    dir = new PVector(0,5);
    rotation = random(20,25);
    size = 50;
    green = 0;
  }

  void act() {
      dir.rotate(PI/rotation);
      loc.y += dir.y;
      
  }
  void show() {
    green = color(abs(dir.y*30),255-abs(dir.y*10), abs(dir.y*30));
    HUD.fill(green);
    HUD.textSize(size);
    HUD.text(ch, loc.x, loc.y);
  }
}
