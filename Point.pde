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
  void update(){
    theta += 0.1f;
    pos.add(forward);
    reenterscreen();
  }
   void reenterscreen()
       //treasure reenters screen after leaving it
        {
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

}