/* Gemaakt door: Jeany de Vries, Kees van Heuven, Miquel Martherus, Casper Arends en Sam van Duin
 Team: Tucan
 Game: Off Road
 Klas: iG103
 */


//initialiseer Classes, Arrays, Finals en Globale Variabelen.
import processing.sound.*;
SoundFile buttonPress;
SoundFile file1;
SoundFile menuTheme;
SoundFile gameTheme;
SoundFile youLose;
Car car;
Highscore highscore;
Spawner spawner;
Menu menu;
boolean[] keysPressed = new boolean[256];

ArrayList<PImage>spawn;
int nieuweTijd;

boolean startGame = false;

int i = 0;

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
  
  //Audio bestanden initialiseren
  buttonPress = new SoundFile(this, "menu_button.wav");
  file1 = new SoundFile(this, "sound_start.wav");
  menuTheme = new SoundFile(this, "Come and Find Me - B mix.mp3");
  gameTheme = new SoundFile(this, "koopabeach.mp3");
  youLose = new SoundFile(this, "youLose2.mp3");
  
  menuTheme.play();
  menuTheme.amp(0.1);
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
    car.speed *= -0.8;
    car.Death();
    youLose.play();
    youLose.amp(0.1);
  }

  //Begin pas de game als de speler naar voren of achteruit heeft gereden.
  if (key == 'w' || key == 's' && i == 0)
  {
    i++;
    startGame = true;
    nieuweTijd = millis();
  }
}

void draw()
{
  menu.draw();
}

void Restart()
{
  //Restart alles opnieuw door waardes uit de setup te resetten en de array met roads te legen.
  spawner.restart();
  spawner.lifeSpanRoad = 600;

  //w
  keysPressed[119] = false;
  //s
  keysPressed[115] = false;
  //a
  keysPressed[97] = false;
  //d
  keysPressed[100] = false;

  spawner.score = 0;
  car.x = width/2;
  car.y = 360;
  car.size = 75;
  car.rotate = 90;
  car.speed = 0;
  car.alive = true;

  startGame = false;
  i = 0;
}

void keyPressed()
{  

  if (menu.stage == 0) { //Bevries het menu wanneer de besturing op het scherm staat.
    //Deze if-statements zorgen ervoor dat de image van button-selected in de grenzen blijft
    if (menu.buttonSelectedY!= 275)
    {
      if ( keyCode == UP )
      {
        menu.buttonSelectedY = menu.buttonSelectedY - 100;
        buttonPress.play();
      }
    }
    if (menu.buttonSelectedY != 475)
    {
      if ( keyCode == DOWN )
      {
        menu.buttonSelectedY = menu.buttonSelectedY + 100;
        buttonPress.play();
      }
    }
  }

  if (menu.stage == 3)
  {
    if ( menu.buttonSelectedYRestart!= menu.BUTTONYRESTART)
    {
      if ( keyCode == UP )  
      {
        menu.buttonSelectedYRestart = menu.buttonSelectedYRestart - 100;
        buttonPress.play();
      }
    }
    if (menu.buttonSelectedYRestart != menu.BUTTONYRESTART + 100)
    {
      if ( keyCode == DOWN )  
      {
        menu.buttonSelectedYRestart = menu.buttonSelectedYRestart + 100;
        buttonPress.play();
      }
    }
  }

  if (menu.stage == 0) { 
    if (menu.buttonSelectedY == 275 && key == 'a') { //verplaats de selected knop naar 'play', druk op 'a' om het spel te starten
      menu.stage = 2;
      //Geeft aan op welke tijd de nieuwe Roads moeten spawnen.
      spawner.setTimer(spawner.spawnRoad);
      nieuweTijd = millis();
      
      //Overgang van menu audio naar ingame audio
      menuTheme.stop();
      gameTheme.play();
      gameTheme.amp(0.1);
    }
    if (menu.buttonSelectedY == 375 && key == 'a') { //verplaats de selected knop naar 'controls', druk op 'a' om de controls te laten zien
      menu.stage = 1;
    }
    if (menu.buttonSelectedY == 475 && key == 'a') { //verplaats de selectedButton naar 'exit', druk op 'a' om het spel af te sluiten
      menu.stage = 4;
    }
  }

  if (menu.stage == 3) { 
    if (menu.buttonSelectedYRestart == menu.BUTTONYRESTART && key == 'a') { 
      menu.stage = 0;
      imageMode(CORNER);
      textAlign(CENTER);
      textSize(20);
      Restart();
      menuTheme.play();
      menuTheme.amp(0.1);
    }
    if (menu.buttonSelectedYRestart == menu.BUTTONYRESTART + 100 && key == 'a') {
      menu.stage = 2;
      Restart();
      gameTheme.play();
      gameTheme.amp(0.1);
    }
  }

  if (menu.stage == 2) {
    if (key < keysPressed.length)//Dit doen we zodat als je bijvoorbeeld alt F4 drukt het spel niet afsluit.
      keysPressed[key] = true;
  }
}

void keyReleased()
{ 
  //Zorgt ervoor dat ook wordt gelezen wanneer een toets wordt losgelaten.
  if (menu.stage == 2) {
    if (key < keysPressed.length)
      keysPressed[key] = false;
  }
}
