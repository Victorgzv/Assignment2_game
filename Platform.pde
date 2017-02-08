
class Platform{
 
  float  xpos,ypos,size,speed,initial_speed;
 
  public Platform( float x, float y, float speed,float size){
      
      this.xpos= x;
      this.ypos=y;
      this.speed=speed;
      this.initial_speed=speed;
      this.size=size;
  }
  void update(){
          //If the platform hits the borders
          if (xpos<0 || xpos>width-size)
          {
          speed=speed*-1;//Change direction
          }
          xpos+=speed;
          fill(0);
          //ellipse(xpos,ypos,(size),(size));
          
          rect(xpos,ypos, size ,10);
          //fill(0,0,0);
          //extSize(25);
          //textAlign(CENTER);
          //text("↑",xpos+12,ypos+22); 
  }
   
}