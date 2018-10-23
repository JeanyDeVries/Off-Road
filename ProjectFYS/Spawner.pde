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
<<<<<<< HEAD
    image(roadImages[1], x, y, roadWidth, roadHeight);
<<<<<<< HEAD
    if(t.huidigeTijd> 5)
=======
    if(timer.huidigeTijd > 5)
>>>>>>> 1bd8cbe780432a3705a249408bb474b1c62db9d2
=======
    spawn.add(roadImages[1]);
    image(spawn.get(0), x, y, roadWidth, roadHeight);
    if (timer.checkTime())
>>>>>>> Sam
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
      float xRotate = cos(radians(car.rotate));
      float yRotate = sin(radians(car.rotate));
      x += xRotate * car.speed;
      y += yRotate * car.speed;
    }
    //Achteruit
    if (keysPressed['s'])
    {
      float xRotate = cos(radians(car.rotate));
      float yRotate = sin(radians(car.rotate));
      x -= xRotate * car.speed/2;
      y -= yRotate * car.speed/2;
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
