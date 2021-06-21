class Ball {
  int r;//radius
  int colornum ;//decide what color the ball will be 
  Ball() {
    r = 15;//r
    reset();//reset
  }
  void reset() {
    colornum = int(random(0, 3));//make a random num
  }
  void display(float x) {
    speed += gravity;//make gravity
    y += speed;//make gravity
    /**decide the color of the ball based on the color num*/
    if (colornum == 0) {
      fill(255, 0, 255);
    } else if (colornum == 1) {
      fill(0, 255, 255);
    } else if (colornum == 2) {
      fill(255, 255, 0);
    } else {
      fill(0, 50, 0);
    }
    strokeWeight(0);
    ellipse(x, y, r*2, r*2);//draw ball
  }
  int newc(){
  return int(random(0, 3));//return a new color num 
  }
}
