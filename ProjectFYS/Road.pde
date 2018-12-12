// Een enum is achter de schermen gewoon een int, dus ROAD_STRAIGHT vertaald naar 0, ROAD_SIDEWAYS naar 1, enzovoort (oplopend)
//Enums zorgen voor duidelijkheid.
enum RoadType
{
  STRAIGHT_TUTORIAL_START, 
    STRAIGHT_TUTORIAL_ROTATE, 
    STRAIGHT_TUTORIAL_WARNING, 
    STRAIGHT, 
    STRAIGHT_CRACK, 
    SIDEWAYS, 
    SIDEWAYS_CRACK, 
    LEFT, 
    LEFT_CRACK, 
    LEFT_SIDE, 
    LEFT_SIDE_CRACK, 
    RIGHT,
    RIGHT_CRACK,
    RIGHT_SIDE,
    RIGHT_SIDE_CRACK,
    OBSTACLE_HOLE,
    OBSTACLE_HOLE_CRACK,
    OBSTACLE_HOLE_SIDEWAYS, 
    OBSTACLE_HOLE_SIDEWAYS_CRACK,
    OIL_STRAIGHT1,
    OIL_STRAIGHT1_CRACK,
    OIL_STRAIGHT2,
    OIL_STRAIGHT2_CRACK,
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
PImage imgRoadStraightCrack;
PImage imgRoadSideways;
PImage imgRoadSidewaysCrack;
PImage imgRoadTurnLeft;
PImage imgRoadTurnLeftCrack;
PImage imgRoadLeftSide;
PImage imgRoadLeftSideCrack;
PImage imgRoadRight;
PImage imgRoadRightCrack;
PImage imgRoadRightSide;
PImage imgRoadRightSideCrack;
PImage imgObstacleHole;
PImage imgObstacleHoleCrack;
PImage imgObstacleHoleSideways;
PImage imgObstacleHoleSidewaysCrack;
PImage imgOilStraight1;
PImage imgOilStraight1Crack;
PImage imgOilStraight2;
PImage imgOilStraight2Crack;

// Laad de plaatjes van tevoren meteen in, dan hoeft dit niet tijdens de game te gebeuren; want disk access is super sloom!
void RoadPreloadImages()
{
  imgRoadStraightStart          = loadImage("road_straight.start.png"); 
  imgRoadStraightRotate         = loadImage("road_straight.Rotate.png");
  imgRoadStraightWarning        = loadImage("road_straight.tutorial.warning.png");
  imgRoadStraight               = loadImage("road_straight.png");
  imgRoadStraightCrack          = loadImage("road_straight_crack.png");
  imgRoadSideways               = loadImage("road_straight_sideways.png");
  imgRoadSidewaysCrack          = loadImage("road_straight_sideways_crack.png");
  imgRoadTurnLeft               = loadImage("road_turn_left.png");
  imgRoadTurnLeftCrack          = loadImage("road_turn_left_crack.png");
  imgRoadLeftSide               = loadImage("road_turn_left_side.png");
  imgRoadLeftSideCrack          = loadImage("road_turn_left_side_crack.png");
  imgRoadRight                  = loadImage("road_turn_right.png");
  imgRoadRightCrack             = loadImage("road_turn_right_crack.png");
  imgRoadRightSide              = loadImage("road_turn_right_side.png");
  imgRoadRightSideCrack         = loadImage("road_turn_right_side_crack.png");
  imgObstacleHole               = loadImage("obstacle_hole.png");
  imgObstacleHoleCrack          = loadImage("obstacle_hole_crack.png");
  imgObstacleHoleSideways       = loadImage("obstacle_hole_sideways.png");
  imgObstacleHoleSidewaysCrack  = loadImage("obstacle_hole_sideways_crack.png");
  imgOilStraight1               = loadImage("oil_straight1.png");
  imgOilStraight1Crack          = loadImage("oil_straight1_crack.png");
  imgOilStraight2               = loadImage("oil_straight2.png");
  imgOilStraight2Crack          = loadImage("oil_straight2_crack.png");
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
    if (direction == RoadDirection.STRAIGHT)
    {
      this.x = x;
      // y is boven i.p.v. beneden, dus doe -roadHeight
      this.y = y - roadHeight;
    } else // Sideways
    {
      if (direction == RoadDirection.LEFT)
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
