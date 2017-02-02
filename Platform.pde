class Platform{
  color Color;
  float  xpos,ypos,size,speed,initial_speed;
 
  public Platform(color c, float x, float y, float speed,float size){
      this.Color = c;
      this.xpos= x;
      this.ypos=y;
      this.speed=speed;
      this.initial_speed=speed;
      this.size=size;
  }
  void update(){
          //If the platform hits the borders
          if (xpos<0+size || xpos>width-size)
          {
          speed=speed*-1;//Change direction
          }
          xpos+=speed;
          fill(Color);
          //ellipse(xpos,ypos,(size),(size));
          rect(xpos,ypos, size ,size);
          fill(0,0,0);
          textSize(25);
          textAlign(CENTER);
          text("↑",xpos+12,ypos+22); 
  }
   
}