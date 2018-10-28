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
    // na 10 wegen zullen er geen nieuwe wegen gespawned worden
    if(spawnTimer.checkTime())
    {
      if(roads.size() < 1000)
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
        
        
        int randomTypeIndex = (int)random(possibleRoadTypes.size());
        RoadType newRoadType           = possibleRoadTypes.get(randomTypeIndex);
        RoadDirection newRoadDirection = possibleRoadDirections.get(randomTypeIndex);
        
        //newRoadType = RoadType.STRAIGHT;
        //newRoadDirection = RoadDirection.STRAIGHT;
        // Zet een random getal om in 1 van de 6 enum values voor RoadType: https://stackoverflow.com/questions/5878952/cast-int-to-enum-in-java
        //RoadType roadType = RoadType.values()[randomNumber];
        
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
  
  void setTimer(int timeInMillis)
  {
   spawnTimer = new Timer(timeInMillis);
  }
}
