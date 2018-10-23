class Road
{
  PImage image; 
  int randomNumber;
  float roadWidth;
  float roadHeight;
  float x;
  float y;

  float timermilliSec = millis();

  Road(float x, float y)
  {
    roadWidth = 1000;
    roadHeight = 500;
    /*randomNumber = (int)random(0, 1.5);
    switch(randomNumber)
    {
      case 0:
        image = loadImage("weg0.png");        
        break;
      case 1:
        image = loadImage("weg1.png");
        break;
    }*/
    image = loadImage("weg0.png");   
    this.x = x;
    this.y = y;
  }

  void Render()
  {
    timermilliSec = 0;
    image(image, this.x, this.y, this.roadWidth, this.roadHeight);
  }

  void ProcessInput(boolean[] keysPressed)
  {
    y += car.speed;
    car.speed *= 0.8;
    
    //vooruit
    if (keysPressed['w'])
    {
      car.speed++;
      float xRotate = cos(radians(car.rotate));
      float yRotate = sin(radians(car.rotate));
      this.x += xRotate * car.speed;
      this.y += yRotate * car.speed;
    }

    //Achteruit
    if (keysPressed['s'])
    {
      car.speed--;
      float xRotate = cos(radians(car.rotate));
      float yRotate = sin(radians(car.rotate));
      this.x += xRotate * car.speed/2;
      this.y += yRotate * car.speed/2;
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
