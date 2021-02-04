class Particle extends GameObject {
  int alpha = 250;
  float timer = -1.5;

  Particle() {
  }

  Particle(PVector loc, PVector dir) {
    super(loc.x, loc.y, loc.z, 5);
    if (loc.y > height-3) {
      loc.y = height-3;
    } else if (loc.y < height-gridSize*4+10) {
      loc.y = height-gridSize*4+10;
    }
    this.dir = new PVector(-dir.x+(random(-20, 20)), -dir.y+(random(-30, 30)), -dir.z+(random(-20, 20)));
    speed = 10;
    this.dir.setMag(speed);
  }

  void act() {
    if (loc.y <= height-3) {
      if (timer < 0.5 && dir.y < 0) {
        loc.add(dir);
      } else {
        loc.add(dir.x*0.6, 0, dir.z*0.6);
        loc.y+=timer;
      }
    }
    timer+= 0.2;
    alpha-=2;
    if (size>1) size-=0.05;
    if (alpha<0) {
      lives = 0;
    }
  }

  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(86, 46, 102, alpha);
    world.noStroke();
    world.box(size);
    world.popMatrix();
  }
}
