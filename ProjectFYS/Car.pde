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

  boolean alive;

  //Variabelen van de auto declareren.
  Car()
  {
    x = width/2;
    y = 360;
    size = 75;
    rotate = 90;
    speed = 0;
    MAXSPEED = 15;

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
    float tijd = millis();
    highscore.finalscore = spawner.score;
    //Geeft de boolean 'alive' de waarde 'false' aan zodat we weten dat de speler dood is.
    alive = false;
    if (tijd - millis() > 200)
    {
      menu.stage = 3;
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
      if (keysPressed['w'])
      {
        this.speed++;
        carImage = loadImage("car_sprite_straight.png");
      }

      //Achteruit
      if (keysPressed['s'])
      {
        this.speed--;
        carImage = loadImage("car_sprite_straight.png");
      } 

      //links
      if (keysPressed['a'])
      {
        this.rotate -= 2.5;
        carImage = loadImage("car_sprite_turnL.png");
      }

      //rechts
      if (keysPressed['d'])
      {
        this.rotate += 2.5;
        carImage = loadImage("car_sprite_turnR.png");
      }
    } else
    {
      //Death animatie.
      timer = 0;
      timer = millis();
      size -= timer/1000 * 1.1;
      rotate += 20;
      if (size <= 0)
      {
        size = 0;
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

  //Colllision
  boolean collidesWithRoad(Spawner spawner) 
  {
    for (Road road : spawner.roads)
    {
      boolean leftInRoad = false;
      boolean rightInRoad = false;
      boolean topInRoad = false;
      boolean bottomInRoad = false;

      if(road.type == RoadType.STRAIGHT)
      {
        if(car.x - car.size + rotate > road.x - road.roadWidth / 2)
        {
          leftInRoad = true;
        }
        
        if(car.x - car.size + rotate < road.x + road.roadWidth / 2)
        {
          rightInRoad = true;
        }
        if (car.y > road.y - road.roadHeight / 2)
        {
          topInRoad = true;
        }
  
        if (car.y < road.y + road.roadHeight / 2)
        {
          bottomInRoad = true;
        }
      }

      if(road.type == RoadType.SIDEWAYS)
      {
        if(car.x - car.size + rotate > road.x - road.roadWidth / 2)
        {
          leftInRoad = true;
        }
    
        if(car.x - car.size + rotate < road.x + road.roadWidth / 2)
        {
          rightInRoad = true;
        }
        if (car.y > road.y - road.roadHeight / 2 + road.barrierWidth)
        {
          topInRoad = true;
        }
    
        if (car.y < road.y + road.roadHeight / 2 - road.barrierWidth)
        {
          bottomInRoad = true;
        }
      }
      
      if(road.type == RoadType.LEFT_SIDE)
      {
        if(car.x - car.size + rotate > road.x - road.roadWidth / 2 + road.barrierWidth)
        {
          leftInRoad = true;
        }
    
        if(car.x - car.size + rotate < road.x + road.roadWidth / 2)
        {
          rightInRoad = true;
        }
        if (car.y > road.y - road.roadHeight / 2)
        {
          topInRoad = true;
        }
    
        if (car.y < road.y + road.roadHeight / 2 - road.barrierWidth)
        {
          bottomInRoad = true;
        }
      }
      if(road.type == RoadType.RIGHT_SIDE)
      {
        if(car.x - car.size + rotate > road.x - road.roadWidth / 2)
        {
          leftInRoad = true;
        }
    
        if(car.x - car.size + rotate < road.x + road.roadWidth / 2 + road.barrierWidth)
        {
          rightInRoad = true;
        }
        if (car.y > road.y - road.roadHeight / 2 - road.barrierWidth)
        {
          topInRoad = true;
        }
    
        if (car.y < road.y + road.roadHeight / 2)
        {
          bottomInRoad = true;
        }
      }
      if(road.type == RoadType.RIGHT)
      {
        if(car.x - car.size + rotate > road.x - road.roadWidth / 2 + road.barrierWidth)
        {
          leftInRoad = true;
        }
    
        if(car.x - car.size + rotate < road.x + road.roadWidth / 2)
        {
          rightInRoad = true;
        }
        if (car.y > road.y - road.roadHeight / 2 + road.barrierWidth)
        {
          topInRoad = true;
        }
    
        if (car.y < road.y + road.roadHeight / 2)
        {
          bottomInRoad = true;
        }
      }
      
      if(road.type == RoadType.LEFT)
      {
        if(car.x - car.size + rotate > road.x - road.roadWidth / 2)
        {
          leftInRoad = true;
        }
    
        if(car.x - car.size + rotate < road.x + road.roadWidth / 2 + road.barrierWidth)
        {
          rightInRoad = true;
        }
        if (car.y > road.y - road.roadHeight / 2 + road.barrierWidth)
        {
          topInRoad = true;
        }
    
        if (car.y < road.y + road.roadHeight / 2)
        {
          bottomInRoad = true;
        }
      }
      
      if(road.type == RoadType.OBSTACLE_HOLE_SIDEWAYS)
      {
        if(car.x - car.size + rotate > road.x - road.roadWidth / 2)
        {
          leftInRoad = true;
        }
    
        if(car.x - car.size + rotate < road.x + road.roadWidth / 2)
        {
          rightInRoad = true;
        }
        if (car.y > road.y - road.roadHeight / 2 + road.barrierWidth)
        {
          topInRoad = true;
        }
    
        if (car.y < road.y + road.roadHeight / 2 - road.barrierWidth)
        {
          bottomInRoad = true;
        }
        
        if(car.y > road.y - road.holeWidth/2 && car.y < road.y + road.holeWidth/2
            && car.x < road.x + road.holeHeight/2 && car.x > road.x - road.holeHeight/2)
        {
          car.alive = false;
        }
      }
      
      if(road.type == RoadType.OBSTACLE_HOLE)
      {
        if(car.x - car.size + rotate > road.x - road.roadWidth / 2)
        {
          leftInRoad = true;
        }
        
        if(car.x - car.size + rotate < road.x + road.roadWidth / 2)
        {
          rightInRoad = true;
        }
        if (car.y > road.y - road.roadHeight / 2)
        {
          topInRoad = true;
        }
  
        if (car.y < road.y + road.roadHeight / 2)
        {
          bottomInRoad = true;
        }
        
        if(car.x > road.x - road.holeWidth/2 && car.x < road.x + road.holeWidth/2
            && car.y < road.y + road.holeHeight/2 && car.y > road.y - road.holeHeight/2)
        {
          car.alive = false;
        }
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
