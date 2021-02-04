
class Weather extends GameObject {
  int overMap;

  Weather() {
    super();
    loc.x = random(-4000, 4000);
    loc.y = random(height-gridSize*20, height-gridSize*30);
    loc.z = random(-3000, 3000);
    size = random(3, 7);
    overMap = height;
    if (loc.x > -2000 && loc.x < 2000 && loc.z > -2000 && loc.z < 2000) {
      overMap = height-gridSize*5;
    }
  }

  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(255);
    world.noStroke();
    world.sphere(size);
    world.popMatrix();
  }

  void act() {
    if (loc.y < this.overMap+3) {
      loc.y += 25;
    } else {
       size--;
      if (size < 0) {
        lives = 0;
        objects.add(new Weather());
      }
    }
  }
}
