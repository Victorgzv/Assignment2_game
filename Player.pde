class Player{
   boolean bounced;
   int size;
   float xpos,ypos,acceleration,vspeed,hspeed;
   color Color;
  public Player(int x, int y, float speed, int size,color c){
        this.xpos=x;
        this.ypos=y;
        this.vspeed=speed;
        this.hspeed=0;
        this.size=size;
        this.acceleration=0.07;
        this.Color=c;
  }
  void render(){
    
          ypos+=vspeed;
          //bounce off walls
          if (xpos>800){
            hspeed=-0.7*hspeed;
            xpos=800;
          }
          if (xpos<0){
            hspeed=-0.7*hspeed;
            xpos=0;
          }
          //bounce off top of screen
          if (ypos<0){
            vspeed=-0.5*vspeed;
            ypos=0;
          }
          if (ypos>height){
          score=0;
           
          }
   xpos+=hspeed;
          fill(Color);
          ellipse(xpos,ypos,size,size);
  
  }
}