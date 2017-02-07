class Power extends GameObject{
    String type;
    color mycolor;
    boolean active;
    float size,speed,duration,time,xpos,ypos;
    int magnettime,jettime,sizetime,slowtime;
    int sizecheck,magnetcheck,jetcheck,slowcheck,timecheck;
    String [] powers={"jet pack","size +","slowmo","magnet"};
    color [] powercolors={#00ff66,#ff00ff,#006666};
public Power(){
            active=false;
            speed=2;
            timecheck=0;
            //time to next spawn
            randomTime();
            pos.x=0;
            pos.y=300;
            size=25;
            type=randomPower();

}
void update(Player a)
          {              
            //once activated:
            if (active==true){
              
              //applies effect if it touches Stan
              if (collisionListener(a))
                  {
                    //size + powerup
                  if (type=="size +")
                      {
                      a.size=35;
                      sizetime=second();
                      sizecheck=sizetime+20;
                      a.Color=(#ff00ff);
                      if (sizecheck>59)
                        {
                          sizecheck=sizecheck-60;
                        }
                      }
                  if (type=="jet pack")
                      {
                      enablepack=true;
                      jettime=second();
                      jetcheck=jettime+15;
                      if (jetcheck>59)
                        {
                          jetcheck=jetcheck-60;
                        }
                      }
                  if (type=="slowmo")
                      {
                      frameRate(15);
                      slowed=true;
                      slowtime=second();
                      slowcheck=slowtime+15;
                      if (slowcheck>59)
                        {
                          slowcheck=slowcheck-60;
                        }
                      }
                  reset();
                  }
            }
          }
 void render(){
 
 
 }
 void reset()
              {
              active=false;
              xpos=floor(random(0,2))*800;
              if (xpos>400){
               speed=-1*random(1,3); 
              }
              else{
              speed=random(1,3); 
              }
              type=randomPower();
              ypos=random(50,500);
              randomTime();  
              }
 
String randomPower(){
   int a=int(random(0,3));
   mycolor=powercolors[a];
   return(powers[a]);
}
void randomTime(){
   time=second();
   timecheck=(second()+5+int(random(5,15)));
}
     //Calculate distance between player and power ball
  boolean collisionListener(Player a){
    
    if(dist(pos.x, pos.y, a.xpos, a.ypos) < a.size ) { 
       return true;
    } else { 
       return false;
    }
  }

}