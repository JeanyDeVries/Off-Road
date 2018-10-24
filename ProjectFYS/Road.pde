class Road
{
  //variabelen
  PImage image; 
  int randomNumber;
  final float ROADWIDTH;
  final float ROADHEIGHT;
  float x;
  float y;
  float rotationSpeed;

  float timermilliSec = millis();

  // variabelen road declareren
  Road(float x, float y)
  {
    ROADWIDTH = 1000;
    ROADHEIGHT = 500;
    /*randomNumber = (int)random(0, 1.5);
    switch(randomNumber)
    {
      case 0:
        image = loadImage("weg0.png");        
        break;
      case 1:
        image = loadImage("weg1.png");
        break;
    }*/
    image = loadImage("weg0.png");   
    this.x = x;
    this.y = y;
  }

  void Render()
  {
    timermilliSec = 0;
    image(image, this.x, this.y, this.ROADWIDTH, this.ROADHEIGHT);
  }


  void Update()
  {   
    float xRotate = cos(radians(car.rotate));
    float yRotate = sin(radians(car.rotate));
  
    this.x += xRotate * car.speed;
    this.y += yRotate * car.speed;
  }
}
