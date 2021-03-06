/* 
 Gemaakt door: Jeany de Vries, Miquel Martherus, Casper Arends en Sam van Duin
 Team: Tucan
 Game: Off Road
 Klas: iG103
 */


//initialiseer Classes, Arrays, Finals en Globale Variabelen.
import ddf.minim.*;
Minim minim;
AudioSnippet buttonPress;
AudioSnippet file1;
AudioSnippet menuTheme;
AudioSnippet gameTheme;
AudioSnippet youLose;
Car car;
Highscore highscore;
Spawner spawner;
Menu menu;
Collision collision;
boolean [] keys = new boolean[1024];

ArrayList<PImage>spawn;
int nieuweTijd;
int tijd;

PImage loadingScreen;

boolean startGame = false;

int i = 0;
int p = 0;
int frames = 0;

int loadingTime = 0;

ArrayList<Track> tracks = new ArrayList<Track>();


void setup()
{  
  //Geeft Classes een waarde.
  size(1280, 720, P2D);
  loadingScreen = loadImage("loadScreen.png");
  background(loadingScreen);
} 

void draw()
{
  //load de afbeeldingen etc maar 1 keer wanneer de loadingScreen aanstaat.
  if (loadingTime == 0) {

    RoadPreloadImages();
    menu = new Menu();
    car = new Car();  
    collision = new Collision();
    spawner = new Spawner();
    highscore = new Highscore();
    minim = new Minim(this); 
    surface.setTitle("OFF-ROAD");
    spawn = new ArrayList<PImage>();


    //Audio bestanden initialiseren
    menuTheme = minim.loadSnippet("Come and Find Me - B mix.mp3");  
    file1 = minim.loadSnippet("sound_start.wav");
    buttonPress = minim.loadSnippet("menu_button.wav"); 
    youLose = minim.loadSnippet("youLose2.mp3");  
    gameTheme = minim.loadSnippet("koopabeach.mp3");  
    car.carNoise = minim.loadSnippet("carNoise.mp3");  
    menuTheme.play();
    menuTheme.loop();

    loadingTime = 1;
  }

  menu.draw();
}


void update()
{ 
  //Zorgt ervoor dat alle plaatjes vanuit het midden worden geladen.
  imageMode(CENTER);

  frames++;
  
  //Roept de verschilende de methodes aan.
  spawner.spawn();
  spawner.Update();
  spawner.Render();
  spawner.Delete();
  car.ProcessInput(keys);
  car.drawTrack();
  highscore.setup();
  highscore.draw();

  //de auto gaat dood wanneer die niet levend is of NIET collision heeft met de weg.
  if (!car.alive || !collision.collidesWithRoad())
  {
    car.Death();
  }

  //Begin pas de game als de speler naar voren of achteruit heeft gereden.
  if ((key == 'w' || key == 's' || key == 'W' || key == 'S' ||keys[UP] || keys[DOWN]) && i == 0)
  {
    i++;
    startGame = true;
    nieuweTijd = millis();
  }

  if (collision.collisionOil)
  {
    //zet het hier op false zodat als je W indrukt je alsnog de track ziet.
    car.showGas = false;
    car.spawnTrack = true;
    
    if (p ==0)
    {
      tijd = millis();
      p++;
    }

    car.speed *= 1.1;
    if (millis() - tijd > 300)
    {
      collision.collisionOil = false;
      p = 0;
    }
  }
  else
  {
    //een else statement, zodat de boolean niet true blijft en constant een track nog laat zien.
    car.spawnTrack = false;
  }
  
  for (Track t : tracks) 
  {
    t.update();
    t.show();
  }
  
  //doe car,draw als laatste zodat je de tracks die net boven de car zit niet ziet
  car.Draw();
}


void Restart()
{
  //Restart alles opnieuw door waardes uit de setup te resetten en de array met roads te legen.
  youLose.rewind();
  spawner.restart();
  
  int lifeSpanRoad = 700;
  
  //dit verwijderd alle roads die in de array zitten. Hierdoor zie je niet meer de roads van de vorige game.
  tracks.clear();

  car.carImage = car.forwardCar;

  car.huidigeFrames = frames;

  //zet de keys op false zodat de auto niet blijft rijden na het restarten.
  //Up
  keys[119] = false;
  keys[87] = false;
  keys[UP] = false;
  //Down
  keys[115] = false;
  keys[83] = false;
  keys[DOWN] = false;
  //Left
  keys[97] = false;
  keys[65] = false;
  keys[LEFT] = false;
  //Right
  keys[100] = false;
  keys[68] = false;
  keys[RIGHT] = false;

  spawner.score = 0;
  car.x = width/2;
  car.y = 450;
  car.size = 75;
  car.rotate = 90;
  car.speed = 0;
  car.alive = true;

  startGame = false;
  i = 0;

  car.j = 1;

  collision.tutorialFinished = false;
  collision.collisionOil = false;
}

