Car car;
Road road;
Spawner spawner;
boolean[] keysPressed = new boolean[256];
PFont title;
PImage startscreen, selected, menu_control, j4, button1, button2, button3;
int screenSizeX = 1280, screenSizeY = 720, stage;
int buttonXpos = 175;
int buttonYpos = 275;
int buttonHeight = 89;
int buttonWidth = 231;
int buttonSelectedY = 275;
ArrayList<PImage>spawn;

void setup()
{
  size(1280, 720, P2D);
  car = new Car();
  spawner = new Spawner();
  surface.setTitle("OFF-ROAD");

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

void update()
{
  imageMode(CENTER);
  spawner.spawn();
  spawner.Update();
  spawner.Render();
  car.ProcessInput(keysPressed);
  car.Draw();
  if (!car.collidesWithRoad(car)) 
  {
    car.Death();
  }
}

void draw()
{
  if(stage == 1){ //display the menu, control the selectedButton
      image(startscreen, 0,0, screenSizeX, screenSizeY);
      image(button1, buttonXpos, buttonYpos, buttonWidth, buttonHeight);
      image(button2, buttonXpos, buttonYpos + 100, buttonWidth, buttonHeight);
      image(button3, buttonXpos, buttonYpos + 200, buttonWidth, buttonHeight);
      image(selected, buttonXpos, buttonSelectedY, 233, 91);
      fill(0);
      text("Play",290,327);
      text("Controls",290,427);
      text("Exit",290,527);
  }
  if(stage == 2){ //launch the game
  background(160, 200, 230);
  update();
  }
  if(stage == 3){ //display the controls, press 'b' to exit
    image(menu_control, 400, 180, 480, 360); 
    loadImage("menu_controlUI.png");
     if(key == 'b')
       stage = 1;
  }
  if(stage == 4){ //exit application
    exit();
  }
}

void keyPressed()
{
  if(stage == 1);{ //freeze the menu when displaying controls
      if( buttonSelectedY!= 275){
        if( keyCode == UP )  {
            buttonSelectedY = buttonSelectedY - 100;
        }
      }
      if(buttonSelectedY != 475){
        if( keyCode == DOWN )  {
          buttonSelectedY = buttonSelectedY+ 100;
        }
      }
  }
  if(stage != 3){ 
    if(buttonSelectedY == 275 && key == 'a'){ //move the selectedButton to 'play', press 'a' to launch the game
      stage = 2;
      spawner.setTimer(2000);
    }
    if(buttonSelectedY == 375 && key == 'a'){ //move the selectedButton to 'controls', press 'a' to display controls
      stage = 3;
    }
    if(buttonSelectedY == 475 && key == 'a'){ //move the selectedButton to 'exit', press 'a' to exit
      stage = 4;
    }
  }

  if(stage == 2){
  keysPressed[key] = true;
  }
}

void keyReleased()
{
  if(stage == 2){
  keysPressed[key] = false;
  }
}
