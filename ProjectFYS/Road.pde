class Road
{
  //variabelen
  PImage image; 
  int randomNumber = 0;
  float roadWidth;
  float roadHeight;
  float x;
  float y;
  float rotationSpeed;

  float timermilliSec = millis();

  // variabelen road declareren
  Road(float x, float y)
  {
    roadWidth = 400;
    roadHeight = 600;
    randomNumber = (int)random(0, 5.5);
    switch(randomNumber)
    {
      case 0:
        image = loadImage("road_straight.png"); 
        roadWidth = 400;
        roadHeight = 600;
        break;
      case 1:
        image = loadImage("road_straight _sideways.png"); 
        roadHeight = 400;
        roadWidth = 600;
        y += roadHeight;
        x += roadWidth/5;
        break;
      case 2:
        image = loadImage("road_turn_left.png");
        roadHeight = 500;
        break;
      case 3:
        image = loadImage("road_turn_left_side.png");
        break;
      case 4:
        image = loadImage("road_turn_right.png");
        break;
      case 5:
        image = loadImage("road_turn_right.png");
        break;
      
    } 
    this.x = x;
    this.y = y;
  }

  void Render()
  {
    timermilliSec = 0;
    image(image, this.x, this.y, this.roadWidth, this.roadHeight);
  }


  void Update()
  {   
    float xRotate = cos(radians(car.rotate));
    float yRotate = sin(radians(car.rotate));
  
    this.x += xRotate * car.speed;
    this.y += yRotate * car.speed;
  }
}
