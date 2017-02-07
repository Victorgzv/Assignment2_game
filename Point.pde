class Point extends GameObject{
  float theta;
  PShape frog, head, body,legUpL,legUpR,legDownL,legDownR;
  public Point(){
  theta=0;
  pos = new PVector(random(100, 700), random(100, 200));
  forward = new PVector(random(-1, 1), random(-1, 1));
  forward.normalize();

  }
  void create(){
  // Create the shape group
  frog = createShape(GROUP);
  legUpL = createShape(LINE, 60, 100, 10, 60);
  legUpL.setStroke(color(#20C927));
  legUpR = createShape(LINE, 60, 100, 110, 60);
  legUpR.setStroke(color(#20C927));
  legDownL = createShape(LINE, 60, 100, 10, 140);
  legDownL.setStroke(color(#20C927));
  legDownR = createShape(LINE, 60, 100, 110, 140);
  legDownR.setStroke(color(#20C927));
  noStroke();
  head = createShape(ELLIPSE, 60, 70, 30, 30);
  head.setFill(color(#20C927));
  body = createShape(ELLIPSE, 60, 100, 60, 60);
  body.setFill(color(#20C927));
  
  frog.addChild(legUpL);
  frog.addChild(legUpR);
  frog.addChild(legDownL);
  frog.addChild(legDownR);
  frog.addChild(body);
  frog.addChild(head);
  
  
  }
  void render(){
    pushMatrix();
    translate(pos.x, pos.y);
    fill(0);
   // rotate(theta);
    ellipse(0, 0, size, size);
    popMatrix();
  }
  void update(Player a){
   
    reenterscreen();
      if (collisionListener(a))
      {
        score+=1;  
        pos.x=random(100,700);
        pos.y=random(50,200);
        println(score);
      }
    //move with score
      if (score>=5)
        {
        //theta += 0.1f;
    pos.add(forward);
        }
  }
   void reenterscreen(){
      
         //bounce off walls
          if (pos.x>800){//Left wall
            forward = new PVector(-1,random(-1,1));
            pos.add(forward);
          }
          if (pos.x<0){//right wall
            forward = new PVector(1,random(-1,1));
            pos.add(forward);
          }
          //bounce off top of screen
          if (pos.y<0){
           forward = new PVector(random(-1,1),1);
           pos.add(forward);
          }
          //Reach bottom of the screen
          if (pos.y>height){
           forward = new PVector(random(-1,1),-1);
            pos.add(forward);
          }
    }
     //Calculate distance between player and point
  boolean collisionListener(Player a){
    
    if(dist(pos.x, pos.y, a.xpos, a.ypos) < a.size ) { 
       return true;
    } else { 
       return false;
    }
  }

}