class Track
{   
  float x;
  float y;
  ArrayList<PVector> history;
  int colorRect = 50;
  int sizeRect = 15;
  
  Track(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
  
  void update()
  { 
    if(car.alive)
    {
      float xRotate = cos(radians(car.rotate));
      float yRotate = sin(radians(car.rotate));
  
      this.x += xRotate * car.speed;
      this.y += yRotate * car.speed;
      
      for(int i = 0; i < tracks.size(); i++)
      {
        if(car.showGas)
        {
          colorRect = 80;
          sizeRect -= i/5;
          if(sizeRect < 0)
          {
            sizeRect = 0;
          }
        }
        
        if(car.spawnTrack)
        {
          colorRect = 20;
        }
      }
    }
  }
  
  void show()
  {
    float offsetLength = car.size - 18;
    
    float xRotate = cos(radians(car.rotate));  
    float yRotate = sin(radians(car.rotate));
    
    float newX = this.x + xRotate * offsetLength;
    float newY = this.y + yRotate * offsetLength;
    
    float tireOffSet = car.size/3;
    float spawnXoffSet = tireOffSet * cos(radians(car.rotate) - 1.57079632679); //halve pi radian = 90 graden, car begint namelijk op 90 graden
    float spawnYoffSet = tireOffSet * sin(radians(car.rotate) - 1.57079632679);
    
    noStroke();
    fill(colorRect);
    rect(newX + spawnXoffSet, newY + spawnYoffSet, sizeRect, sizeRect);
    rect(newX - spawnXoffSet, newY - spawnYoffSet, sizeRect, sizeRect);
  }
}
