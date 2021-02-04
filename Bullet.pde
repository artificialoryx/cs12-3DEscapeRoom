class Bullet extends GameObject{
  
  Bullet() {
    super(cam.x, cam.y, cam.z, 5);
    speed = 70;
    float vx = cos(lrAngle);
    float vy = tan(udAngle);
    float vz = sin(lrAngle);
    dir = new PVector(vx, vy, vz);
    dir.setMag(speed);
  }
  
  void act() {
    PVector hit = new PVector((loc.x+2000)/gridSize, (loc.z+2000)/gridSize);
    if(map.get(int(hit.x), int(hit.y)) == purple && loc.y < height-gridSize && loc. y > height-gridSize*32) {
      showWall = false;
      wallTimer = 50;
    } 
    
    if(map.get(int(hit.x), int(hit.y)) == white && loc.y > height-gridSize*4 && loc. y < height) {
      loc.add(dir);
    } else {
      lives = 0;
      for (int i=0; i<20; i++) {
        objects.add(new Particle(loc, dir));
      }
    }
  }
  
  void show() {
    super.show();
    
  }
 
  
}
