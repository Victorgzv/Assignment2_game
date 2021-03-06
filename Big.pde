class Big extends GameObject {
  color myColor;
  boolean active;
  int powerTime, powerTimeCheck, timecheck;
  float time;
  int timeLeft;
  AudioPlayer win;
  Big() {
    active=false;
    myColor=#F9FA1E;
    timecheck=0;
    //Time to next spawn
    randomTime();
    pos = new PVector(random(0, width/2), random(0,500));
    forward = new PVector(random(-1, 1), random(-1, 1));
    forward.normalize();
    win=minim.loadFile("powerUp.wav");
  }
  void update(Player a) {
    if (active==true) {

      if (collisionListener(a)) {
        win.play();
        win.rewind();
        player.size=35;
        powerTime=second();
        powerTimeCheck=powerTime+15;
        if (powerTimeCheck>59)
        {
          powerTimeCheck=powerTimeCheck-60;
        }
        reset();
      }
      //resets with randomness if powerup leaves screen
      if (pos.x>width || pos.y<0)
      {
        reset();
      }
      move();
      render();
    }
  }
  void reset()
  {
    active=false; 
    pos.x=random(0,width/2);
    pos.x=random(0,height/2);
    randomTime();  
  }
  void render() {
    fill(myColor);
    stroke(0);
      ellipse(pos.x, pos.y, size, size);
      fill(0);
      textSize(20);
      textAlign(CENTER);
      text("¤", pos.x+0.6, pos.y+7.5);
  }
  void move() {
    theta=random(0, 3.14f);
    forward.x = sin(theta)*2;
    forward.y  = -cos(theta)*2;
    pos.add(forward);
  }



  void randomTime() {
    time=second();
    timecheck=(second()+5+int(random(5, 15)));
  }
  //Calculate distance between player and power ball
  boolean collisionListener(Player a) {

    if (dist(pos.x, pos.y, a.xpos, a.ypos) < a.size ) { 
      return true;
    } else { 
      return false;
    }
  }
  void displayTimeLeft() {
    timeLeft=((this.powerTimeCheck+60-second())%60);
    if (player.size>20)
    {
      fill(myColor);
      textSize(20);
      text("Size: " , 620, 35);
      textAlign(CENTER, CENTER);
      text(timeLeft, 700, 35);
      if (timeLeft==0)
      {
       player.size=20;
        //Change player color back to normal
      }
    }
  }
}