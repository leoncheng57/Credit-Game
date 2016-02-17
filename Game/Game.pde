//GLOBAL VARIABLES

int blockSize = 200;
Block[][] grid = new Block[3][4];
Avatar player = new Avatar(2, 4);
ArrayList<Avatar> zombies = new ArrayList<Avatar>();
PImage imgCollision;
PImage imgStore;
PImage imgSand;
int timer = 0;
boolean showStore;

void setup() {
  size(3*blockSize, 4*blockSize);
  background(0);
  imgCollision = loadImage("Collision.png");
  imgStore = loadImage("Store.png");
  imgSand = loadImage("Sand.jpg");
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
  int rnd = (int)random(0, 100);
  int rx = (int)random(1, 4);
  int ry = 1;
  if (rnd==0) {
    color c = #E30733;
    Avatar z = new Avatar(rx, ry, c);
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
  float collisionDistance = 0.1;
  if (abs(px-zx)<collisionDistance && abs(py-zy)<collisionDistance) {
    return true;
  }
  return false;
}

void draw() {
  image(imgSand, 0, 0, width, height);
  //makeGrid();
  /* Zombies */
  spawnZombie();
  for (Avatar z : zombies) {
    z.drawMe();
  }
  moveZombies();
  /* Players */
  player.drawMe();
  player.keepMove();
  /* Colliding btn player and zombies */
  for (Avatar z : zombies) {
    if (isColliding(player, z)) {
      timer=0;
    }
  }
  if (timer<50) {
    image(imgCollision, width/2-40, height/2, 100, 50);
    player.showCollision();
  }
  timer++;
  /* Show Store */
  if (showStore) {
    image(imgStore, 0, 0, width, height);
  }
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      player.startLeft();
    } else if (keyCode == RIGHT) {
      player.startRight();
    } else if (keyCode == DOWN) {
      showStore = true;
      image(imgStore, 0, 0, width, height);
      noLoop();
    } else if (keyCode == UP) {
      showStore = false;
      loop();
    }
  }
}

