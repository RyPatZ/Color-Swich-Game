class SquareBlock {
  float sx = cx - 90;//pos
  float sy = ny - 90;//pos
  float sx1 = cx +90;//pos
  float sy1 = ny + 90;//pos
  //float sflip = ball.colornum;

  SquareBlock() {
    reset();//reset
  }
  void reset() {
    sy = ny - 90;//pos reset
    sy1 = ny + 90;//pos reset
  }
  void display(float sx, float sy, float sx1, float sy1,float x) {
    strokeWeight(30);
    /**
    draw the square block base on color
    */
    if (ball.colornum == 2) {
      stroke(255, 0, 255); 
      line(sx, sy, sx1, sy);
      stroke(0, 255, 255);
      line(sx1, sy, sx1, sy1);
      stroke(255, 255, 0);
      line(sx1, sy1, sx, sy1);
      stroke(0, 50, 0);
      line(sx, sy1, sx, sy);
    } else if (ball.colornum == 0) {
      stroke(255, 255, 0); 
      line(sx, sy, sx1, sy);
      stroke(0, 255, 255);
      line(sx1, sy, sx1, sy1);
      stroke(255, 0, 255);
      line(sx1, sy1, sx, sy1);
      stroke(0, 50, 0);
      line(sx, sy1, sx, sy);
    } else if (ball.colornum == 1) {
      stroke(255, 0, 255); 
      line(sx, sy, sx1, sy);
      stroke(255, 255, 0);
      line(sx1, sy, sx1, sy1);
      stroke(0, 255, 255);
      line(sx1, sy1, sx, sy1);
      stroke(0, 50, 0);
      line(sx, sy1, sx, sy);
    } else if (ball.colornum == 3) {
      stroke(255, 0, 255); 
      line(sx, sy, sx1, sy);
      stroke(0, 255, 255);
      line(sx1, sy, sx1, sy1);
      stroke(0, 50, 0);
      line(sx1, sy1, sx, sy1);
      stroke(255, 255, 0);
      line(sx, sy1, sx, sy);
    }
    fill(255);
    textSize(25);
    fill(255);
    ellipse(x, ny, 30, 30);//draw circle
    text("flip", x-20, ny);//draw text to tell user we are about to flip
  }

  void flip(float sx, float sy, float sx1, float sy1) {
    ///**flip block base on the color*/
    strokeWeight(30);
    if (ball.colornum == 2) {
      stroke(255, 255, 0); 
      line(sx, sy, sx1, sy);
      stroke(0, 255, 255);
      line(sx1, sy, sx1, sy1);
      stroke(255, 0, 255);
      line(sx1, sy1, sx, sy1);
      stroke(0, 50, 0);
      line(sx, sy1, sx, sy);
    } else if (ball.colornum == 0) {
      stroke(255, 0, 255); 
      line(sx, sy, sx1, sy);
      stroke(0, 255, 255);
      line(sx1, sy, sx1, sy1);
      stroke(255, 255, 0);
      line(sx1, sy1, sx, sy1);
      stroke(0, 50, 0);
      line(sx, sy1, sx, sy);
    } else if (ball.colornum == 1) {
      stroke(0, 255, 255); 
      line(sx, sy, sx1, sy);
      stroke(255, 255, 0);
      line(sx1, sy, sx1, sy1);
      stroke(255, 0, 255);
      line(sx1, sy1, sx, sy1);
      stroke(0, 50, 0);
      line(sx, sy1, sx, sy);
    } else if (ball.colornum == 3) {
      stroke(0, 50, 0); 
      line(sx, sy, sx1, sy);
      stroke(0, 255, 255);
      line(sx1, sy, sx1, sy1);
      stroke(255, 255, 0);
      line(sx1, sy1, sx, sy1);
      stroke(255, 255, 0);
      line(sx, sy1, sx, sy);
    }
  }
}
