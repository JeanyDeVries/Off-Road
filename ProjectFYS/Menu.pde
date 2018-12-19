class Menu
{
  int timer;
  int frame = 0;
  int frameInGame = 0;
  int i = 0;
  
  final int MENU = 0;
  final int CONTROLS = 1;
  final int GAME = 2;
  final int HIGH_SCORE = 3;
  final int QUIT = 4;
  int stage = MENU;
  
  PFont title, fontMenu;
  PImage screen, selected, menu_control, j4, button1, button2, button3, button4, button5, imageBackground;
  PImage [] menuSprites;
  PImage [] backgroundSprites;
  int screenSizeX = 1280, screenSizeY = 720;
  final int BUTTONXPOS = 175;
  final int BUTTONYPOS = 275;
  final int BUTTONHEIGHT = 89;
  final int BUTTONWIDTH = 231;
  
  final int BUTTONXRESTART = width/5;
  final int BUTTONYRESTART = height/2;
  int buttonSelectedY = 275;
  int buttonSelectedYRestart = BUTTONYRESTART;
  
  Menu()
  {
    //Afbeeldingen worden geladen op een variabel.
    button1 = loadImage("menu_button.png");
    button2 = loadImage("menu_button.png");
    button3 = loadImage("menu_button.png");
    button4 = loadImage("menu_button.png");
    button5 = loadImage("menu_button.png");
  
    //Afbeelding laden voor de animatie bij het menu
    menuSprites = new PImage[20];
    for(int i = 0; i < menuSprites.length; i++)
    {
      menuSprites[i] = loadImage("menu_main (1)" + (i + 1) + ".png");
    }
    
    backgroundSprites = new PImage[15];
    for(int i = 0; i < backgroundSprites.length; i++)
    {
      backgroundSprites[i] = loadImage("Achtergrond" + (i + 1) + ".png");
    }
    
    imageBackground = backgroundSprites[0];
    
    //screen is het scherm wat er nu op dat moment staat.
    screen = menuSprites[0];
    
    menu_control = loadImage("menu_controlUI.png");
    selected = loadImage("menu_buttonSelected.png");
    fontMenu = createFont("advanced_pixel-7.ttf",42);
    textAlign(CENTER);
    
  }
  
  void draw()
  {
    //Voor elke fase van de game is een case gemaakt.
    switch(stage)
    {
      case MENU:
        showMenu();
        break;
      case CONTROLS:
        showControls();
        break;
      case GAME:
        playGame();
        break;
     case HIGH_SCORE:
        showHigh_Score();
        break;
     case QUIT:
        quitGame();
        break;
    }
    
    frame++;
  }
  
  void showMenu()
  {
    //Om de 5 frames wordt de volgende sprite geladen voor het menu, wat zorgt voor een animatie.
    if(frame > 5)
    {
      i++;
      frame = 0;
      screen = menuSprites[i];
      //Als de i tot de max van de array gaat reset die het weer zodat het een loop wordt.
      if(i == menuSprites.length - 1)
        i = 0;
    }
    screen = menuSprites[i];
    image(screen, 0,0, screenSizeX, screenSizeY);
    image(button1, BUTTONXPOS, BUTTONYPOS, BUTTONWIDTH, BUTTONHEIGHT);
    image(button2, BUTTONXPOS, BUTTONYPOS + 100, BUTTONWIDTH, BUTTONHEIGHT);
    image(button3, BUTTONXPOS, BUTTONYPOS + 200, BUTTONWIDTH, BUTTONHEIGHT);
    image(selected, BUTTONXPOS, buttonSelectedY, 233, 91);
    fill(0);
    textFont(fontMenu);
    text("Play",290,327);
    text("Controls",290,427);
    text("Exit",290,527);
    text("press 'z' to select a button", 1075, 35);
    
    //zorgt ervoor dat het geluid niet door blijft spelen
    youLose.pause();
    youLose.rewind();
  }
  
  void showControls()
  {
    //laat de controls zien, druk 'b' om het spel te verlaten
    image(menu_control, 400, 180, 480, 360); 
    if(key == 'x')
      stage = 0;
  }
  
  void playGame()
  {
    frames++;
    if(frames > 10)
    {
      frames = 0;
      //Als de i tot de max van de array gaat reset die het weer zodat het een loop wordt.
      if(i == backgroundSprites.length - 1)
        i = 0;
      imageBackground = backgroundSprites[i];
      i++;
    }

    //gebruik background zodat 
    background(imageBackground);
    
    //zorgt ervoor dat het geluid niet door blijft spelen
    youLose.pause();
    youLose.rewind();
    
    update();
  }
  
  void showHigh_Score()
  { 
    //highscore printen   
    
    textFont(fontMenu);
    textSize(100);
    textAlign(CENTER);
    fill(0);
    text("HIGHSCORE", 640, 185);
    textAlign(LEFT);
    text("1....................... " + highscore.highScore[0], 440, 300);  
    text("2....................... " + highscore.highScore[1], 440, 375);
    text("3....................... " + highscore.highScore[2], 440, 450);
    text("4....................... " + highscore.highScore[3], 440, 525);
    text("5....................... " + highscore.highScore[4], 440, 600);
    
    textSize(95);
    textAlign(CENTER);
    fill(245, 203, 26);
    text("HIGHSCORE", 640, 185);
    textAlign(LEFT);
    text("1....................... " + highscore.highScore[0], 440, 300);  
    text("2....................... " + highscore.highScore[1], 440, 375);
    text("3....................... " + highscore.highScore[2], 440, 450);
    text("4....................... " + highscore.highScore[3], 440, 525);
    text("5....................... " + highscore.highScore[4], 440, 600);
    
    
    
    gameTheme.pause();
    gameTheme.rewind();
    
   
    textFont(fontMenu);
    textAlign(CENTER);
    fill(0);
    textSize(50);
    image(button4, BUTTONXRESTART, BUTTONYRESTART, BUTTONWIDTH, BUTTONHEIGHT);
    image(button5, BUTTONXRESTART, BUTTONYRESTART + 100, BUTTONWIDTH, BUTTONHEIGHT);
    image(selected, BUTTONXRESTART, buttonSelectedYRestart, BUTTONWIDTH, BUTTONHEIGHT);
    text("Retry", width/5, height/2+10);
    text("Menu", width/5, height/2+110);
    

    
  }
  
  void quitGame()
  {
    exit();
  }
}
