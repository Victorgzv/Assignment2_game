String gameState;
int score=0;
Player player;
Platform platform1,platform2;
void setup(){
size(800,600);
gameState="START";
platform1= new Platform(#00bfff,random(0,width-25),425,1,25);
platform2= new Platform(#F50707,random(0,width-25),300,-1,25);
player= new Player(400,20,0,20,#2F8E0A);
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
}
void winGame(){
}
void loseGame(){
}
void clearBackground(){
fill(255);
rect(0,0,width,height);
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