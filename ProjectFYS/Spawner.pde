class Spawner
{
  PImage[] roadImages; 
  float randomNumber;
  float roadWidth;
  float roadHeight;
  float x = car.x;
  float y = car.y;
  
  Spawner()
  {
    roadWidth = 1000;
    roadHeight = 500;
    roadImages = new PImage[2];
    randomNumber = (int)random(0, roadImages.length);
  }
  
  void Render()
  {
    roadImages[0] = loadImage("LangeBochtRechts.png");
    roadImages[1] = loadImage("LangeRechteWeg.png");
  }
  
  void Draw()
  {
    for(int i = 0; i < 5; i++)
    {
      image(roadImages[1], x, y - (i * roadHeight /2), roadWidth, roadHeight);
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
