/* Gemaakt door: Jeany de Vries, Kees van Heuven, Miquel Martherus, Casper Arends en Sam van Duin
   Team: Tucan
   Game: Off Road
   Klas: iG103
*/


//initialiseer Classes, Arrays, Finals en Globale Variabelen.
Car car;
Highscore highscore;
Spawner spawner;
Menu menu;
boolean[] keysPressed = new boolean[256];
  
ArrayList<PImage>spawn;

void setup()
{
  //Geeft Classes een waarde.
  size(1280, 720, P2D);
  RoadPreloadImages();
  car = new Car();
  spawner = new Spawner();
  highscore = new Highscore();
  menu = new Menu();
  surface.setTitle("OFF-ROAD");
  spawn = new ArrayList<PImage>();
} 

void update()
{
  //Zorgt ervoor dat alle plaatjes vanuit het midden worden geladen.
  imageMode(CENTER);
  //Roept de verschilende de methodes aan.
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
  menu.draw();
}

void keyPressed()
{ 
  if(menu.stage == 0){ //Bevries het menu wanneer de besturing op het scherm staat.
  //Deze if-statements zorgen ervoor dat de image van button-selected in de grenzen blijft
      if(menu.buttonSelectedY!= 275)
      {
        if( keyCode == UP )
        {
            menu.buttonSelectedY = menu.buttonSelectedY - 100;
        }
      }
      if(menu.buttonSelectedY != 475)
      {
        if( keyCode == DOWN )
        {
          menu.buttonSelectedY = menu.buttonSelectedY + 100;
        }
      }
  }
  
  if(menu.stage == 3)
  {
    if( menu.buttonSelectedYRestart!= menu.BUTTONYRESTART)
    {
        if( keyCode == UP )  
        {
            menu.buttonSelectedYRestart = menu.buttonSelectedYRestart - 100;
        }
      }
      if(menu.buttonSelectedYRestart != menu.BUTTONYRESTART + 100)
      {
        if( keyCode == DOWN )  
        {
          menu.buttonSelectedYRestart = menu.buttonSelectedYRestart + 100;
        }
      }
  }
  
  if(menu.stage == 0){ 
    if(menu.buttonSelectedY == 275 && key == 'a'){ //verplaats de selected knop naar 'play', druk op 'a' om het spel te starten
      menu.stage = 2;
      //Geeft aan op welke tijd de nieuwe Roads moeten spawnen.
      spawner.setTimer(500);
    }
    if(menu.buttonSelectedY == 375 && key == 'a'){ //verplaats de selected knop naar 'controls', druk op 'a' om de controls te laten zien
      menu.stage = 1;
    }
    if(menu.buttonSelectedY == 475 && key == 'a'){ //verplaats de selectedButton naar 'exit', druk op 'a' om het spel af te sluiten
      menu.stage = 4;
    }
  }
  
  if(menu.stage == 3){ 
    if(menu.buttonSelectedYRestart == menu.BUTTONYRESTART && key == 'a'){ 
      menu.stage = 0;
      imageMode(CORNER);
      textAlign(CENTER);
      textSize(20);
    }
    if(menu.buttonSelectedYRestart == menu.BUTTONYRESTART + 100 && key == 'a'){
      menu.stage = 2;
    }
  }

  if(menu.stage == 2){
    if(key < keysPressed.length)//Dit doen we zodat als je bijvoorbeeld alt F4 drukt het spel niet afsluit.
      keysPressed[key] = true;
  }
}

void keyReleased()
{
  //Zorgt ervoor dat ook wordt gelezen wanneer een toets wordt losgelaten.
  if(menu.stage == 2){
    if(key < keysPressed.length)
      keysPressed[key] = false;
  }
}
