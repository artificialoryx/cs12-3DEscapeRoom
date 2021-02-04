
void texturedCube(float x, float y, float z, PImage texture, float size ) {
  world.pushMatrix();
  world.translate(x, y, z);
  world.scale(size); //size of img
  world.noStroke();

  world.beginShape(QUADS);
  world.texture(texture);
  
  //x, y, z, texture x, texture y
  world.vertex(0, 0, 0, 0, 0); //top
  world.vertex(1, 0, 0, 1, 0);
  world.vertex(1, 0, 1, 1, 1);
  world.vertex(0, 0, 1, 0, 1);

  world.vertex(0, 1, 0, 0, 0); //bot
  world.vertex(1, 1, 0, 1, 0);
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(0, 1, 1, 0, 1);

  world.vertex(0, 0, 1, 0, 0); //F
  world.vertex(1, 0, 1, 1, 0);
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(0, 1, 1, 0, 1);

  world.vertex(0, 0, 0, 0, 0); //B
  world.vertex(1, 0, 0, 1, 0);
  world.vertex(1, 1, 0, 1, 1);
  world.vertex(0, 1, 0, 0, 1);

  world.vertex(0, 0, 0, 0, 0); //L
  world.vertex(0, 0, 1, 1, 0);
  world.vertex(0, 1, 1, 1, 1);
  world.vertex(0, 1, 0, 0, 1);

  world.vertex(1, 0, 0, 0, 0); //R
  world.vertex(1, 0, 1, 1, 0);
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(1, 1, 0, 0, 1);

  world.endShape();
  world.popMatrix();
}

void texturedCube(float x, float y, float z, PImage t1, PImage t2, PImage t3, float size ) {
  world.pushMatrix();
  world.translate(x, y, z);
  world.scale(size); //size of img
  world.noStroke();

  world.beginShape(QUADS);
  world.texture(t1);
  //x, y, z, texture x, texture y
  world.vertex(0, 0, 0, 0, 0); //top
  world.vertex(1, 0, 0, 1, 0);
  world.vertex(1, 0, 1, 1, 1);
  world.vertex(0, 0, 1, 0, 1);

  world.vertex(0, 1, 0, 0, 0); //bot
  world.vertex(1, 1, 0, 1, 0);
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(0, 1, 1, 0, 1);
  world.endShape();

  world.beginShape(QUADS);
  world.texture(t2);
  world.vertex(0, 0, 1, 0, 0); //F
  world.vertex(1, 0, 1, 1, 0);
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(0, 1, 1, 0, 1);

  world.vertex(0, 0, 0, 0, 0); //B
  world.vertex(1, 0, 0, 1, 0);
  world.vertex(1, 1, 0, 1, 1);
  world.vertex(0, 1, 0, 0, 1);
  world.endShape();

  world.beginShape(QUADS);
  world.texture(t3);
  world.vertex(0, 0, 0, 0, 0); //L
  world.vertex(0, 0, 1, 1, 0);
  world.vertex(0, 1, 1, 1, 1);
  world.vertex(0, 1, 0, 0, 1);

  world.vertex(1, 0, 0, 0, 0); //R
  world.vertex(1, 0, 1, 1, 0);
  world.vertex(1, 1, 1, 1, 1);
  world.vertex(1, 1, 0, 0, 1);
  world.endShape();

  world.popMatrix();
}
