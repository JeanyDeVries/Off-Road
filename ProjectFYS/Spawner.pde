class Spawner
{
  PImage[] roadImages; 
  float randomNumber;
  float roadWidth;
  float roadHeight;
  float x = car.x;
  float y = car.y;

  int i = 0;

  int countRoads;

  float timermilliSec = millis();

  Spawner()
  {
    roadWidth = 1000;
    roadHeight = 500;
    roadImages = new PImage[10];
    randomNumber = (int)random(0, 1);
  }

  void Render()
  {
    timermilliSec = 0;
    roadImages[0] = loadImage("LangeBochtRechts.png");
    roadImages[1] = loadImage("LangeRechteWeg.png");
  }

  void Draw()
  {
    spawn.add(roadImages[1]);
    image(spawn.get(0), x, y, roadWidth, roadHeight);
    if (timer.checkTime())
    {
      print(i);

      image(spawn.get(i), x, y - (i * roadHeight /2), roadWidth, roadHeight);
      countRoads++;
      spawn.add(roadImages[(int)random(0, 1)]);
      i++;
    }
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
      x += xRotate * car.speed;
      y += yRotate * car.speed;
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
      x += xRotate * car.speed/2;
      y += yRotate * car.speed/2;
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
