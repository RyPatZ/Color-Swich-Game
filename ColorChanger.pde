class ColorChanger {
//to change color of ball
  ColorChanger() {
  }
  void display(float x) {
    if (y<cy+15 && y>cy-15 && hasTouchedFirst ) { 
      hasTouchedFirst =false;//a boolean to make the color only change once
      /**check if they new color is the same as the old one*/
      if (ball.newc() == ball.colornum){ball.reset();}
      else{ball.colornum = ball.newc();}
     // ball.colornum = ball.newc();
    } 
         /**decide the color of the ball based on the color num*/
      if (ball.colornum == 0) {
        fill(255, 0, 255);
      } else if (ball.colornum == 1) {
        fill(0, 255, 255);
      } else if (ball.colornum == 2) {
        fill(255, 255, 0);
      } else {
        fill(0, 50, 0);
    }
    ellipse(x, cy, 7.5, 7.5);//draw ball

  }
}
