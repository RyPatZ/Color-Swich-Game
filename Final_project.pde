float gravity =0.1; // the gravity of the ball 
float acce = 30;// the acceleration of the ball
float speed = 0;// the speed of the ball
boolean hasTouchedFirst = true; // a boolean to check if i=the object is first check
float y = 500;//ball pos
float y2 = 500;// ball pos
float x = 300;// ball pos
float cx = 300;//curve block pos
float cy = 200;// curve block pos
float sy = cy-450;// curve block pos
float ny = sy-450;//square block pos
float shape = 1;//a random num to decide what is the shape at middle
float point = 0;//point 
float point1 =0;//point
boolean start_game = false;//a boolean to check if the game started
ColorChanger circle = new ColorChanger();//create object
SquareBlock square = new SquareBlock();//create object
star Star = new star ();//create object
CurveBlock blocks;//create object
Ball ball;//create object
ArrayList<CurveBlock> curves = new ArrayList<CurveBlock>();//a curveblock arraylist
boolean battleMode = false;//check mode
boolean simpleMode = false;//check mode
ArrayList<Plane> plane;// a plane arraylist
boolean sb = true;


void setup() {
  size(600, 1200) ;
  blocks = new CurveBlock ();//create object
  ball = new Ball();//create object
  for (int i =0; i < 50; i++) {
    curves.add(new CurveBlock ());//store value into array list
  }
  plane = new ArrayList<Plane>();//create object
  int  planeNum = 50;
  for (int i =0; i<planeNum; i++) {
    plane.add(new Plane());//store value into array list
  }
  for (int i=0; i<plane.size(); i++) {
    plane.get(i).y -= i*300;//store value into array list
  }
}

void draw() {
  background(0);
  if (!start_game) {
    for (Plane p : plane) {
      p.displayAll();//display plane
    }
    /**give player option to choose mode*/
    fill(255);
    textSize(25);
    text("'s' : Simple Mode", width/5, 400);
    text("'b' : Battle Mode", width/5, 450);
    text("'anykey but b' : Infinite Mode", width/5, 500);
    textSize(15);
    text("press b to start battle mode", width/5, 535);
    text("click the key or mouse to start infinite mode", width/5, 550);
    /**display */
    blocks.display(cx, 200);
  } else {//when the game start
    if (battleMode) {//if its battle mode
      text("Point: "+ point, width/4, 50);//draw text
      text("Point: "+ point1, (width/4)*3, 50);//drawtext
      strokeWeight(10);
      stroke(255);
      line(width/2, 0, width/2, height);
      ball.display(x/2);//display ball
      ball.display((x/2)*3);//draw ball
      blocks.display(cx/2, cy);//draw blocks
      blocks.display((cx/2)*3, cy);//draw blocks
      blocks.display((cx/2)*3, sy);//draw blocks
      square.display(square.sx/2, square.sy, square.sx1/2, square.sy1, cx/2);//draw blocks
      /**make sure every bolck go around like aloop */
      if (cy+105 > height) {//when match , return pos
        cy=-195;
        shape = int(random(0, 1));
        hasTouchedFirst =true;
      }
      if (cy>200 && sy+ 105> height) {//when match , return pos
        sy = cy-450;
      }
      if (sy > 200 && ny + 95 > height) {//when match , return pos
        ny=sy-450;   
        square.reset();
      }
      if (y <ny ) {//when match , return pos
        square.flip(square.sx/2, square.sy, square.sx1/2, square.sy1);
      }
      if (definelose()) {//if lose , draw lose
        lose();
        noLoop();
      }
    } else {
      if (simpleMode) {//if its simple mode
        text("Point: "+ point, 50, 50);//draw etxt
        ball.display(x);//display ball
        blocks.display(cx, cy);//draw block
        blocks.display(cx, sy);//draw block
        square.display(square.sx, square.sy, square.sx1, square.sy1, cx);//draw block
        /**make sure every bolck go around like aloop */
        if (cy+105 > height) {//when match , return pos
          cy=-195;
          shape = int(random(0, 1));
          hasTouchedFirst =true;
          sb = true;
        }
        if (cy>200 && sy+ 105> height) {//when match , return pos
          sy = cy-450;
          //hasTouchedFirst =true;
          //sb = true;
        }
        if (sy > 200 && ny + 95 > height) {//when match , return pos
          ny=sy-450;   
          square.reset();
        }
        if (y <ny ) {//when match , return pos
          square.flip(square.sx, square.sy, square.sx1, square.sy1);
          if (sb) {
            point += 1;
            sb = false;
          }
        }
        if (definelose()) {//if lose , do lose method
          lose();
          noLoop();
        }
        if (point == 3) {// point == 5 then u have win the simple mode do win 
          background(0);
          translate(0, 0);
          textSize(32);
          fill(255);
          text("Congrats! you past simple mode ! ", width/10, 200);
          for (Plane p : plane) {
            p.displayAll();//made a plane to celebrate
          }
          //noLoop();
        }
      } else {//if its infinite mode
        text("Point: "+ point, 50, 50);//draw etxt
        ball.display(x);//display ball
        blocks.display(cx, cy);//draw block
        blocks.display(cx, sy);//draw block
        square.display(square.sx, square.sy, square.sx1, square.sy1, cx);//draw block
        /**make sure every bolck go around like aloop */
        if (cy+105 > height) {//when match , return pos
          cy=-195;
          shape = int(random(0, 1));
          hasTouchedFirst =true;
          sb=true;
        }
        if (cy>200 && sy+ 105> height) {//when match , return pos
          sy = cy-450;
         // hasTouchedFirst =true;
         // sb=true;
        }
        if (sy > 200 && ny + 105 > height) {//when match , return pos
          ny=sy-450;   
          square.reset();
          //hasTouchedFirst =true;
        }
        if (y <ny ) {//when match , return pos
          square.flip(square.sx, square.sy, square.sx1, square.sy1);
          if (sb) {
            point += 1;
            sb = false;
          }
        }
        if (definelose()) {//if lose , do lose method
          lose();
          noLoop();
        }
        textSize(10);
        text("press o to exit",450,50);
      }
    }
  }
}


