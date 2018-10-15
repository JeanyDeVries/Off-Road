class Spawner
{
  PImage[] roadImages; 
  
  Spawner()
  {
    PImage[] roadImages = new PImage[2];
    roadImages[0] = loadImage("LangeBochtRechts.png");
    roadImages[1] = loadImage("LangeRechteWeg.png");
  }
  
  void Render()
  {
    image(roadImages[1], height/2, width/2, 200, 200);
  }
}
