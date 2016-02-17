public class Avatar {

  float xCor;
  float yCor;
  String dir;
  color col;
  PImage pic;

  Avatar(int x, int y, PImage p) {
    xCor = x*blockSize;
    yCor = y*blockSize;
    col = #0000FF;
    pic = p;
    dir = "stop";
  }

  Avatar(int x, int y, color c, PImage p) {
    xCor = x;
    yCor = y;
    col = c;
    pic = p;
    dir = "stop";
  }

  void drawMe() {
    fill(col);
    //stroke(#00FF00);
    noStroke();
    ellipse(xCor-blockSize/2, yCor-blockSize/2, 50, 50);
    //image(pic, xCor*blockSize, yCor*blockSize, 100, 100);
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
    image(imgCollision, xCor, yCor, 100, 50);
  }

  void showCollision() {
    println(xCor);
  }
}

