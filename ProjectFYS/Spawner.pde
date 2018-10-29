class Spawner
{
  ArrayList<Road> roads = new ArrayList<Road>();
  Timer spawnTimer;
  
  Spawner()
  {
    //spawns first road
    roads.add(new Road(car.x, car.y + 500, RoadType.STRAIGHT, RoadDirection.STRAIGHT));
  }

  void spawn()
  {  
    // na 100 wegen zullen er geen nieuwe wegen gespawned worden
    if(spawnTimer.checkTime())
    {
      if(roads.size() < 100)
      {
        RoadType vorigeRoadType           = roads.get(roads.size()-1).type;
        
        ArrayList<RoadType> possibleRoadTypes = new ArrayList<RoadType>();
        ArrayList<RoadDirection> possibleRoadDirections = new ArrayList<RoadDirection>();
        if (vorigeRoadType == RoadType.STRAIGHT)
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
          possibleRoadTypes.add(RoadType.LEFT_SIDE);   possibleRoadDirections.add(RoadDirection.LEFT);
        }
        if (vorigeRoadType == RoadType.RIGHT)
        {
          possibleRoadTypes.add(RoadType.SIDEWAYS);    possibleRoadDirections.add(RoadDirection.RIGHT);
          possibleRoadTypes.add(RoadType.RIGHT_SIDE);  possibleRoadDirections.add(RoadDirection.RIGHT);
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
        
        
        int randomTypeIndex            = (int)random(possibleRoadTypes.size());
        RoadType newRoadType           = possibleRoadTypes.get(randomTypeIndex);
        RoadDirection newRoadDirection = possibleRoadDirections.get(randomTypeIndex);
        
        //roads.add(new Road(roads.get(roads.size()-1).x, roads.get(roads.size()-1).y, newRoadType, RoadDirection.STRAIGHT));
        roads.add(new Road(roads.get(roads.size()-1).x, roads.get(roads.size()-1).y, newRoadType, newRoadDirection));
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
      road.Update();
    }
  }
  
  void Delete()
  {
    ArrayList<Road> newRoads = new ArrayList<Road>();
    for(int i = 0; i < roads.size(); i++)
    {
      Road road = roads.get(i);
      if(!isOutOfBounds(road))
      {
        newRoads.add(roads.get(i));     
      }
    }
    roads = newRoads;
  }
  
  void setTimer(int timeInMillis)
  {
   spawnTimer = new Timer(timeInMillis);
  }
  
  boolean isOutOfBounds(Road road)
  {
    if(road.y > height + road.roadHeight/2 || road.x < 0 - road.roadWidth/2 || road.x > width + road.roadWidth/2)
    {
      return true;
    }
    return false;
  }
}
