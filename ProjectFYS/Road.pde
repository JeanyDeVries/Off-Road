// Een enum is achter de schermen gewoon een int, dus ROAD_STRAIGHT vertaald naar 0, ROAD_SIDEWAYS naar 1, enzovoort (oplopend)
//Enums zorgen voor duidelijkheid.
enum RoadType
{
  STRAIGHT_TUTORIAL_START,
  STRAIGHT_TUTORIAL_ROTATE,
  STRAIGHT_TUTORIAL_WARNING,
  STRAIGHT,
  SIDEWAYS,
  LEFT,
  LEFT_SIDE,
  RIGHT,
  RIGHT_SIDE,
  OBSTACLE_HOLE,
  OBSTACLE_HOLE_SIDEWAYS,
  OIL_STRAIGHT1,
  OIL_STRAIGHT2,
}

// Welke richting de nieuwe road moet spawnen. Bv: road left is STRAIGHT want die moet nog boven een straight weg spawnen (ook al gaat de bocht daarna na links).
enum RoadDirection 
{
   STRAIGHT,
   LEFT,
   RIGHT,
}

PImage imgRoadStraightStart;
PImage imgRoadStraightRotate;
PImage imgRoadStraightWarning;
PImage imgRoadStraight;
PImage imgRoadSideways;
PImage imgRoadTurnLeft;
PImage imgRoadLeftSide;
PImage imgRoadRight;
PImage imgRoadRightSide;
PImage imgObstacleHole;
PImage imgObstacleHoleSideways;
PImage imgOilStraight1;
PImage imgOilStraight2;

// Laad de plaatjes van tevoren meteen in, dan hoeft dit niet tijdens de game te gebeuren; want disk access is super sloom!
void RoadPreloadImages()
{
  imgRoadStraightStart    = loadImage("road_straight.start.png"); 
  imgRoadStraightRotate   = loadImage("road_straight.Rotate.png");
  imgRoadStraightWarning  = loadImage("road_straight.tutorial.warning.png");
  imgRoadStraight         = loadImage("road_straight.png"); 
  imgRoadSideways         = loadImage("road_straight_sideways.png"); 
  imgRoadTurnLeft         = loadImage("road_turn_left.png");
  imgRoadLeftSide         = loadImage("road_turn_left_side.png");
  imgRoadRight            = loadImage("road_turn_right.png");
  imgRoadRightSide        = loadImage("road_turn_right_side.png");
  imgObstacleHole         = loadImage("obstacle_hole.png");
  imgObstacleHoleSideways = loadImage("obstacle_hole_sideways.png");
  imgOilStraight1         = loadImage("oil_straight1.png");
  imgOilStraight2         = loadImage("oil_straight2.png");
}

class Road
{
  //variabelen
  RoadType type;
  RoadDirection direction;
  PImage image; 
  int randomNumber = 0;
  float barrierWidth = 20;
  float roadWidth;
  float roadHeight;
  float x;
  float y;
  float rotationSpeed;
  float holeWidth = 150;
  float holeHeight = 374;
  float oilWidth = 211;
  float oilHeight = 218;
  
  int destroyTime;

  float timermilliSec = millis();

  // variabelen road declareren
  Road(float x, float y, RoadType roadType, RoadDirection direction, int destroyTime)
  {
    this.type       = roadType;
    this.direction  = direction;
    this.roadWidth  = 500 - barrierWidth;
    this.roadHeight = 500;
    
    //Voor elke enum waarde word er een image geladen.
    switch(roadType)
    {
      case STRAIGHT_TUTORIAL_START:
        image = imgRoadStraightStart;
        break;
      case STRAIGHT_TUTORIAL_ROTATE:
        image = imgRoadStraightRotate;
        break;
      case STRAIGHT_TUTORIAL_WARNING:
        image = imgRoadStraightWarning;
        break;
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
      case OBSTACLE_HOLE:
        image = imgObstacleHole;
        break;
      case OBSTACLE_HOLE_SIDEWAYS:
        image = imgObstacleHoleSideways;
        break;
      case OIL_STRAIGHT1:
        image = imgOilStraight1;
        break;
      case OIL_STRAIGHT2:
        image = imgOilStraight2;
        break;
    } 
    
    //Hier word rekening gehouden met de richting van de Road en hierbij word dan een nieuwe positie gegeven.
    if(direction == RoadDirection.STRAIGHT)
    {
      this.x = x;
      // y is boven i.p.v. beneden, dus doe -roadHeight
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
    
    this.destroyTime = destroyTime;
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
