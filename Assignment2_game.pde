String gameState;
void setup(){
size(800,600);
gameState="START";
}
void draw(){
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