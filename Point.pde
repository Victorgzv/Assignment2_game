class Point extends GameObject {
  
  float radius;
  PShape frog, head, body, legUpL, legUpR, legDownL, legDownR;
  Point(float size) {
    this.size=size;
    theta=0;
    pos = new PVector(random(100, 700), random(100, 200));
    forward = new PVector(sin(theta), -cos(theta));
    forward.normalize();
    radius= size/2;
    create();
  }
  void create() {
    // Create the shape group
    frog = createShape(GROUP);
    legUpL = createShape(LINE, 0, 0, -radius-size, -radius-size);
    legUpL.setStroke(color(#20C927));
    legUpR = createShape(LINE, 0, 0, +radius+size, -radius-size);
    legUpR.setStroke(color(#20C927));
    legDownL = createShape(LINE, 0, 0, -radius-size, radius+size);
    legDownL.setStroke(color(#20C927));
    legDownR = createShape(LINE, 0, 0, radius+size, radius+size);
    legDownR.setStroke(color(#20C927));
    noStroke();
    head = createShape(ELLIPSE, 0, -radius-size, 10, 10);
    head.setFill(color(#20C927));
    body = createShape(ELLIPSE, 0, 0, 25, 25);
    body.setFill(color(#20C927));

    frog.addChild(legUpL);
    frog.addChild(legUpR);
    frog.addChild(legDownL);
    frog.addChild(legDownR);
    frog.addChild(body);
    frog.addChild(head);
  }
  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    shape(frog, 0, 0);
    popMatrix(); // Restore the transform
  }
  void update(Player a) {

    reenterscreen();
    if (collisionListener(a))
    {
      score+=1;  
      pos.x=random(60, width-60);
      pos.y=random(0+size*2, 350);
      theta=random(0, 3.14f);
    }
    //move with score
    if (score>=5) {
      forward.x = sin(theta);
      forward.y  = -cos(theta);
      pos.add(forward);
    }
    if (score>=10) {
      forward.x = sin(theta)*0.5;
      forward.y  = -cos(theta)*0.5;
      pos.add(forward);
    }
    if (score>=15) {
      forward.x = sin(theta)*1;
      forward.y  = -cos(theta)*1;
      pos.add(forward);
    }
    if (score>=20) {
      forward.x = sin(theta)*2;
      forward.y  = -cos(theta)*2;
      pos.add(forward);
    }
    if (score>=25) {
      forward.x = sin(theta)*2.5;
      forward.y  = -cos(theta)*2.5;
      pos.add(forward);
    }
  }
  void reenterscreen() {

    //bounce off walls
    if (pos.x>800) {//Left wall
      theta = random(-1, -2.5f);
      forward.x = sin(theta);
      forward.y  = -cos(theta);
      pos.add(forward);
    }
    if (pos.x<0) {//right wall
      theta = random(1, 2.5f);
      forward.x = sin(theta);
      forward.y  = -cos(theta);
      pos.add(forward);
    }
    //bounce off top of screen
    if (pos.y<0) {
      //forward = new PVector(random(-1,1),1);
      theta = random(0.0, 3.14f);
      forward.x = sin(theta);
      forward.y  = -cos(theta);
      pos.add(forward);
    }
    //Reach bottom of the screen
    if (pos.y>height) {
      pos.x=random(60, width-60);
      pos.y=random(0+size*2, 350);
      theta = random(0.0, 3.14f);
      forward.x = sin(theta);
      forward.y  = -cos(theta);
      pos.add(forward);
    }
  }
  //Calculate distance between player and point
  boolean collisionListener(Player a) {

    if (dist(pos.x, pos.y, a.xpos, a.ypos) < a.size ) { 
      return true;
    } else { 
      return false;
    }
  }
  void displayTimeLeft(){}
}