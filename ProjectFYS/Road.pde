class Road
{
  PImage[] roadImages; 
  float randomNumber;
  float roadWidth;
  float roadHeight;
  float x = car.x;
  float y = car.y;

  int i = 0;
  
  float timermilliSec = millis();
  
  Road()
  {
    roadWidth = 1000;
    roadHeight = 500;
    roadImages = new PImage[10];
    randomNumber = (int)random(0, 1);
  }
  
  void Render()
  {
    timermilliSec = 0;
    roadImages[0] = loadImage("weg0.png");
    roadImages[1] = loadImage("weg1.png");
  }
  
  void ProcessInput(boolean[] keysPressed)
  {
    //vooruit
    if (keysPressed['w'])
    {
      if (car.speed < car.maxSpeed)
      {
       car.speed++; 
      }
      float xRotate = cos(radians(car.rotate));
      float yRotate = sin(radians(car.rotate));
      road.x += xRotate * car.speed;
      road.y += yRotate * car.speed;
    }
    else
    {
     if (car.speed > 0)
     {
      car.speed--; 
     }
    }
    //Achteruit
    if (keysPressed['s'])
    {
      if (car.speed > -(car.maxSpeed/2))
      {
        car.speed--;
      }
      float xRotate = cos(radians(car.rotate));
      float yRotate = sin(radians(car.rotate));
      road.x += xRotate * car.speed/2;
      road.y += yRotate * car.speed/2;
    }
    else
    {
     if (car.speed <= 0)
     {
      car.speed++; 
     }
    }
    //links
    if (keysPressed['a'])
    {
      car.rotate -= 2.5;
    }
    //rechts
    if (keysPressed['d'])
    {
      car.rotate += 2.5;
    }
  }
}
