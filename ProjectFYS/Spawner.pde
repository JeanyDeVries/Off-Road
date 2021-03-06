class Spawner
{
  int lifeSpanRoad = 700;
  
  ArrayList<Road> roads = new ArrayList<Road>();
  int score;
  float huidigeTijd; 
  
  boolean tutorial = true;
  boolean spawnRoad = false;
  boolean disabledespawner = true;
  boolean death = false;
  
  float alpha;
  
  Spawner()
  {
    //Laad de eerste weg.
    roads.add(new Road(car.x, car.y + 500, RoadType.STRAIGHT_TUTORIAL_START, RoadDirection.STRAIGHT, millis() + lifeSpanRoad));
    
    huidigeTijd = millis();
  }

  void spawn()
  {  
      //spawn elke keer een aantal wegen zodat de speler leert hoe de game werkt.
      if(tutorial)
      {
        roads.add(new Road(car.x, car.y, RoadType.STRAIGHT, RoadDirection.STRAIGHT, millis() + lifeSpanRoad));
        roads.add(new Road(car.x, car.y - 500, RoadType.STRAIGHT_TUTORIAL_ROTATE, RoadDirection.STRAIGHT, millis() + lifeSpanRoad));
        roads.add(new Road(car.x, car.y - 1000, RoadType.LEFT, RoadDirection.STRAIGHT, millis() + lifeSpanRoad));
        roads.add(new Road(car.x, car.y - 1500, RoadType.LEFT_SIDE, RoadDirection.LEFT, millis() + lifeSpanRoad));
        roads.add(new Road(car.x - 490, car.y - 1500, RoadType.STRAIGHT_TUTORIAL_WARNING, RoadDirection.STRAIGHT, millis() + lifeSpanRoad));
        roads.add(new Road(car.x - 490, car.y - 2000, RoadType.OBSTACLE_HOLE_SIDES, RoadDirection.STRAIGHT, millis() + lifeSpanRoad));
        
        tutorial = false;
      }
          
      //Spawnt een nieuw wegddeel om de 'zoveel' tijd en doet dit alleen wanneer de speler 'alive' is.
      if(startGame && spawnRoad && car.alive)
      {
          //maak het spel moeilijker door de tijd dat de roads worden delete te verhogen.
          if(score < 20)
          {
            lifeSpanRoad = 700;
          }
          if(score >= 20 && score < 50)
          {
            lifeSpanRoad = 650;
          }
          if(score >= 50 && score < 75)
          {
            lifeSpanRoad = 600;
          }
          if(score >= 75 && score < 100)
          {
            lifeSpanRoad = 550;
          }
          
          RoadType vorigeRoadType = roads.get(roads.size()-1).type;
          //Hier wordt rekening gehouden met welk wegdeel geladen kan worden.
          ArrayList<RoadType> possibleRoadTypes = new ArrayList<RoadType>();
          //Hier wordt rekening gehouden met welke richting de volgende road geladen moet worden.
          ArrayList<RoadDirection> possibleRoadDirections = new ArrayList<RoadDirection>();
          if (vorigeRoadType == RoadType.STRAIGHT)
          {
              possibleRoadTypes.add(RoadType.STRAIGHT);              possibleRoadDirections.add(RoadDirection.STRAIGHT);    
              //possibleRoadTypes.add(RoadType.STRAIGHT_CRACK);      possibleRoadDirections.add(RoadDirection.STRAIGHT);
              possibleRoadTypes.add(RoadType.LEFT);                  possibleRoadDirections.add(RoadDirection.STRAIGHT);
              //possibleRoadTypes.add(RoadType.LEFT_CRACK);          possibleRoadDirections.add(RoadDirection.STRAIGHT);
              possibleRoadTypes.add(RoadType.RIGHT);                 possibleRoadDirections.add(RoadDirection.STRAIGHT);
              //possibleRoadTypes.add(RoadType.RIGHT_CRACK);         possibleRoadDirections.add(RoadDirection.STRAIGHT);
              possibleRoadTypes.add(RoadType.OBSTACLE_HOLE);         possibleRoadDirections.add(RoadDirection.STRAIGHT);
              possibleRoadTypes.add(RoadType.OIL_STRAIGHT1);         possibleRoadDirections.add(RoadDirection.STRAIGHT);
              //possibleRoadTypes.add(RoadType.OIL_STRAIGHT1_CRACK); possibleRoadDirections.add(RoadDirection.STRAIGHT);
              possibleRoadTypes.add(RoadType.OIL_STRAIGHT2);         possibleRoadDirections.add(RoadDirection.STRAIGHT);
              //possibleRoadTypes.add(RoadType.OIL_STRAIGHT2_CRACK); possibleRoadDirections.add(RoadDirection.STRAIGHT);
              
          }
          if (vorigeRoadType == RoadType.SIDEWAYS)
          {
            RoadDirection vorigeRoadDirection = roads.get(roads.size()-1).direction;
            possibleRoadTypes.add(RoadType.SIDEWAYS);                possibleRoadDirections.add(vorigeRoadDirection);
            possibleRoadTypes.add(RoadType.OBSTACLE_HOLE_SIDEWAYS);  possibleRoadDirections.add(vorigeRoadDirection);
            possibleRoadTypes.add(RoadType.OBSTACLE_HOLE_SIDES_SIDEWAYS);  possibleRoadDirections.add(vorigeRoadDirection);
            if(vorigeRoadDirection == RoadDirection.LEFT)
            {
              possibleRoadTypes.add(RoadType.LEFT_SIDE);             possibleRoadDirections.add(vorigeRoadDirection);
              possibleRoadTypes.add(RoadType.OIL_LEFT_SIDE);         possibleRoadDirections.add(vorigeRoadDirection);
            }
            else if (vorigeRoadDirection == RoadDirection.RIGHT)
            {
              possibleRoadTypes.add(RoadType.RIGHT_SIDE);            possibleRoadDirections.add(vorigeRoadDirection);
              possibleRoadTypes.add(RoadType.OIL_RIGHT_SIDE);        possibleRoadDirections.add(vorigeRoadDirection);
            }
          }
          if (vorigeRoadType == RoadType.LEFT)
          {
            possibleRoadTypes.add(RoadType.SIDEWAYS);                possibleRoadDirections.add(RoadDirection.LEFT);
            possibleRoadTypes.add(RoadType.OBSTACLE_HOLE_SIDEWAYS);  possibleRoadDirections.add(RoadDirection.LEFT);
            possibleRoadTypes.add(RoadType.OBSTACLE_HOLE_SIDES_SIDEWAYS);  possibleRoadDirections.add(RoadDirection.LEFT);
          }
          if (vorigeRoadType == RoadType.RIGHT)
          {
            possibleRoadTypes.add(RoadType.SIDEWAYS);                possibleRoadDirections.add(RoadDirection.RIGHT);
            possibleRoadTypes.add(RoadType.OBSTACLE_HOLE_SIDEWAYS);  possibleRoadDirections.add(RoadDirection.RIGHT);
            possibleRoadTypes.add(RoadType.OBSTACLE_HOLE_SIDES_SIDEWAYS);  possibleRoadDirections.add(RoadDirection.RIGHT);
          }
          if (vorigeRoadType == RoadType.LEFT_SIDE)
          {
            possibleRoadTypes.add(RoadType.STRAIGHT);                possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.RIGHT);                   possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.OIL_RIGHT);               possibleRoadDirections.add(RoadDirection.STRAIGHT);
          }
          if (vorigeRoadType == RoadType.RIGHT_SIDE)
          {
            possibleRoadTypes.add(RoadType.STRAIGHT);                possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.OIL_STRAIGHT1);           possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.LEFT);                    possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.OIL_LEFT);                possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.OIL_STRAIGHT2);           possibleRoadDirections.add(RoadDirection.STRAIGHT);
          }
          if(vorigeRoadType == RoadType.OBSTACLE_HOLE)
          {
            possibleRoadTypes.add(RoadType.STRAIGHT);                possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.LEFT);                    possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.OIL_LEFT);                possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.RIGHT);                   possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.OIL_RIGHT);               possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.OIL_STRAIGHT1);           possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.OIL_STRAIGHT2);           possibleRoadDirections.add(RoadDirection.STRAIGHT);
          }
          if (vorigeRoadType == RoadType.OBSTACLE_HOLE_SIDEWAYS)
          {
            RoadDirection vorigeRoadDirection = roads.get(roads.size()-1).direction;
            possibleRoadTypes.add(RoadType.SIDEWAYS);                possibleRoadDirections.add(vorigeRoadDirection);
            possibleRoadTypes.add(RoadType.OBSTACLE_HOLE_SIDEWAYS);  possibleRoadDirections.add(vorigeRoadDirection);
            possibleRoadTypes.add(RoadType.OBSTACLE_HOLE_SIDES_SIDEWAYS);  possibleRoadDirections.add(vorigeRoadDirection);
            if(vorigeRoadDirection == RoadDirection.LEFT)
            {
              possibleRoadTypes.add(RoadType.LEFT_SIDE);             possibleRoadDirections.add(vorigeRoadDirection);
              possibleRoadTypes.add(RoadType.OIL_LEFT_SIDE);         possibleRoadDirections.add(vorigeRoadDirection);  
            }
            else if (vorigeRoadDirection == RoadDirection.RIGHT)
            {
              possibleRoadTypes.add(RoadType.RIGHT_SIDE);            possibleRoadDirections.add(vorigeRoadDirection);
              possibleRoadTypes.add(RoadType.OIL_RIGHT_SIDE);        possibleRoadDirections.add(vorigeRoadDirection);
            }
          }
          if (vorigeRoadType == RoadType.OBSTACLE_HOLE_SIDES_SIDEWAYS)
          {
            RoadDirection vorigeRoadDirection = roads.get(roads.size()-1).direction;
            possibleRoadTypes.add(RoadType.SIDEWAYS);                possibleRoadDirections.add(vorigeRoadDirection);
            possibleRoadTypes.add(RoadType.OBSTACLE_HOLE_SIDEWAYS);  possibleRoadDirections.add(vorigeRoadDirection);
            possibleRoadTypes.add(RoadType.OBSTACLE_HOLE_SIDES_SIDEWAYS);  possibleRoadDirections.add(vorigeRoadDirection);
            if(vorigeRoadDirection == RoadDirection.LEFT)
            {
              possibleRoadTypes.add(RoadType.LEFT_SIDE);             possibleRoadDirections.add(vorigeRoadDirection);
              possibleRoadTypes.add(RoadType.OIL_LEFT_SIDE);         possibleRoadDirections.add(vorigeRoadDirection);  
            }
            else if (vorigeRoadDirection == RoadDirection.RIGHT)
            {
              possibleRoadTypes.add(RoadType.RIGHT_SIDE);            possibleRoadDirections.add(vorigeRoadDirection);
              possibleRoadTypes.add(RoadType.OIL_RIGHT_SIDE);        possibleRoadDirections.add(vorigeRoadDirection);
            }
          }
          if (vorigeRoadType == RoadType.OBSTACLE_HOLE_SIDES)
          {
              possibleRoadTypes.add(RoadType.STRAIGHT);              possibleRoadDirections.add(RoadDirection.STRAIGHT);    
              possibleRoadTypes.add(RoadType.LEFT);                  possibleRoadDirections.add(RoadDirection.STRAIGHT);
              possibleRoadTypes.add(RoadType.RIGHT);                 possibleRoadDirections.add(RoadDirection.STRAIGHT);
              possibleRoadTypes.add(RoadType.OBSTACLE_HOLE);         possibleRoadDirections.add(RoadDirection.STRAIGHT);
              possibleRoadTypes.add(RoadType.OIL_STRAIGHT1);         possibleRoadDirections.add(RoadDirection.STRAIGHT);
              possibleRoadTypes.add(RoadType.OIL_STRAIGHT2);         possibleRoadDirections.add(RoadDirection.STRAIGHT);
          }
          if (vorigeRoadType == RoadType.OIL_STRAIGHT1)
          {
            possibleRoadTypes.add(RoadType.STRAIGHT);                possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.LEFT);                    possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.RIGHT);                   possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.OBSTACLE_HOLE);           possibleRoadDirections.add(RoadDirection.STRAIGHT);
            if(!collision.oilRoad)
            {
              possibleRoadTypes.add(RoadType.OIL_RIGHT);             possibleRoadDirections.add(RoadDirection.STRAIGHT);
              possibleRoadTypes.add(RoadType.OIL_LEFT);              possibleRoadDirections.add(RoadDirection.STRAIGHT);
            }
          }
          if (vorigeRoadType == RoadType.OIL_STRAIGHT2)
          {
            possibleRoadTypes.add(RoadType.STRAIGHT);                possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.LEFT);                    possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.RIGHT);                   possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.OBSTACLE_HOLE);           possibleRoadDirections.add(RoadDirection.STRAIGHT);
            if(!collision.oilRoad)
            {
              possibleRoadTypes.add(RoadType.OIL_RIGHT);             possibleRoadDirections.add(RoadDirection.STRAIGHT);
              possibleRoadTypes.add(RoadType.OIL_LEFT);              possibleRoadDirections.add(RoadDirection.STRAIGHT);
            }
          }
          if (vorigeRoadType == RoadType.OIL_LEFT)
          {
            possibleRoadTypes.add(RoadType.SIDEWAYS);                possibleRoadDirections.add(RoadDirection.LEFT);
            possibleRoadTypes.add(RoadType.OBSTACLE_HOLE_SIDEWAYS);  possibleRoadDirections.add(RoadDirection.LEFT);
            possibleRoadTypes.add(RoadType.OBSTACLE_HOLE_SIDES_SIDEWAYS);  possibleRoadDirections.add(RoadDirection.LEFT);
            possibleRoadTypes.add(RoadType.LEFT_SIDE);               possibleRoadDirections.add(RoadDirection.LEFT);
            if(!collision.oilRoad)
            {
              possibleRoadTypes.add(RoadType.OIL_LEFT_SIDE);         possibleRoadDirections.add(RoadDirection.LEFT);
            }
          }
          if (vorigeRoadType == RoadType.OIL_RIGHT)
          {
            possibleRoadTypes.add(RoadType.SIDEWAYS);                possibleRoadDirections.add(RoadDirection.RIGHT);
            possibleRoadTypes.add(RoadType.OBSTACLE_HOLE_SIDEWAYS);  possibleRoadDirections.add(RoadDirection.RIGHT);
            possibleRoadTypes.add(RoadType.OBSTACLE_HOLE_SIDES_SIDEWAYS);  possibleRoadDirections.add(RoadDirection.RIGHT);
            possibleRoadTypes.add(RoadType.RIGHT_SIDE);              possibleRoadDirections.add(RoadDirection.RIGHT);
            if(!collision.oilRoad)
            {
              possibleRoadTypes.add(RoadType.OIL_RIGHT_SIDE);        possibleRoadDirections.add(RoadDirection.RIGHT);
            }
          }
          if(vorigeRoadType == RoadType.OIL_LEFT_SIDE)
          {
            possibleRoadTypes.add(RoadType.STRAIGHT);                possibleRoadDirections.add(RoadDirection.STRAIGHT); 
            possibleRoadTypes.add(RoadType.RIGHT);                   possibleRoadDirections.add(RoadDirection.STRAIGHT);
            if(!collision.oilRoad)
            {
              possibleRoadTypes.add(RoadType.OIL_RIGHT);             possibleRoadDirections.add(RoadDirection.STRAIGHT);
            }
          }
          if(vorigeRoadType == RoadType.OIL_RIGHT_SIDE)
          {
            possibleRoadTypes.add(RoadType.STRAIGHT);                possibleRoadDirections.add(RoadDirection.STRAIGHT);
            possibleRoadTypes.add(RoadType.LEFT);                    possibleRoadDirections.add(RoadDirection.STRAIGHT);
            if(!collision.oilRoad)
            {
              possibleRoadTypes.add(RoadType.OIL_LEFT);              possibleRoadDirections.add(RoadDirection.STRAIGHT);
            }
          }
          
          //Hier wordt een random getal gemaakt, met dit getal wordt een 'random' weg geladen.
          int randomTypeIndex            = (int)random(possibleRoadTypes.size());
          RoadType newRoadType           = possibleRoadTypes.get(randomTypeIndex);
          RoadDirection newRoadDirection = possibleRoadDirections.get(randomTypeIndex);
          
          roads.add(new Road(roads.get(roads.size()-1).x, roads.get(roads.size()-1).y, newRoadType, newRoadDirection, millis() + lifeSpanRoad));
    }
  }
  
  
  void Render()
  {
    boolean first = true;
    for (Road road : roads)
    {
      noTint();
      if (first && startGame && collision.tutorialFinished && !death)
      { 
        alpha = map(lifeSpanRoad/2, 0, 700, 0, 255);
        tint(255, alpha);
        first = false;
      }
      road.Render();
    }
  }
  
  void Update()
  {
    for(Road road : roads)
    {
      road.Update();
      //check of de car collision heeft met de road, zo ja spawn dan de road erna.
      spawnRoad = collision.spawnRoad(road); 
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
    if((millis() > nieuweTijd + lifeSpanRoad) && startGame && collision.tutorialFinished && !death)
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
    roads.add(new Road(car.x, car.y + 500, RoadType.STRAIGHT_TUTORIAL_START, RoadDirection.STRAIGHT, millis() + lifeSpanRoad));
    lifeSpanRoad = 700;
    tutorial = true;
    death = false;
  }
}
