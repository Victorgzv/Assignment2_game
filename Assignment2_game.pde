String gameState;
int score=0;
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
Player player;
Platform platform1,platform2;
void setup(){
size(800,600);
gameState="START";
platform1= new Platform(#00bfff,random(0,width-25),425,1,25);
platform2= new Platform(#F50707,random(0,width-25),300,-1,25);
player= new Player(400,20,3,20,#2F8E0A);
}
void draw(){
  clearBackground();
  if(gameState =="START"){
    startGame();
  }else if(gameState =="PLAY"){
    playGame();
  }else if(gameState =="WIN"){
    winGame();
  }else if(gameState =="LOSE"){
    loseGame();
     startGame();
  }
 
}

void startGame(){
  textAlign(CENTER);
  textSize(18);
  fill(255,0,0);
  text("Click Anywhere to Play!!!",width/2,height/2);
  if(mousePressed==true){
    gameState="PLAY";
  }
}
void playGame(){
  platform1.update();
  platform2.update();
  player.render();
  player.update(platform1,platform2);
  createPoints();
}
void winGame(){
}
void loseGame(){
}
void clearBackground(){
    background(255);
fill(255);
rect(0,0,width,height);
}

void  createPoints(){


   
  
    Point point = new Point();
    point.pos = new PVector(random(100, 700), random(100, 350));
   
    gameObjects.add(point);
     GameObject go = gameObjects.get(0); 
    go.update();
    go.render();    
  
  
  



}

void keyPressed()
    {
      if (key=='a' && gameState =="PLAY"){
        if (player.hspeed>-30 ){
          player.hspeed+=-2;
        }
      }
      if (key==('d')&& gameState =="PLAY"){
        if (player.hspeed<30){
          player.hspeed+=2;
        }
      }
 
    }