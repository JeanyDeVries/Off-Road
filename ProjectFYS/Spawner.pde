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
    }
  }
  
  void Update()
  {
    for(Road road : roads)
    {
      road.Update();
      println("rotate: " + car.rotate);
      println("speed: " + car.speed);
    }
  }
  
  void setTimer(int timeInMillis)
  {
   spawnTimer = new Timer(timeInMillis);
  }
}
