class Spawner
{
<<<<<<< HEAD
  int lifeSpanRoad = 600;
  int spawnRoad = 500;
=======
  int lifeSpanRoad = 900;
  int spawnRoad = 400;
>>>>>>> c71cd6807f373f5906043fc3941f32fe75daa588
  
  ArrayList<Road> roads = new ArrayList<Road>();
  Timer spawnTimer;
  Timer deleteRoad;
  int score;
<<<<<<< HEAD
  float huidigeTijd;
=======
  float huidigeTijd; 
  
  boolean tutorial = true;
>>>>>>> c71cd6807f373f5906043fc3941f32fe75daa588
  
  Spawner()
  {
    //Laad de eerste weg.
<<<<<<< HEAD
    roads.add(new Road(car.x, car.y + 500, RoadType.STRAIGHT, RoadDirection.STRAIGHT, millis() + lifeSpanRoad));
    roads.add(new Road(car.x, car.y, RoadType.STRAIGHT, RoadDirection.STRAIGHT, millis() + lifeSpanRoad));
    roads.add(new Road(car.x, car.y - 500, RoadType.STRAIGHT, RoadDirection.STRAIGHT, millis() + lifeSpanRoad));
=======
    roads.add(new Road(car.x, car.y + 500, RoadType.STRAIGHT_TUTORIAL_START, RoadDirection.STRAIGHT, millis() + lifeSpanRoad));
    
>>>>>>> c71cd6807f373f5906043fc3941f32fe75daa588
    huidigeTijd = millis();
  }

  void spawn()
  {  
<<<<<<< HEAD
      //Spawnt een nieuw wegddeel om de 'zoveel' tijd en doet dit alleen wanneer de speler 'alive' is.
      //if(startGame && spawnTimer.checkTime() && roads.size() < 20 && car.alive)
      if(startGame && spawnTimer.checkTime() && car.alive)
      {
          RoadType vorigeRoadType           = roads.get(roads.size()-1).type;
=======
      //spawn elke keer een aantal wegen zodat de speler leert hoe de game werkt.
      if(tutorial)
      {
        roads.add(new Road(car.x, car.y, RoadType.STRAIGHT, RoadDirection.STRAIGHT, millis() + lifeSpanRoad));
        roads.add(new Road(car.x, car.y - 500, RoadType.STRAIGHT_TUTORIAL_ROTATE, RoadDirection.STRAIGHT, millis() + lifeSpanRoad));
        roads.add(new Road(car.x, car.y - 1000, RoadType.LEFT, RoadDirection.STRAIGHT, millis() + lifeSpanRoad));
        roads.add(new Road(car.x, car.y - 1500, RoadType.LEFT_SIDE, RoadDirection.LEFT, millis() + lifeSpanRoad));
        roads.add(new Road(car.x - 490, car.y - 1500, RoadType.STRAIGHT_TUTORIAL_WARNING, RoadDirection.STRAIGHT, millis() + lifeSpanRoad));
        roads.add(new Road(car.x - 490, car.y - 2000, RoadType.OBSTACLE_HOLE, RoadDirection.STRAIGHT, millis() + lifeSpanRoad));
        
        tutorial = false;
      }
      
      //Spawnt een nieuw wegddeel om de 'zoveel' tijd en doet dit alleen wanneer de speler 'alive' is.
      //Er zijn ook altijd maar 5 wegen in de game.
      if(startGame && spawnTimer.checkTime() && roads.size() < 5 && car.alive && !tutorial)
      {
          RoadType vorigeRoadType = roads.get(roads.size()-1).type;
>>>>>>> c71cd6807f373f5906043fc3941f32fe75daa588
          //Hier wordt rekening gehouden met welk wegdeel geladen kan worden.
          ArrayList<RoadType> possibleRoadTypes = new ArrayList<RoadType>();
          //Hier wordt rekening gehouden met welke richting de volgende road geladen moet worden.
          ArrayList<RoadDirection> possibleRoadDirections = new ArrayList<RoadDirection>();
          if (vorigeRoadType == RoadType.STRAIGHT)
<<<<<<< HEAD
          {
              possibleRoadTypes.add(RoadType.STRAIGHT);     possibleRoadDirections.add(RoadDirection.STRAIGHT);    
              possibleRoadTypes.add(RoadType.LEFT);         possibleRoadDirections.add(RoadDirection.STRAIGHT);
              possibleRoadTypes.add(RoadType.RIGHT);        possibleRoadDirections.add(RoadDirection.STRAIGHT);
          }
          if (vorigeRoadType == RoadType.SIDEWAYS)
          {
            RoadDirection vorigeRoadDirection = roads.get(roads.size()-1).direction;
            possibleRoadTypes.add(RoadType.SIDEWAYS);    possibleRoadDirections.add(vorigeRoadDirection);
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
          }
          if (vorigeRoadType == RoadType.RIGHT)
          {
            possibleRoadTypes.add(RoadType.SIDEWAYS);    possibleRoadDirections.add(RoadDirection.RIGHT);
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
          
          //Hier wordt een random getal gemaakt, met dit getal wordt een 'random' weg geladen.
          int randomTypeIndex            = (int)random(possibleRoadTypes.size());
          RoadType newRoadType           = possibleRoadTypes.get(randomTypeIndex);
          RoadDirection newRoadDirection = possibleRoadDirections.get(randomTypeIndex);
          
          roads.add(new Road(roads.get(roads.size()-1).x, roads.get(roads.size()-1).y, newRoadType, newRoadDirection, millis() + lifeSpanRoad));
          
          if(score > 15)
          {
            lifeSpanRoad = 450;
            spawnRoad = 350;
          }
          if(score > 75)
          {
            lifeSpanRoad = 400;
            spawnRoad = 350;
          }
    }
=======
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
          //roads.add(new Road(roads.get(roads.size()-1).x, roads.get(roads.size()-1).y, RoadType.STRAIGHT, newRoadDirection, millis() + lifeSpanRoad));
          
          //We doen bij de eerste 2 wegen een langere lifeSpanRoad zodat de speler nog reserve kan opbouwen
          if(score > 10)
          {
            lifeSpanRoad = 550;
          }
      }
>>>>>>> c71cd6807f373f5906043fc3941f32fe75daa588
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
      road.Update();
    }
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
<<<<<<< HEAD
    if((millis() > nieuweTijd+ lifeSpanRoad) && startGame)
    {   
=======
    if((millis() > nieuweTijd+ lifeSpanRoad) && startGame && collision.tutorialFinished)
    {    
>>>>>>> c71cd6807f373f5906043fc3941f32fe75daa588
      score++;
      nieuweTijd = millis();
      return true; 
     }
    return false;
  }
  
  void restart()
  { 
    roads.clear();
    roads.add(new Road(car.x, car.y + 500, RoadType.STRAIGHT_TUTORIAL_START, RoadDirection.STRAIGHT, millis() + lifeSpanRoad));
    tutorial = true;
  }
  
  void setTimer(int timeInMillis)
  {
    spawnTimer = new Timer(timeInMillis);
  }
}
