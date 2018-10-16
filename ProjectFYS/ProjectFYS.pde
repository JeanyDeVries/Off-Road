Car car;
Road road;
Spawner spawner;
boolean[] keysPressed = new boolean[256];

void setup()
{
  size(1280, 720);
  car = new Car();
  road = new Road();
  spawner = new Spawner();
  spawner.Render();
} 

void update()
{
  imageMode(CENTER);
  spawner.Draw();
  rectMode(CORNER);
  //road.Render();
  imageMode(CENTER);
  car.Draw();
  
  if(car.x < spawner.x || car.x > spawner.x)
  {
    
  }
  //collision detecten tussen road en car
  //if((car.x <= road.x - 10|| car.x >= ((road.x + 10) + road.w)) && car.size >= 0)
  //{
  //  car.Death();
  //}
  //else
  //{
    spawner.ProcessInput(keysPressed);
  //}
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
