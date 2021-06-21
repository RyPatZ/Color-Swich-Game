class CurveBlock {
  double rotateangle;//rotate angle
  float spa ;//start angle a
  float sp2 ;//start angle b
  float sp3 ;//start angle c
  float sp4 ;//start angle d
  CurveBlock() {
    reset();//reset data;
  }
  void reset() {
    rotateangle =PI/200;
    spa = 0;
    sp2 = HALF_PI;
    sp3 = PI;
    sp4 = PI+0.5*PI;
  }

  void display(float x,float y) {
    
      noFill();
    stroke(10);
    strokeWeight(30);
    //rotate(rotateangle);
    /**draw curve block based on the angle*/
    stroke(255, 0, 255);  
    arc(x, y, 180, 180, spa, spa+(PI/2));
    stroke(0, 255, 255);
    arc(x, y, 180, 180, sp2, sp2+(PI/2));
    stroke(255, 255, 0);
    arc(x, y, 180, 180, sp3, sp3+(PI/2)); //n, a);
    stroke(0, 50, 0);
    arc(x, y, 180, 180, sp4, sp4+(PI/2));
    /**make the angle plus the rotate angle to make it rotate
    when the angle = 2 then make it 0 so we can get which one is facing down 
    for define lose
    */
    spa += rotateangle;
    if (spa>TWO_PI) spa=0;
    sp2 += rotateangle;
    if (sp2>TWO_PI) sp2=0;
    sp3 += rotateangle;
    if (sp3>TWO_PI) sp3=0;
    sp4 += rotateangle;
    if (sp4>TWO_PI) sp4=0;
    if (shape==1 ) {
      Star.display(x, y);
      //shape =0;
    } else {
      circle.display(x);
      //shape = int(random(0, 2));
    }
  }

  boolean checkIfLose() {
     /**if true situation does not match then return false
     wHen the start is bigger than 0 have smaller than pi/2
     then that curve is facing down
     */
    boolean ad=true;
    if (spa>0 && spa < HALF_PI && ball.colornum == 0) {
      ad = false;//true situation
    } else if (sp2>0 && sp2 < HALF_PI&& ball.colornum ==1) {
      ad = false;//true situation
    } else if (sp3>0 && sp3 < HALF_PI &&ball.colornum == 2) {
      ad = false;//true situation
    } else if (sp4>0 && sp4 < HALF_PI && ball.colornum == 3) {
      ad = false;//true situation
    } else if (spa>PI && spa < PI+0.5*PI && ball.colornum == 0) {
      ad = false;//true situation
    } else if (sp2>PI && sp2 < PI+0.5*PI&& ball.colornum ==1) {
      ad = false;//true situation
    } else if (sp3>PI && sp3 < PI+0.5*PI &&ball.colornum == 2) {
      ad = false;//true situation
    } else if (sp4>PI && sp4 < PI+0.5*PI && ball.colornum == 3) {
      ad = false;//true situation
    }
    return ad;
  }
}
