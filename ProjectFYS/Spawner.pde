class Spawner
{
  PImage[] roadImages; 
  float randomNumber;
  float roadWidth;
  float roadHeight;
  float x = car.x;
  float y = car.y;
  
  int countRoads;
  
  float timermilliSec = millis();
  
  Spawner()
  {
    roadWidth = 1000;
    roadHeight = 500;
    roadImages = new PImage[2];
    randomNumber = (int)random(0, roadImages.length);
  }
  
  void Render()
  {
    timermilliSec = 0;
    roadImages[0] = loadImage("LangeBochtRechts.png");
    roadImages[1] = loadImage("LangeRechteWeg.png");
  }
  
  void Draw()
  {
    image(roadImages[1], x, y, roadWidth, roadHeight);
    if(timer.huidigeTijd > 5)
    {
      for(int i = 1; i < 5; i++)
      {
        image(roadImages[1], x, y - (i * roadHeight /2), roadWidth, roadHeight);
        countRoads++;
      }
    }
  }
  
  void ProcessInput(boolean[] keysPressed)
  {
        //vooruit
        if(keysPressed['w'])
        {
          float xRotate = cos(radians(car.rotate));
          float yRotate = sin(radians(car.rotate));
          x += xRotate * car.speed;
          y += yRotate * car.speed;
        }
        //Achteruit
        if(keysPressed['s'])
        {
          float xRotate = cos(radians(car.rotate));
          float yRotate = sin(radians(car.rotate));
          x -= xRotate * car.speed/2;
          y -= yRotate * car.speed/2;
        }
        //links
        if(keysPressed['a'])
        {
          car.rotate -= 2.5;
        }
        //rechts
        if(keysPressed['d'])
        {
          car.rotate += 2.5;
        }
  }
}
