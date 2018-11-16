class Car
{
  //Variabelen van de class Car.
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
  
  //Variabelen van de auto declareren.
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
    
    //Laad de image voor de update zodat het niet elk frame uit het geheugen gehaalt hoeft te worden.
    carImage = loadImage("car_sprite_straight.png");
  }
  
  void Draw()
  {
    //Tekent de auto en geeft het een positie volgens de variabelen.
    fill(150, 0, 0);
    stroke(0);
    translate(x, y);
    rotate(radians(rotate));
    image(carImage, 0, 0, size * 2, size);
    rotate(radians(-rotate));
    translate(-x, -y);
    
    dy = y + speed;
  }
 
 
  void Death()
  {
    highscore.finalscore = spawner.score;
    //Geeft de boolean 'alive' de waarde 'false' aan zodat we weten dat de speler dood is.
    alive = false;
    menu.stage = 3;
  }
  
  //Verwerkt de ingedrukte toets in de array.
  void ProcessInput(boolean[] keysPressed)
  {   
    this.speed *= 0.9;
    //De input word alleen gelezen wanneer de speler nog 'alive' is.
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
      //Death animatie.
      size = size - (TimerSec * 2);
      rotate += 60;
      if(size <= 0)
      {
        size = 0;
        menu.stage = 4;
      }
    }
    
    //Dit zorgt ervoor dat de auto niet constant versnelt maar tot een Maximum.
    if(this.speed >= this.MAXSPEED)
    {
      this.speed = this.MAXSPEED;
    }
    
    if(this.speed <= -(this.MAXSPEED/2))
    {
      this.speed = -(this.MAXSPEED/2);
    }
  }
  
  //Colllision
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
        //Returnt alleen 'true' wanneer de auto op de road staat.
        return true;
      }
    }
    return false;
  }
}
