/**for the plane to congrats people*/
float growRate = 1.0;//rate of the plane of grow

class Plane {
  float x;
  float y;
  float w;
  float h;
  float weight;//for drawing the plane, meaning nothing else

  float velocity;
  /**when construct a Plane object, 
   * it should construct a random xPos
   * yPos should be 0 which is at the top
   */
  //plane should be random position of x, andhave a range when generate
  Plane() {
    reset();
  }

  void reset() {
    if (growRate>=3.7) {
      growRate=3.7;
    }
    //x = (int)random(width/4+30, 3*width/4-30);
    x = 500;
    y = -400 * growRate;
    w = 20*3*0.68 * growRate ;
    h = 40*3*0.68 * growRate ;
    weight = 10*3*0.68 * growRate;//for drawing the plane, meaning nothing else
    velocity = 5 + growRate;//for +, cause it's too fast otherwise
  }
 
  /**Method for summarizing methods we need for Plane Class*/
  void displayAll() {
    fly();
    display();
  }

  /**this method is for setting the Plane to move*/
  void fly() {
    y += velocity;
  }


  /**for drawing the Plane*/
  void display() {

    fill(0);
    noStroke();
    beginShape();
    vertex(x+weight/2, y+weight/2);  //left vertex
    vertex(x, y);
    vertex(x+w/2, y+h);  //peek
    vertex(x+w, y);
    vertex(x+w-weight/2, y+weight/2);//right vertex
    vertex(x+w/2, y+h-weight/4);//inside co
    endShape(CLOSE);

    PVector pL = new PVector(x+weight/2, y+weight/2);
    PVector pR = new PVector(x+w-weight/2, y+weight/2);

    float insideX = (pR.x-(x+w/2))/2;
    float insideY = abs((pR.y-(y+h-weight/2+weight/4))/2);
    pushMatrix();
    translate(x+w/2, y+h-weight/2+weight/4);
    beginShape();
    vertex(0, 0);
    vertex(0+insideX, 0-insideY);
    vertex(0, 0-insideY*2);
    vertex(0-insideX, 0-insideY);
    endShape();
    fill(255, 0, 0);
    beginShape();
    vertex(0+insideX, 0-insideY);
    vertex(0, 0-insideY*2);
    vertex(0+insideX, 0-insideY*2-weight/2);
    vertex(0+insideX*2, 0-insideY*2);
    endShape();
    beginShape();
    vertex(0-insideX, 0-insideY);    
    vertex(0, 0-insideY*2);
    vertex(0-insideX, 0-insideY*2-weight/2);
    vertex(0-insideX*2, 0-insideY*2);
    endShape();
    fill(255, 0, 0);
    triangle(0-insideX*2, 0-insideY, 0+insideX*2, 0-insideY, 0, 0+weight/4);
    popMatrix();
  }
}
