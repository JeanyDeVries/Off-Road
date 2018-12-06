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
  float dy;
  float timer;
  
  int j = 1;

  boolean alive;
  
  PImage turnLeftCar, turnRightCar, forwardCar;

  //Variabelen van de auto declareren.
  Car()
  {
    x = width/2;
    y = 400;
    size = 75;
    rotate = 90;
    speed = 0;
    MAXSPEED = 15;

    alive = true;

    //Laad de image voor de update zodat het niet elk frame uit het geheugen gehaalt hoeft te worden.
    carImage = loadImage("car_sprite_straight.png");
    forwardCar = loadImage("car_sprite_straight.png");
    turnRightCar = loadImage("car_sprite_turnR.png");
    turnLeftCar = loadImage("car_sprite_turnL.png");
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
    float tijd = millis();
    highscore.finalscore = spawner.score;
    //Geeft de boolean 'alive' de waarde 'false' aan zodat we weten dat de speler dood is.
    alive = false;
    
    if (tijd - millis() > 200)
    {
      menu.stage = 3;
    }
    
    if(j == 1)
    {
      highscore.savescore();
      j++;
    }
  }

  //Verwerkt de ingedrukte toets in de array.
  void ProcessInput(boolean[] keysPressed)
  {   
    this.speed *= 0.98;
    //De input word alleen gelezen wanneer de speler nog 'alive' is.
    if (alive)
    {
      //vooruit
      if (keysPressed ['w']  || keysPressed ['W'])
      {
        this.speed++;
        //laadt bij elke toets een andere image in voor een animatie.
        carImage = forwardCar;
      }

      //Achteruit
      if (keysPressed ['s']  || keysPressed ['S'])
      {
        this.speed--;
        carImage = forwardCar;
      } 

      //links
      if (keysPressed ['a']  || keysPressed ['A'])
      {
        this.rotate -= 2.5;
        carImage = turnLeftCar;
      }

      //rechts
      if (keysPressed ['d']  || keysPressed ['D'])
      {
        this.rotate += 2.5;
        carImage = turnRightCar;
      }
    } 
    else
    {
      //Death animatie.
      timer = 0;
      timer = millis();
      size -= timer/1000 * 1.1;
      rotate += 20;
      if (size <= 0)
      {
        size = 0;
        youLose.play();
        youLose.amp(0.1);
        menu.stage = 3;
      }
    }

    //Dit zorgt ervoor dat de auto niet constant versnelt maar tot een Maximum.
    if (this.speed >= this.MAXSPEED)
    {
      this.speed = this.MAXSPEED;
    }

    if (this.speed <= -(this.MAXSPEED/2))
    {
      this.speed = -(this.MAXSPEED/2);
    }
  }
}
