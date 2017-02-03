class Point extends GameObject{
  float theta;
  public Point(){
  theta=0;
  forward = new PVector(random(-1, 1), random(-1, 1));
  forward.normalize();
  
  }
  void render(){
  
  }
  void update(){
  }

}