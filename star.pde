class star{
star(){
}
/**draw star*/
void display(float ax, float ay){
 push();
  translate(ax, ay); // center of the star also center of cureve block
  if (y<ay+15 && y>ay-15 && hasTouchedFirst) {
    noFill();//if match make it disapear
    point +=1;//make point plus 1
    hasTouchedFirst = false;//make boolean false after use
  }
  if (y< ay - 105 || y <sy-105) {
    shape = int(random(0, 2));//make a new shape
    hasTouchedFirst =true;
  } else if (y>ay-15) {
    //set color base on color num
    if (ball.colornum == 0) {
      fill(255, 0, 255);
    } else if (ball.colornum == 1) {
      fill(0, 255, 255);
    } else if (ball.colornum == 2) {
      fill(255, 255, 0);
    } else {
      fill(0, 50, 0);
    }
  }
  /**draw star*/
  noStroke();
  beginShape();
  vertex(0, -25);
  vertex(7, -10);
  vertex(23.5, -7.5);
  vertex(11.5, 3.5);
  vertex(14.5, 20);
  vertex(0, 12.5);
  vertex(-14.5, 20);
  vertex(-11.5, 3.5);
  vertex(-23.5, -7.5);
  vertex(-7, -10);
  endShape(CLOSE);
  translate(100, 100);
 pop();
}












}
