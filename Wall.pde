class Wall extends GameObject {
  PImage blockType;

  Wall (float x, float y, float z, PImage blockType) {
    super(x, y, z, 10);
    this.blockType = blockType;
  }

  void show() {
    if (showWall && blockType.equals(block2)) {
      texturedCube(loc.x, loc.y, loc.z, blockType, gridSize);
      texturedCube(loc.x, loc.y-gridSize, loc.z, blockType, gridSize);
      texturedCube(loc.x, loc.y-gridSize*2, loc.z, blockType, gridSize);
    } else if (points < 10 && blockType.equals(block5)) {
      texturedCube(loc.x, loc.y, loc.z, blockType, gridSize);
      texturedCube(loc.x, loc.y-gridSize, loc.z, blockType, gridSize);
      texturedCube(loc.x, loc.y-gridSize*2, loc.z, blockType, gridSize);
    }
  }

  void act() {
  }
}
