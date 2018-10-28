// Een enum is achter de schermen gewoon een int, dus ROAD_STRAIGHT vertaald naar 0, ROAD_SIDEWAYS naar 1, enzovoort (oplopend)
enum RoadType {
  STRAIGHT,
  SIDEWAYS,
  LEFT,
  LEFT_SIDE,
  RIGHT,
  RIGHT_SIDE,
}

// Welke richting de nieuwe road moet spawnen. Bv: road left is STRAIGHT want die moet nog boven een straight weg spawnen (ook al gaat de bocht daarna na links).
enum RoadDirection {
   STRAIGHT,
   LEFT,
   RIGHT,
}


PImage imgRoadStraight;
PImage imgRoadSideways;
PImage imgRoadTurnLeft;
PImage imgRoadLeftSide;
PImage imgRoadRight;
PImage imgRoadRightSide;
// (>^^)> Laad de plaatjes van tevoren meteen in, dan hoeft dit niet tijdens de game te gebeuren; want disk access is super sloooom! <(^^<)
void RoadPreloadImages()
{
  imgRoadStraight     = loadImage("road_straight.png"); 
  imgRoadSideways     = loadImage("road_straight_sideways.png"); 
  imgRoadTurnLeft     = loadImage("road_turn_left.png");
  imgRoadLeftSide     = loadImage("road_turn_left_side.png");
  imgRoadRight        = loadImage("road_turn_right.png");
  imgRoadRightSide    = loadImage("road_turn_right_side.png");
}

class Road
{
  //variabelen
  RoadType type;
  RoadDirection direction;
  PImage image; 
  int randomNumber = 0;
  float roadWidth;
  float roadHeight;
  float x;
  float y;
  float rotationSpeed;

  float timermilliSec = millis();

  // variabelen road declareren
  Road(float x, float y, RoadType roadType, RoadDirection direction)
  {
    this.type       = roadType;
    this.direction  = direction;
    this.roadWidth  = 500;
    this.roadHeight = 500;
    
    switch(roadType)
    {
      case STRAIGHT:
        image = imgRoadStraight;
        break;
      case SIDEWAYS:
        image = imgRoadSideways;
        break;
      case LEFT:
        image = imgRoadTurnLeft;
        break;
      case LEFT_SIDE:
        image = imgRoadLeftSide;
        break;
      case RIGHT:
        image = imgRoadRight;
        break;
      case RIGHT_SIDE:
        image = imgRoadRightSide;
        break;
      
    } 
    if(direction == RoadDirection.STRAIGHT)
    {
      this.x = x ;
      // y is boven i.p.v.v beneden, dus doe -roadHeight
      this.y = y - roadHeight;
    }
    else // Sideways
    {
      if(direction == RoadDirection.LEFT)
        this.x = x - roadWidth;
      else if (direction == RoadDirection.RIGHT)
        this.x = x + roadWidth;
      this.y = y; 
    }
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
