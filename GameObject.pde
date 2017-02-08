// An abstract class is a class that CANT be instiantiated
// You can only instantiate subclasses of abstract classes
// If the the subclass implements the abstract methods
abstract class GameObject
{
  PVector pos,forward;
  float size,theta;
  
  GameObject()
  {
    size=20;
  }
  
  abstract void update(Player a);  
  abstract void render();
  abstract boolean collisionListener(Player a);
  abstract void displayTimeLeft();
  //abstract void testMethod();  // Subclasses that dont implement 
  // This method are also abstract
}
  