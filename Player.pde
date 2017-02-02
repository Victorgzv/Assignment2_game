class Player{
   boolean bounced;
   int size;
   float xpos,ypos,acceleration,vspeed,hspeed;
   color Color;
  public Player(int x, int y, float speed, int size,color c){
        this.ypos=y;
        this.vspeed=speed;
        this.hspeed=0;
        this.size=size;
        this.acceleration=0.07;
        this.Color=c;
        
  }
}