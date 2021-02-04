class Point extends GameObject {

  Point (int x, int z) {
    super(x, 0, z, 20);
  }

  void show() {
    world.pushMatrix();
    world.translate(loc.x, height/2+gridSize*2.5, loc.z);
    world.rotateY(frameCount/5.0);
    world.rotateX(PI/4);
    world.rotateY(PI/8);
    texturedCube(-10,-10,-10, point, size);
    world.popMatrix();
  }

  void act() {
    
  }
}
