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
  
  int huidigeFrames; 
  boolean alive;
  
  int j = 1;
  
  AudioSnippet carNoise;
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
    
    huidigeFrames = frames;
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
    //Geeft de boolean 'alive' de waarde 'false' aan zodat we weten dat de speler dood is.
    highscore.finalscore = spawner.score;
      highscore.savescore();

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
  void ProcessInput(boolean[] keys)
  {   
    this.speed *= 0.98;
    //De input word alleen gelezen wanneer de speler nog 'alive' is.
    if (alive)
    {
      //vooruit
      if (keys['w']  || keys['W'] || keys[UP])
      {
        this.speed++;
        //laadt bij elke toets een andere image in voor een animatie.
        carImage = forwardCar;
      }

      //Achteruit
      if (keys['s']  || keys['S'] || keys[DOWN])
      {
        this.speed--;
        carImage = forwardCar;
      } 

      //links
      if (keys['a']  || keys['A'] || keys[LEFT])
      {
        this.rotate -= 2.5;
        carImage = turnLeftCar;
      }

      //rechts
      if (keys['d']  || keys['D'] || keys[RIGHT])
      {
        this.rotate += 2.5;
        carImage = turnRightCar;
      }
    } 
    if(!alive && !collision.collisionOil)
    {
      //Death animatie.
      size -= (frameCount - huidigeFrames)/50;
      rotate += 20;
      if (size <= 0)
      {
        size = 0;
        youLose.play();
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
