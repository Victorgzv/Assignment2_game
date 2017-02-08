class JetPack extends GameObject {
  color myColor;
  boolean active;
  int jetTime, jetCheck, timecheck;
  JetPack() {
    active=false;
    myColor=#F51414;
    timecheck=0;
    pos = new PVector(random(100, 700), random(100, 200));
    forward = new PVector(random(-1, 1), random(-1, 1));
    forward.normalize();
  }
  void update(Player a) {
    if (active==true) {
      if (collisionListener(a)) {
        enablepack=true;
        jetTime=second();
        jetCheck=jetTime+15;
        if (jetCheck>59)
        {
          jetCheck=jetCheck-60;
        }
        reset();
      }
    }
  }

  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(myColor);
    ellipse(pos.x, pos.y, size, size);
    textSize(20);
    textAlign(CENTER);
    text("¤", pos.x+0.6, pos.y+7.5);
    popMatrix(); // Restore the transform
  }
  //Calculate distance between player and power ball
  boolean collisionListener(Player a) {

    if (dist(pos.x, pos.y, a.xpos, a.ypos) < a.size ) { 
      return true;
    } else { 
      return false;
    }
  }
}