//GLOBAL VARIABLES

int blockSize = 200;
Block[][] grid = new Block[3][4];
Avatar player = new Avatar(2, 4);
ArrayList<Avatar> zombies = new ArrayList<Avatar>();

void setup() {
  size(3*blockSize, 4*blockSize);
  background(0);
}

void makeGrid() {
  for (int x = 0; x<grid.length; x++) {
    for (int y = 0; y<grid[0].length; y++) {
      Block b = new Block(x, y);
      grid[x][y] = b;
      b.outlineMe();
    }
  }
}

void spawnZombie() {
  int rnd = (int)random(0, 50);
  int rx = (int)random(1, 4);
  int ry = 1;
  if (rnd==0) {
    Avatar z = new Avatar(rx, ry);
    zombies.add(z);
  }
}

void moveZombies() {
  for (Avatar z : zombies) {
    z.yCor+=0.01;
  }
}

boolean isColliding(Avatar p, Avatar z) {
  float px = p.xCor;
  float py = p.yCor;
  float zx = z.xCor;
  float zy = z.yCor;
  if (abs(px-zx)<0.25 && abs(py-zy)<0.25) {
    return true;
  }
  return false;
}

void draw() {
  makeGrid();
  //zombies
  spawnZombie();
  for (Avatar z : zombies) {
    z.drawMe();
  }
  moveZombies();
  //players
  player.drawMe();
  player.keepMove();
  for (Avatar z : zombies) {
    if (isColliding(player, z)) {
      println("COLLISION!!");
    }
  }
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      player.startLeft();
    } else if (keyCode == RIGHT) {
      player.startRight();
    }
  }
}

