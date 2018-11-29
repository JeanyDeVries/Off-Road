class Spawner
{
  int lifeSpanRoad = 8000;
  int spawnRoad = 500;
  
  ArrayList<Road> roads = new ArrayList<Road>();
  Timer spawnTimer;
  Timer deleteRoad;
  int score;
  float huidigeTijd;
  boolean moveRoadsLeft = false;
  boolean moveRoadsRight = false;
  boolean moveRoadsTop = false;
  boolean moveRoadsDown = false;      
  
  Spawner()
  {
    //Laad de eerste weg.
    roads.add(new Road(car.x, car.y + 500, RoadType.STRAIGHT, RoadDirection.STRAIGHT, millis() + lifeSpanRoad));
    roads.add(new Road(car.x, car.y, RoadType.STRAIGHT, RoadDirection.STRAIGHT, millis() + lifeSpanRoad));
    roads.add(new Road(car.x, car.y - 500, RoadType.STRAIGHT, RoadDirection.STRAIGHT, millis() + lifeSpanRoad));
    huidigeTijd = millis();
  }

  void spawn()
  {  
      //Spawnt een nieuw wegddeel om de 'zoveel' tijd en doet dit alleen wanneer de speler 'alive' is.
      //if(startGame && spawnTimer.checkTime() && roads.size() < 20 && car.alive)
      if(startGame && spawnTimer.checkTime() && car.alive)
      {
          RoadType vorigeRoadType = roads.get(roads.size()-1).type;
          //Hier wordt rekening gehouden met welk wegdeel geladen kan worden.
          ArrayList<RoadType> possibleRoadTypes = new ArrayList<RoadType>();
          //Hier wordt rekening gehouden met welke richting de volgende road geladen moet worden.
          ArrayList<RoadDirection> possibleRoadDirections = new ArrayList<RoadDirection>();
          if (vorigeRoadType == RoadType.STRAIGHT)
          {
              possibleRoadTypes.add(RoadType.STRAIGHT);     possibleRoadDirections.add(RoadDirection.STRAIGHT);
              possibleRoadTypes.add(RoadType.LEFT);         possibleRoadDirections.add(RoadDirection.STRAIGHT);
              possibleRoadTypes.add(RoadType.RIGHT);        possibleRoadDirections.add(RoadDirection.STRAIGHT);
              possibleRoadTypes.add(RoadType.OBSTACLE_HOLE); possibleRoadDirections.add(RoadDirection.STRAIGHT);
          }
          if (vorigeRoadType == RoadType.SIDEWAYS)
          {
            RoadDirection vorigeRoadDirection = roads.get(roads.size()-1).direction;
            possibleRoadTypes.add(RoadType.SIDEWAYS);    possibleRoadDirections.add(vorigeRoadDirection);
            possibleRoadTypes.add(RoadType.OBSTACLE_HOLE_SIDEWAYS); possibleRoadDirections.add(vorigeRoadDirection);
            if(vorigeRoadDirection == RoadDirection.LEFT)
            {
              possibleRoadTypes.add(RoadType.LEFT_SIDE);   possibleRoadDirections.add(vorigeRoadDirection);
            }
            else if (vorigeRoadDirection == RoadDirection.RIGHT)
            {
              possibleRoadTypes.add(RoadType.RIGHT_SIDE);  possibleRoadDirections.add(vorigeRoadDirection);
            }
          }
          if (vorigeRoadType == RoadType.LEFT)
          {
            possibleRoadTypes.add(RoadType.SIDEWAYS);    possibleRoadDirections.add(RoadDirection.LEFT);
            possibleRoadTypes.add(RoadType.OBSTACLE_HOLE_SIDEWAYS);    possibleRoadDirections.add(RoadDirection.LEFT);
          }
          if (vorigeRoadType == RoadType.RIGHT)
          {
            possibleRoadTypes.add(RoadType.SIDEWAYS);    possibleRoadDirections.add(RoadDirection.RIGHT);
            possibleRoadTypes.add(RoadType.OBSTACLE_HOLE_SIDEWAYS);    possibleRoadDirections.add(RoadDirection.RIGHT);
          }
          if (vorigeRoadType == RoadType.LEFT_SIDE)
          {
            possibleRoadTypes.add(RoadType.STRAIGHT);    possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.RIGHT);       possibleRoadDirections.add(RoadDirection.STRAIGHT);
          }
          if (vorigeRoadType == RoadType.RIGHT_SIDE)
          {
            possibleRoadTypes.add(RoadType.STRAIGHT);    possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.LEFT);        possibleRoadDirections.add(RoadDirection.STRAIGHT);
          }
          if(vorigeRoadType == RoadType.OBSTACLE_HOLE)
          {
            possibleRoadTypes.add(RoadType.STRAIGHT);    possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.LEFT);         possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.RIGHT);        possibleRoadDirections.add(RoadDirection.STRAIGHT);
          }
          if (vorigeRoadType == RoadType.OBSTACLE_HOLE_SIDEWAYS)
          {
            RoadDirection vorigeRoadDirection = roads.get(roads.size()-1).direction;
            possibleRoadTypes.add(RoadType.SIDEWAYS);    possibleRoadDirections.add(vorigeRoadDirection);
            possibleRoadTypes.add(RoadType.OBSTACLE_HOLE_SIDEWAYS);   possibleRoadDirections.add(vorigeRoadDirection);
            if(vorigeRoadDirection == RoadDirection.LEFT)
            {
              possibleRoadTypes.add(RoadType.LEFT_SIDE);   possibleRoadDirections.add(vorigeRoadDirection);
            }
            else if (vorigeRoadDirection == RoadDirection.RIGHT)
            {
              possibleRoadTypes.add(RoadType.RIGHT_SIDE);  possibleRoadDirections.add(vorigeRoadDirection);
            }
          }
          
          //Hier wordt een random getal gemaakt, met dit getal wordt een 'random' weg geladen.
          int randomTypeIndex            = (int)random(possibleRoadTypes.size());
          RoadType newRoadType           = possibleRoadTypes.get(randomTypeIndex);
          RoadDirection newRoadDirection = possibleRoadDirections.get(randomTypeIndex);
          
          roads.add(new Road(roads.get(roads.size()-1).x, roads.get(roads.size()-1).y, newRoadType, newRoadDirection, millis() + lifeSpanRoad));
          
          if(score > 15)
          {
            lifeSpanRoad = 400;
            spawnRoad = 350;
          }
          if(score > 75)
          {
            lifeSpanRoad = 375;
            spawnRoad = 350;
          }
          if(score > 100)
          {
            lifeSpanRoad = 350;
            spawnRoad = 350;
          }
      }
  }

  void Render()
  {
    for(Road road : roads)
    {
      road.Render();
    }
  }
  
  void Update()
  {
    for(Road road : roads)
    {
      if(road.touchLeftBarrier)
      {
        moveRoadsLeft = true;
      }
      if(road.touchRightBarrier)
      {
        moveRoadsRight = true;
      }
      if(road.touchTopBarrier)
      {
        moveRoadsTop = true;
      }
      if(road.touchDownBarrier)
      {
        moveRoadsDown = true;
      }                  
      road.Update();
      //if(collision.touchLeftBarrier)
      //{
      //  road.x -= 20;
      //}
      //if(collision.touchRightBarrier)
      //{
      //  road.x += 20;
      //}
      //if(collision.touchTopBarrier)
      //{
      //  road.y += 20;
      //}
      //if(collision.touchDownBarrier)
      //{
      //  road.y -= 20;
      //}
      

    }
    for(Road road : roads)
    {  
      if(moveRoadsLeft)
      {
        road.x -= 20;
      }   
      if(moveRoadsRight)
      {
        road.x += 20;
      }   
      if(moveRoadsTop)
      {
        road.y -= 20;
      }   
      if(moveRoadsDown)
      {
        road.y += 20;
      }                     
    } 
    moveRoadsLeft = false;
    moveRoadsRight = false;
    moveRoadsTop = false;
    moveRoadsDown = false;
  }
  
  void Delete()
  {
    //Hier wordt een kopie van de arraylist gemaakt, met alleen de wegen die niet 'outofbounds' zijn.
    ArrayList<Road> newRoads = new ArrayList<Road>();
    for(int i = 0; i < roads.size(); i++)
    {
      if(!timerDelete())
      {
        newRoads.add(roads.get(i));     
      }
    }
    roads = newRoads;
  }
  
  boolean timerDelete()
  {
    //Na verloop van tijd delete je de roads.
    if((millis() > nieuweTijd+ lifeSpanRoad) && startGame)
    {    
      score++;
      nieuweTijd = millis();
      return true;
      
    }
    return false;
  }
  
  void restart()
  { 
    roads.clear();
    roads.add(new Road(car.x, car.y + 500, RoadType.STRAIGHT, RoadDirection.STRAIGHT, millis() + lifeSpanRoad));
  }
  
  void setTimer(int timeInMillis)
  {
    spawnTimer = new Timer(timeInMillis);
  }
}
