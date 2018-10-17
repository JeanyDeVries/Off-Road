Car car;
Spawner spawner;
boolean[] keysPressed = new boolean[256];
Timer timer = new Timer(5000);

void setup()
{
  size(1280, 720, P2D);
  car = new Car();
  spawner = new Spawner();
  spawner.Render();
} 

void update()
{
  if (timer.checkTime())
  {
   println();
  }
  imageMode(CENTER);
  spawner.Draw();
  car.Draw();

  spawner.ProcessInput(keysPressed);
  
  if (!car.collidesWithRoad(car)) 
  {
    car.Death();
  }
}

void draw()
{
  background(160, 200, 230);
  update();
}

void keyPressed()
{
  keysPressed[key] = true;
}

void keyReleased()
{
  keysPressed[key] = false;
}
