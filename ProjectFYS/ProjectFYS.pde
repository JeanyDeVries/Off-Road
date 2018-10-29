Car car;
Highscore highscore;
Spawner spawner;
boolean[] keysPressed = new boolean[256];
PFont title;
PImage startscreen, selected, menu_control, j4, button1, button2, button3;
int screenSizeX = 1280, screenSizeY = 720, stage;
final int BUTTONXPOS = 175;
final int BUTTONYPOS = 275;
final int BUTTONHEIGHT = 89;
final int BUTTONWIDTH = 231;
int buttonSelectedY = 275;
ArrayList<PImage>spawn;

void setup()
{
  size(1280, 720, P2D);
  RoadPreloadImages();
  car = new Car();
  spawner = new Spawner();
  highscore = new Highscore();
  surface.setTitle("OFF-ROAD");
 
  // menu
  spawn = new ArrayList<PImage>();
  stage = 1;
  button1 = loadImage("menu_button.png");
  button2 = loadImage("menu_button.png");
  button3 = loadImage("menu_button.png");
  startscreen = loadImage("menu_main.png");
  menu_control = loadImage("menu_controlUI.png");
  selected = loadImage("menu_buttonSelected.png");
  textAlign(CENTER);
  textSize(20);
} 

float deltaTime;
float lastTime;

void update()
{
  imageMode(CENTER);
  spawner.spawn();
  spawner.Update();
  spawner.Render();
  spawner.Delete();
  car.ProcessInput(keysPressed);
  car.Draw();
  highscore.setup();
  highscore.draw();
  // death trigger
  if (car.alive && !car.collidesWithRoad(spawner)) 
  {
    car.Death();
  }
}

void draw()
{
  
  if(stage == 1){ //laat het menu zien, bestuur de selectedknop
      image(startscreen, 0,0, screenSizeX, screenSizeY);
      image(button1, BUTTONXPOS, BUTTONYPOS, BUTTONWIDTH, BUTTONHEIGHT);
      image(button2, BUTTONXPOS, BUTTONYPOS + 100, BUTTONWIDTH, BUTTONHEIGHT);
      image(button3, BUTTONXPOS, BUTTONYPOS + 200, BUTTONWIDTH, BUTTONHEIGHT);
      image(selected, BUTTONXPOS, buttonSelectedY, 233, 91);
      fill(0);
      text("Play",290,327);
      text("Controls",290,427);
      text("Exit",290,527);
  }
  if(stage == 2){ //start het spel
  background(160, 200, 230);
  update();
  }
  if(stage == 3){ //laat de controls zien, druk 'b' om het spel te verlaten
    image(menu_control, 400, 180, 480, 360); 
    loadImage("menu_controlUI.png");
     if(key == 'b')
       stage = 1;
  }
  if (stage == 4){
    //highscore printen
    textSize(50);
    textAlign(CENTER);
    text("HIGHSCORE", 640, 185);
    textAlign(LEFT);
    text("1....................... " + highscore.finalscore, 440, 300);  
    text("2....................... " , 440, 375);
    text("3....................... " , 440, 450);
    text("4....................... " , 440, 525);
    text("5....................... " , 440, 600);
    
    //box
    stroke(153);
    
    
  }
  
  
  if(stage == 5){ //sluit de applicatie
    exit();
  }
}

void keyPressed()
{
  //knoppen selectie
  if(stage == 1);{ //Bevries het menu wanner de besturing op het scherm staan
      if( buttonSelectedY!= 275){
        if( keyCode == UP )  {
            buttonSelectedY = buttonSelectedY - 100;
        }
      }
      if(buttonSelectedY != 475){
        if( keyCode == DOWN )  {
          buttonSelectedY = buttonSelectedY + 100;
        }
      }
  }
  
  if(stage != 3){ 
    if(buttonSelectedY == 275 && key == 'a'){ //verplaats de selected knop naar 'play', druk op 'a' om het spel te starten
      stage = 2;
      spawner.setTimer(500);
    }
    if(buttonSelectedY == 375 && key == 'a'){ //verplaats de selected knop naar 'controls', druk op 'a' om de controls te laten zien
      stage = 3;
    }
    if(buttonSelectedY == 475 && key == 'a'){ //verplaats de selectedButton naar 'exit', druk op 'a' om het spel af te sluiten
      stage = 4;
    }
  }

  if(stage == 2){
    if(key < keysPressed.length)
      keysPressed[key] = true;
  }
}

void keyReleased()
{
  if(stage == 2){
    if(key < keysPressed.length)
      keysPressed[key] = false;
  }
}
