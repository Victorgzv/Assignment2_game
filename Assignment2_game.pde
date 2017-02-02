String gameState;
Player player= new Player();
void setup(){
size(800,600);
gameState="START";
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