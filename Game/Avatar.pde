public class Avatar {

  float xCor;
  float yCor;
  String dir;
  color col;

  Avatar(int x, int y) {
    xCor = x;
    yCor = y;
    col = #0000FF;
    dir = "stop";
  }

  Avatar(int x, int y, color c) {
    xCor = x;
    yCor = y;
    col = c;
    dir = "stop";
  }

  void drawMe() {
    fill(col);
    stroke(#00FF00);
    ellipse(xCor*blockSize-blockSize/2, yCor*blockSize-blockSize/2, 50, 50);
  }

  void startLeft() {
    if (xCor == 1 || xCor == 2 || xCor > 3) {
      xCor-=0.01;
    }
    dir = "left";
  }

  void startRight() {
    if (xCor < 1 || xCor == 2 || xCor == 3) {
      xCor+=0.01;
    }
    dir = "right";
  }


  void keepMove() {
    if (dir == "left") {
      if (xCor>2 && xCor<3) {
        xCor-=0.01;
      } else if (xCor>1 && xCor<2) {
        xCor-=0.01;
      }
    }
    if (dir == "right") {
      if (xCor>2 && xCor<3) {
        xCor+=0.01;
      } else if (xCor>1 && xCor<2) {
        xCor+=0.01;
      }
    }
  }
}