void mouseClicked() {  //mouse click
  start_game =true;// make boolean true
  sy+= 25;//move pos
  ny+=25;//move pos
  square.sy +=25;//move pos
  square.sy1 +=25;//move pos
  cy += 25;//move pos
  float a = 0 ;
  a += acce;//make gravity
  speed = 0 ;//change sppeed to make gravity
  y -= a;////move pos
}
void keyReleased() {
  start_game =true;//make boolean true
  if (!battleMode) {
    sy+= 25;//move pos
    ny+=25;//move pos
    square.sy +=25;//move pos
    square.sy1 +=25;//move pos
    cy += 25;//move pos
    float a = 0 ;
    a += acce;//make gravity
    speed = 0 ;//change sppeed to make gravity
    y -= a;////move pos
  }
  if (key == 'b') {
    battleMode = true;//for player to choose mode
  }
  if (key == 's') {
    simpleMode = true;//for player to choose mode
  }
  if (key == 'o' && !simpleMode) {
    exit();
  }
  if (key == 'w' && battleMode) {//for player to operate
    sy+= 25;//move pos
    ny+=25;//move pos
    square.sy +=25;//move pos
    square.sy1 +=25;//move pos
    cy += 25;//move pos
    float a = 0 ;
    a += acce;//make gravity
    speed = 0 ;//change sppeed to make gravity
    y -= a;////move pos
  }
}

void lose () {//do lose 
  background(0);
  translate(0, 0);
  textSize(32);
  fill(255);
  text("YOU LOSE ! ", width/2, 200);//draw text
  text("Your final point is " + point, width/5, 230);//draw text
}

boolean definelose() {
  /**if true situation does not match then return false*/
  boolean define = false;//make a boolean to define
  if ((y-ball.r)< cy+105 && (y+ball.r)>cy+75 && blocks.checkIfLose()) {
    define = true;//true situation
  } else if ((y-ball.r)< cy-75 && (y+ball.r)>cy-105 && blocks.checkIfLose()) {
    define = true;//true situation
  } else if (y > height ) {
    define = true;//true situation
  } else if ((y-ball.r)< sy+105 && (y+ball.r)>sy+75 && blocks.checkIfLose()) {
    define = true;//true situation
  } else if ((y-ball.r)< sy-75 && (y+ball.r)>sy-105 && blocks.checkIfLose()) {
    define = true;//true situation
  }
  return define;
}
