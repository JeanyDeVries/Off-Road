class Car
{
  //variabelen
  PImage carImage;
  float x;
  float y;
  float size;
  float rotate;
  float speed;
  final float MAXSPEED;
  float TimerSec;
  float timer;
  float dy;
  
  boolean alive;
  
  // variabelen auto declareren
  Car()
  {
    x = width/2;
    y = 600;
    size = 75;
    rotate = 90;
    speed = 0;
    MAXSPEED = 12;
    
    timer = millis();
    TimerSec = timer/1000;
    
    alive = true;
    
    carImage = loadImage("car_sprite_straight.png");
  }
  
  void Draw()
  {
    
    fill(150, 0, 0);
    stroke(0);
    translate(x, y);
    rotate(radians(rotate));
    image(carImage, 0, 0, size * 2, size);
    rotate(radians(-rotate));
    translate(-x, -y);
    
    dy = y + speed;
  }
 
  //Dood animatie
  void Death()
  {
    highscore.finalscore = spawner.score;
    println(highscore.finalscore);
    alive = false;

  }
  
  void ProcessInput(boolean[] keysPressed)
  {   
    this.speed *= 0.9;
    
    if(alive)
    {
      //vooruit
      if (keysPressed['w'])
      {
        this.speed++;   
      }
  
      //Achteruit
      if (keysPressed['s'])
      {
        this.speed--;
      } 
      
      //links
      if (keysPressed['a'])
      {
        this.rotate -= 2.5;
      }
      //rechts
      if (keysPressed['d'])
      {
        this.rotate += 2.5;
      }
    } 
    else
    {
      size = size - (TimerSec * 2);
      rotate += 60;
      if(size <= 0)
      {
        size = 0;
        stage = 4;
      }
    }
    
    if(this.speed >= this.MAXSPEED)
    {
      this.speed = this.MAXSPEED;
    }
    
    if(this.speed <= -(this.MAXSPEED/2))
    {
      this.speed = -(this.MAXSPEED/2);
    }
    
    if(this.rotate >= 360 || this.rotate <= -360)
    {
      this.rotate = 0;
    }
  }
  
  //colllision
  boolean collidesWithRoad(Spawner spawner) 
  {
    boolean leftInRoad = false;
    boolean rightInRoad = false;
    boolean topInRoad = false;
    boolean bottomInRoad = false;
    for(Road road : spawner.roads)
    {
      if(car.x > road.x - road.roadWidth / 2)
      {
        leftInRoad = true;
      }
      
      if(car.x < road.x + road.roadWidth / 2)
      {
        rightInRoad = true;
      }
      
      if(car.y > road.y - road.roadHeight / 2)
      {
        topInRoad = true;
      }
      
      if(car.y < road.y + road.roadHeight / 2)
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
