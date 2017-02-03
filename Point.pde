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
        pos.y=random(100,350);
        println(score);
      }
    //move with score
      if (score>=5)
        {
        theta += 0.1f;
    pos.add(forward);
        }
  }
   void reenterscreen(){
           //point reenters screen after leaving it
        if (pos.x>width)
        {
        pos.x=0;
        }
        if (pos.x<0){
        pos.x=width;
        }
        if (pos.y>height)
        {
        pos.y=0;
        }
        if (pos.y<0){
        pos.y=height;
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