String gameState;
int score=0;
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
Player player;
Platform platform1, platform2;
JetPack j1;
boolean enablepack=false;
boolean slowed=false;
float timeDelta = 1.0f / 60.0f;
int d;
void setup() {
  //fullScreen();
  size(800, 700);
  gameState="START";
  platform1= new Platform(#00bfff, random(0, width-25), height/2+200, 1, 55);
  platform2= new Platform(#F50707, random(0, width-25), height/2+50, -1, 55);
  player= new Player(400, 20, 3, 30, #2F8E0A);
  j1= new JetPack();
}
void draw() {
  clearBackground();
  if (gameState =="START") {
    startGame();
  } else if (gameState =="PLAY") {
    playGame();
  } else if (gameState =="WIN") {
    winGame();
  } else if (gameState =="LOSE") {
    loseGame();
    startGame();
  }
}

void startGame() {
  textAlign(CENTER);
  textSize(18);
  fill(255, 0, 0);
  text("Click Anywhere to Play!!!", width/2, height/2);
  if (mousePressed==true) {
    gameState="PLAY";
  }
}
void playGame() {
  platform1.update();
  platform2.update();
  player.render();
  player.update(platform1, platform2);
  createPoints();
  printScore();
}
void winGame() {
}
void loseGame() {
}
void clearBackground() {
  background(255);
  fill(255);
  rect(0, 0, width, height);
}

void  createPoints() {
  Point point = new Point(10);
  gameObjects.add(point);
  GameObject go = gameObjects.get(0); 
  go.render();  
  go.update(player);
  go.render();
  j1.update(player);
  j1.displayTimeLeft();
  //Active power ups
  d=((j1.timecheck+60-second())%60);
      if (d==0){
      j1.active=true; 
}
}
void printScore() {
  fill(0, 102, 153);
  textSize(70);
  textAlign(CENTER, CENTER);
  text(score, 400, 200);
  fill(200, 50, 53);
  int level=(floor(score/5)+1);
  textSize(30);
  textAlign(CENTER, CENTER);
  text(("Level "+str(level)), 400, 35);
}
void keyPressed()
{
  if (key=='a' && gameState =="PLAY") {
    if (player.hspeed>-30 ) {
      player.hspeed+=-2;
    }
  }
  if (key==('d')&& gameState =="PLAY") {
    if (player.hspeed<30) {
      player.hspeed+=2;
    }
  }
  if (key==('m')&& gameState =="PLAY") {
    score++;
  }
  if (key==('w') && enablepack==true){
    if (player.vspeed>0){
      player.vspeed=player.vspeed*0.2;
    }
    player.vspeed-=2;
  }
  if (key==('s') && enablepack==true){
    if (player.vspeed<0){
      player.vspeed=player.vspeed*0.2;
    }
    player.vspeed+=(2);
  }
}