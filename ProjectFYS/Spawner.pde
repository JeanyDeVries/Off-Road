class Spawner
{
  ArrayList<Road> roads = new ArrayList<Road>();
  Timer spawnTimer;

  Spawner()
  {
    roads.add(new Road(car.x, car.y));
  }

  void spawn()
  {  
    if(spawnTimer.checkTime())
    {
      print("Time ");
      if(roads.size() < 10)
      {
        roads.add(new Road(roads.get(roads.size()-1).x, roads.get(roads.size()-1).y - roads.get(roads.size()-1).roadHeight/2));
      }
    }
  }

  void Render()
  {
    for(Road road : roads)
    {
      road.Render();
      //println("render");
    }
  }
  void Update()
  {
    for(Road road : roads)
    {
      road.ProcessInput(keysPressed);
    }
  }
  
  void setTimer(int timeInMillis)
  {
   spawnTimer = new Timer(timeInMillis);
  }
}
