class Car
{
  PImage carImage;
  float x;
  float y;
  float size;
  float rotate;
  float speed;
  float milliSec;
  float TimerSec;

  
  Car()
  {
    x = width/2;
    y = 600;
    size = 75;
    rotate = 90;
    speed = 7;
    
    milliSec = millis();
    TimerSec = milliSec / 1000;
  }
  
  void Draw()
  {
    carImage = loadImage("Car.png");
    fill(150, 0, 0);
    stroke(0);
    translate(x, y);
    rotate(radians(rotate));
    image(carImage, 0, 0, size * 2, size);
  }
  
  void ProcessInput(boolean[] keysPressed)
  {
        //vooruit
        if(keysPressed['w'])
        {
          float xRotate = cos(radians(rotate));
          float yRotate = sin(radians(rotate));
          x -= xRotate * speed;
          y -= yRotate * speed;
        }
        //Achteruit
        if(keysPressed['s'])
        {
          float xRotate = cos(radians(rotate));
          float yRotate = sin(radians(rotate));
          x += xRotate * speed/2;
          y += yRotate * speed/2;
        }
        //links
        if(keysPressed['a'])
        {
          rotate -= 2.5;
        }
        //rechts
        if(keysPressed['d'])
        {
          rotate += 2.5;
        }
  }
  
  void Death()
  {
    size = size - (TimerSec * 2);
    rotate += 30;
  }
}
