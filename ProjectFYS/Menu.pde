class Menu
{
  final int menu = 0;
  final int controls = 1;
  final int game = 2;
  final int high_score = 3;
  final int quit = 4;
  int stage = menu;
  
  PFont title;
  PImage startscreen, selected, menu_control, j4, button1, button2, button3;
  int screenSizeX = 1280, screenSizeY = 720;
  final int BUTTONXPOS = 175;
  final int BUTTONYPOS = 275;
  final int BUTTONHEIGHT = 89;
  final int BUTTONWIDTH = 231;
  int buttonSelectedY = 275;
  
  Menu()
  {
    // menu
    //Afbeeldingen worden geladen op een variabel.
    button1 = loadImage("menu_button.png");
    button2 = loadImage("menu_button.png");
    button3 = loadImage("menu_button.png");
    startscreen = loadImage("menu_main.png");
    menu_control = loadImage("menu_controlUI.png");
    selected = loadImage("menu_buttonSelected.png");
    textAlign(CENTER);
    textSize(20);
  }
  
  void draw()
  {
    switch(stage)
    {
      case menu:
        showMenu();
        break;
      case controls:
        showControls();
        break;
      case game:
        playGame();
        break;
     case high_score:
        showHigh_Score();
        break;
     case quit:
        quitGame();
        break;
    }
  }
  
  void showMenu()
  {
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
  
  void showControls()
  {
    //laat de controls zien, druk 'b' om het spel te verlaten
    image(menu_control, 400, 180, 480, 360); 
    loadImage("menu_controlUI.png");
    if(key == 'b')
      stage = 0;
  }
  
  void playGame()
  {
    background(160, 200, 230);
    update();
  }
  
  void showHigh_Score()
  {
    //highscore printen
    PFont font;
    font = createFont("Fipps-Regular",50);
    textFont(font);
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
  
  void quitGame()
  {
    exit();
  }
}
