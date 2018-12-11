class Highscore
{
  int finalscore;
  String[] highScore = new String[5];
   
  void setup()
  {
    highScore = loadStrings("highScore.txt");
    textAlign(CENTER);
    
    for(int i = 0;highScore.length<5;i++)
    {
      //append = 1 toevoegen
      highScore = append(highScore,str(0));
    }
    saveStrings("highScore.txt",highScore);
  }

void savescore()
  {
    highScore=append(highScore,str(finalscore));

    //je maakt het int zodat die em numeriek kan sorten.
    int[] highScoreNummer = new int[highScore.length];

    for (int i = 0; i < highScore.length; i++) 
    {
      //hier maak je van de string een int.
      highScoreNummer[i] = Integer.parseInt(highScore[i]);
    }

    //sort zorgt ervoor dat het van klein naar groot gaat.
    highScoreNummer = sort(highScoreNummer);

     for (int i = 0; i < highScoreNummer.length; i++) 
     {
     highScore[i] = "" + highScoreNummer[i];
     }
     
     //de reverse is zodat het hoog naar laag gaat.
     highScore = reverse(highScore);
     
     //Hij haalt de laatste weg. dus er zijn weer 5.
     highScore = shorten(highScore);
     saveStrings("highScore.txt",highScore);
  }
  
  void draw()
  {
    fill(0);
    textSize(70);
    textAlign(LEFT);
    text("Score: " + spawner.score, 50, 60);
  }
}
