class Car
{
  PImage carImage;
  float x;
  float y;
  float size;
  float rotate;
  float speed;
  float maxSpeed;
  float TimerSec;
  float timer;
  
  boolean alive;
  

  
  Car()
  {
    x = width/2;
    y = 600;
    size = 75;
    rotate = 90;
    speed = 0;
    maxSpeed = 7;
    
    timer = millis();
    TimerSec = timer/1000;

    alive = true;
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
  
  
  
  void Death()
  {
    size = size - (TimerSec * 2);
    rotate += 60;
    if(size <= 0)
    {
      size = 0;
    }
  }
  
  boolean collidesWithRoad(Car car) 
  {
    boolean leftInRoad = false;
    boolean rightInRoad = false;
    boolean topInRoad = false;
    boolean bottomInRoad = false;
    for(Road road : spawner.roads)
    {
      if(car.x > road.x - (size * 2))
      {
        leftInRoad = true;
      }
      
      if(car.x < road.x + (size * 2))
      {
        rightInRoad = true;
      }
      
      if(car.y > road.x - (size * 2))
      {
        topInRoad = true;
      }
      
      if(car.y < road.y + (size * 2))
      {
        bottomInRoad = true;
      }
      
      if (leftInRoad && rightInRoad && topInRoad && bottomInRoad)
      {
        return true;
      }
    }
    return false;
  }
}
