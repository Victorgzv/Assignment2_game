import ddf.minim.*;
Minim minim;
AudioPlayer song;
String gameState;
int score=0;
ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
Player player;
Platform platform1, platform2;
Point point, point2;
JetPack power1;
Big power2;
SlowMotion power3;
boolean enablepack=false;
boolean slowed=false;
int d;
void setup() {
  //fullScreen();
  size(800, 700);
  minim = new Minim(this);
  gameState="START";
  platform1= new Platform( random(0, width-25), height/2+200, 1, 55);
  platform2= new Platform( random(0, width-25), height/2+50, -1, 55);
  player= new Player(400, 20, 3, 20, #FF8F05);
  power1= new JetPack();
  power2= new Big();
  power3= new SlowMotion();
  point = new Point(10);
  point2 = new Point(10);
  gameObjects.add(point);
  gameObjects.add(point2);
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
  }
}

void startGame() {
  textAlign(CENTER);
  textSize(18);
  fill(255, 0, 0);
  text("Click Anywhere to Play!!!", width/2, height/2);
  if (mousePressed==true) {
    gameState="PLAY";
      score=0;
  }
  if(gameState=="START"){
      splash();
  }
  if(gameState=="LOSE"){
  textAlign(CENTER);
  textSize(28);
  fill(255, 0, 0);
  text("Your score: "+ score, width/2, height/2-300);
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
  restart();
  startGame();
}
void clearBackground() {
  background(0);
  fill(0);
  rect(0, 0, width, height);
}

void  createPoints() {
  if (score>15) {
    for (int z=0; z<gameObjects.size(); z++) {
      GameObject go = gameObjects.get(z); 
      go.render();  
      go.update(player);
      go.render();
    }
  } else {
    GameObject go = gameObjects.get(0); 
    go.render();  
    go.update(player);
    go.render();
  }

  power1.update(player);
  power1.displayTimeLeft();
  //Active power ups
  d=((power1.timecheck+60-second())%60);
  if (d==0) {
    power1.active=true;
  }

  power2.update(player);
  power2.displayTimeLeft();
  //Active power ups
  d=((power2.timecheck+60-second())%60);
  if (d==0) {
    power2.active=true;
  }
  power3.update(player);
  power3.displayTimeLeft();
  //Active power ups
  d=((power3.timecheck+60-second())%60);
  if (d==0) {
    power3.active=true;
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
  if (key==('w') && enablepack==true) {
    if (player.vspeed>0) {
      player.vspeed=player.vspeed*0.2;
    }
    player.vspeed-=2;
  }
  if (key==('s') && enablepack==true) {
    if (player.vspeed<0) {
      player.vspeed=player.vspeed*0.2;
    }
    player.vspeed+=(2);
  }
}
void restart() {
  power1.active=false;
  power2.active=false;  
  power3.active=false;
  enablepack=false;
  slowed=false;
  power1.timeLeft=0;
  power2.timeLeft=0;
  power3.timeLeft=0;
  point.pos.x=random(60, width-60);
  point.pos.y=random(0, 350);
  point2.pos.x=random(60, width-60);
  point2.pos.y=random(0, 350);
}
void splash(){
      background(250);
      textSize(20);
      textAlign(CENTER,CENTER);
       fill(color( #FF8F05));
      text("Use 'a' and 'd' to accelerate     left or right", 400, 200);
      ellipse(475,203,20,20);
      
      fill(color(#32b9ff));
      text("Score points by collecting frogs",400,300);
  
      fill(0,0,0);
      textSize(20);
      textAlign(CENTER);
      
      
      fill(color(#ff7832));
      text("Bounce off of the platforms to not fall!",400,400);
      
      
      
      fill(0);
      text("Collect                         for powerups!",400,500);
      fill(color(#F51414));
      ellipse(320,490,25,25);
      fill(0);
      text("¤",320+0.41,490  +8.5);
      
      
      fill(color(#16ACF5));
      ellipse(361,490,25,25);
      fill(0);
      text("¤",361+0.41,490  +8.5);
     
      fill(color(#F9FA1E));
      ellipse(400,490,25,25);
      fill(0);
      text("¤",400+0.41,490  +8.5);
      
      textSize(18);
      fill(color(#F51414));
      text("Red enables JetPack (WASD)",400,550);
      fill(color(#16ACF5));
      text("Blue slows time",400,580);
       fill(color(#F9FA1E));
      text("Yellow increases size",400,610);
      textSize(40);
      fill(0);
      text("Click to Continue",400,700);
      
      
      
}