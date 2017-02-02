String gameState;
int score=0;
Player player= new Player();
Platform platform1,platform2;
void setup(){
size(800,600);
gameState="START";
platform1= new Platform(#00bfff,random(0,width),425,1,25);
platform2= new Platform(#F50707,random(0,width),300,-1,25);
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
  
}
void winGame(){
}
void loseGame(){
}
void clearBackground(){
fill(255);
rect(0,0,width,height);
}

void keypressed() {

}