class Menu
{
  int timer;
  int frame = 0;
  int frameInGame = 0;
  int i = 0;
  int p = 0;
  
  final int MENU = 0;
  final int CONTROLS = 1;
  final int GAME = 2;
  final int HIGH_SCORE = 3;
  final int QUIT = 4;
  final int GAME_MENU = 5;
  int stage = MENU;
  
  PFont title, fontMenu;
  PImage screen, selected, selectedInGameMenu, menu_control, j4, button1, button2, button3, buttonGameMenu_MENU, buttonGameMenu_QUIT, buttonGameMenu_CONTINUE, imageBackground;
  PImage [] menuSprites;
  PImage [] backgroundSprites;
  int screenSizeX = 1280, screenSizeY = 720;
  final int BUTTONXPOS = 175;
  final int BUTTONYPOS = 275;
  final int BUTTONHEIGHT = 89;
  final int BUTTONWIDTH = 231;
  
  final int BUTTONXRESTART = width/2;
  final int BUTTONYRESTART = height/2;
  int buttonSelectedY = 275;
  int buttonSelectedYRestart = BUTTONYRESTART;
  
  Menu()
  {
    //Afbeeldingen worden geladen op een variabel.
    button1 = loadImage("menu_button.png");
    button2 = loadImage("menu_button.png");
    button3 = loadImage("menu_button.png");
    
    buttonGameMenu_CONTINUE = loadImage("gameMenuButton.png");
    buttonGameMenu_MENU = loadImage("gameMenuButton.png");
    buttonGameMenu_QUIT = loadImage("gameMenuButton.png");
  
    //Afbeelding laden voor de animatie bij het menu en in game.
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
    selectedInGameMenu = loadImage("gameMenuButtonPressed.png");
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
     case GAME_MENU:
         gameMenu();
         break;
    }
    
    frame++;
  }
  
  
  void showMenu()
  {
    //Om de 5 frames wordt de volgende sprite geladen voor het menu, wat zorgt voor een animatie.
    if(frame > 5)
    {
      //Als de i tot de max van de array gaat reset die het weer zodat het een loop wordt.
      if(i == menuSprites.length - 1)
        i = 0;
      frame = 0;
      screen = menuSprites[i];
      i++;
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
    image(menu_control, 440, 180, 480, 360); 
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
      if(p == backgroundSprites.length)
        p = 0;
      imageBackground = backgroundSprites[p];
      p++;
    }

    //gebruik background zodat het over de roads wordt geplaatst.
    background(imageBackground);
    
    //zorgt ervoor dat het geluid niet door blijft spelen
    youLose.pause();
    
    //speelt daadwerkelijk het spel
    update();
    
    fill(0);
    textSize(40);
    text("Press esc for menu", 50, 100);
  }
  
  void showHigh_Score()
  {   
    //highscore printen   
    
    textFont(fontMenu);
    textSize(100);
    textAlign(CENTER);
    fill(0);
    text("HIGHSCORE", width/3 * 2, 185);
    textAlign(CENTER);
    text("1......................." + highscore.highScore[0], width/3 * 2, 300);  
    text("2......................." + highscore.highScore[1], width/3 * 2, 375);
    text("3......................." + highscore.highScore[2], width/3 * 2, 450);
    text("4......................." + highscore.highScore[3], width/3 * 2, 525);
    text("5......................." + highscore.highScore[4], width/3 * 2, 600);
    
    //Doet de tekst 2 keer, maar dan met een verschillende kleur en grootte voor een 3D/rand effect.
    textSize(95);
    textAlign(CENTER);
    fill(245, 203, 26);
    text("HIGHSCORE", width/3 * 2, 185);
    textAlign(CENTER);
    text("1......................." + highscore.highScore[0], width/3 * 2, 300);  
    text("2......................." + highscore.highScore[1], width/3 * 2, 375);
    text("3......................." + highscore.highScore[2], width/3 * 2, 450);
    text("4......................." + highscore.highScore[3], width/3 * 2, 525);
    text("5......................." + highscore.highScore[4], width/3 * 2, 600);
    
    
    gameTheme.pause();
    gameTheme.rewind();
    
   
    textFont(fontMenu);
    textAlign(CENTER);
    fill(0);
    textSize(100);
    text("Press any key", width/4, height/2);
    text("to continue...", width/4, height/5 * 3);
  }
  
  void gameMenu()
  {
    textFont(fontMenu);
    textAlign(CENTER);
    fill(0);
    textSize(50);
    image(buttonGameMenu_CONTINUE, BUTTONXRESTART, BUTTONYRESTART, BUTTONWIDTH, BUTTONHEIGHT);
    image(buttonGameMenu_MENU, BUTTONXRESTART, BUTTONYRESTART + 100, BUTTONWIDTH, BUTTONHEIGHT);
    image(buttonGameMenu_QUIT, BUTTONXRESTART, BUTTONYRESTART + 200, BUTTONWIDTH, BUTTONHEIGHT);
    image(selectedInGameMenu, BUTTONXRESTART, buttonSelectedYRestart, BUTTONWIDTH, BUTTONHEIGHT);
    text("Continue", width/2, height/2 + 10);
    text("Menu", width/2, height/2+110);
    text("Quit", width/2, height/2+210); 
  }
  
  void quitGame()
  {
    exit();
  }
}
