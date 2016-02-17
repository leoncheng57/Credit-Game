public class Avatar {

  float xCor;
  float yCor;
  color col;
  
  Avatar(int x, int y) {
    xCor = x;
    yCor = y;
  }
  
  void drawMe() {
    fill(#0000FF);
    stroke(#00FF00);
    ellipse(xCor*blockSize-blockSize/2, yCor*blockSize-blockSize/2, 50, 50);
  }
}