void keyPressed()
{  
  keys[keyCode] = true;
  
  //schakel escape uit, zodat je niet de game kan afsluiten
  if(menu.stage != 2)
  {
    if(key == ESC)
      key=0;
  }
  //Als de speler escape klikt wanneer de game runt gaat die naar de inGameMenu.
  else
  {
    if(key == ESC)
    {
      key=0;
      menu.stage = 5;
    }
  }

  if (menu.stage == 0) { //Bevries het menu wanneer de besturing op het scherm staat.
    //Deze if-statements zorgen ervoor dat de image van button-selected in de grenzen blijft
    if (menu.buttonSelectedY!= 275)
    {
      if (key == 'w'|| key ==  'W' || keys[UP])
      {
        menu.buttonSelectedY = menu.buttonSelectedY - 100;
        buttonPress.rewind();
        buttonPress.play();
      }
    }
    if (menu.buttonSelectedY != 475)
    {
      if (key == 's'|| key ==  'S' || keys[DOWN])
      {
        menu.buttonSelectedY = menu.buttonSelectedY + 100;
        buttonPress.rewind();
        buttonPress.play();
      }
    }
  }
  
  if(menu.stage == 3)
  {
    //als een (kan alle keys zijn) key wordt ingevoerd restart de game.
    if(keyPressed)
    {
      Restart();
      gameTheme.play();
      gameTheme.loop();
      gameTheme.rewind();
      menu.stage = 2;
    }
  }

  if (menu.stage == 5)
  {
    if ( menu.buttonSelectedYRestart != menu.BUTTONYRESTART)
    {
      if (key == 'w'|| key ==  'W' || keys[UP])  
      {
        menu.buttonSelectedYRestart = menu.buttonSelectedYRestart - 100;
        buttonPress.rewind();
        buttonPress.play();
      }
    }
    
    if (menu.buttonSelectedYRestart != menu.BUTTONYRESTART + 200)
    {
      if (key == 's'|| key ==  'S' || keys[DOWN])  
      {
        menu.buttonSelectedYRestart = menu.buttonSelectedYRestart + 100;
        buttonPress.rewind();
        buttonPress.play();
      }
    }
  }

  if (menu.stage == 0) { 
    if (menu.buttonSelectedY == 275 && (key == 'z' || key == 'Z')) { //verplaats de selected knop naar 'play', druk op 'a' om het spel te starten
      menu.stage = 2;
      //Geeft aan op welke tijd de nieuwe Roads moeten spawnen.
      nieuweTijd = millis();

      //Overgang van menu audio naar ingame audio
      gameTheme.play();
      gameTheme.loop();
      menuTheme.pause();
      menuTheme.rewind();
    }

    if (menu.buttonSelectedY == 375 && (key == 'z' || key == 'Z')) { //verplaats de selected knop naar 'controls', druk op 'a' om de controls te laten zien
      menu.stage = 1;
    }
    if (menu.buttonSelectedY == 475 && (key == 'z' || key == 'Z')) { //verplaats de selectedButton naar 'exit', druk op 'a' om het spel af te sluiten
      menu.stage = 4;
    }
  }

  if (menu.stage == 5) 
  {
    //checkt of de speler de continue knop drukt
    if (menu.buttonSelectedYRestart == menu.BUTTONYRESTART && (key == 'z' || key == 'Z')) 
    { 
      menu.stage = 2;
    }

    //check of de speler de menu button klikt.
    if (menu.buttonSelectedYRestart == menu.BUTTONYRESTART + 100 && (key == 'z' || key == 'Z')) 
    {
      menu.stage = 0;
      imageMode(CORNER);
      textAlign(CENTER);
      Restart();
      gameTheme.pause();
      gameTheme.rewind();
      menuTheme.play();
      menuTheme.loop();
      menuTheme.rewind();
    }
    
    //check of de speler de quit button klikt.
    if (menu.buttonSelectedYRestart == menu.BUTTONYRESTART + 200 && (key == 'z' || key == 'Z'))
    { 
      menu.stage = 4;
    }
  }

  if (menu.stage == 2) 
  {
    if (key < keys.length)//Dit doen we zodat als je bijvoorbeeld alt F4 drukt het spel niet afsluit.
      keys[key] = true;
  }
}

void keyReleased()
{   
  keys[keyCode] = false;
  car.showGas = false;

  //Zorgt ervoor dat ook wordt gelezen wanneer een toets wordt losgelaten.
  if (menu.stage == 2 || menu.stage == 4) {
    if (key < keys.length)
      keys[key] = false;
  }
}
