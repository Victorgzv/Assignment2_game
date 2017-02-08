class JetPack extends GameObject {
  color myColor;
  boolean active;
  int jetTime, jetCheck, timecheck;
  float time;
  int timeLeft;
  JetPack() {
    active=false;
    myColor=#F51414;
    timecheck=0;
    //Time to next spawn
    randomTime();
    pos = new PVector(random(100, 700), 300);
    forward = new PVector(random(-1, 1), random(-1, 1));
    forward.normalize();
  }
  void update(Player a) {
    if (active==true) {
      render();
      if (collisionListener(a)) {
        enablepack=true;
        jetTime=second();
        jetCheck=jetTime+15;
        if (jetCheck>59)
        {
          jetCheck=jetCheck-60;
        }
      }
      //resets with randomness if powerup leaves screen
      if (pos.x>width || pos.y<0)
      {
        move();
      }
    }
  }
  void reset()
  {
    active=false;
    pos.x=floor(random(0, 2))*width;
    if (pos.x>400) {
      // speed=-1*random(1, 3);
    } else {
      //speed=random(1, 3);
    }
    pos.y=random(50, 500);
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
    forward.x = sin(theta);
    forward.y  = -cos(theta);
    pos.add(forward);
    randomTime();
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
    timeLeft=((this.jetCheck+60-second())%60);
    if (enablepack==true)
    {
      fill(myColor);
      textSize(40);
      textAlign(CENTER, CENTER);
      text(timeLeft, 700, 35);
      if (timeLeft==0)
      {
        enablepack=false;
        //Change player color back to normal
      }
    }
  }
}