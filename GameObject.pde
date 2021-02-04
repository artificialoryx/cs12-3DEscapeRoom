class GameObject {
  PVector loc, dir;
  int lives;
  float size, speed;

  
  GameObject() {
    lives = 1;
    loc = dir = new PVector(0,0,0);
    size = 10;
  }
  
  GameObject(float x, float y, float z, float s) {
    lives = 1;
    loc = new PVector(x,y,z);
    size = s;
  }
  
  void act() {
    
  }
  
  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(86, 46, 102);
    world.noStroke();
    world.sphere(size);
    world.popMatrix();
  }
  
}
