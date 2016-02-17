public class Block {
  int xCor;
  int yCor;

  Block(int a, int b) {
    xCor = a;
    yCor = b;
  }

  void outlineMe() {
    fill(0);
    stroke(#00FF00);
    rectMode(CORNER);
    rect(xCor * blockSize, yCor * blockSize, blockSize, blockSize);
    rectMode(CENTER); 
    stroke(0);
  }
}

