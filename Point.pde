class Point extends GameObject{
  float theta;
  public Point(){
  theta=0;
  forward = new PVector(random(-1, 1), random(-1, 1));
  forward.normalize();
  
  }
  void render(){
    pushMatrix();
    translate(pos.x, pos.y);
    fill(0);
   // rotate(theta);
    
   
    ellipse(0, 0, 30, 30);
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
     //Calculate distance between player and platforms
  boolean collisionListener(Player a){
    
    if(dist(pos.x, pos.y, a.xpos, a.ypos) < a.size ) { 
       return true;
    } else { 
       return false;
    }
  }

}