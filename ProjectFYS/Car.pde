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
  boolean track = false;

  int j = 1;

  AudioSnippet carNoise;
  PImage turnLeftCar, turnRightCar, forwardCar, tireTrack;

  //Variabelen van de auto declareren.
  Car()
  {
    x = width/2;
    y = 450;
    size = 75;
    rotate = 90;
    speed = 0;
    MAXSPEED = 15;
    
    huidigeFrames = frames;

    alive = true;

    //Laad de image voor de update zodat het niet elk frame uit het geheugen gehaalt hoeft te worden.
    carImage     = loadImage("car_sprite_straight.png");
    forwardCar   = loadImage("car_sprite_straight.png");
    turnRightCar = loadImage("car_sprite_turnR.png");
    turnLeftCar  = loadImage("car_sprite_turnL.png");
    tireTrack    = loadImage("tireTrack.png");
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

  void drawTrack()
  {
    //if(track)
    //{
    //  image(tireTrack, (car.x - car.size/2), (car.y + car.size*2));
    //}
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

    if (j == 1)
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
    if (alive && !collision.collisionOil)
    {
      //vooruit
      if (keys['w']  || keys['W'] || keys[UP])
      {
        this.speed++;
        //laadt bij elke toets een andere image in voor een animatie.
        carImage = forwardCar;
        track = true;
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
        this.rotate -= 3.0;
        carImage = turnLeftCar;
      }

      //rechts
      if (keys['d']  || keys['D'] || keys[RIGHT])
      {
        this.rotate += 3.0;
        carImage = turnRightCar;
      }
    } 
    if (!alive)
    {
      //Death animatie.
      spawner.death = true;
      size -= (frameCount - huidigeFrames)/25;
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
