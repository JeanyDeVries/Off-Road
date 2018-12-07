class Highscore
{
  int finalscore;
  String[] highScore = new String[5];
<<<<<<< HEAD
   

 void setup(){
     highScore = loadStrings("highScore.txt");
    textAlign(CENTER);
    textSize(50);
 
  }
  void savescore()
{
  for(int i=0;highScore.length<5;i++){
   highScore=append(highScore,str(0));
   }

   saveStrings("highScore.txt",highScore);
   
    highScore=append(highScore,str(finalscore));

    int[] highScoreNummer = new int[highScore.length];

    for (int i = 0; i < highScore.length; i++) {
    highScoreNummer[i] = Integer.parseInt(highScore[i]);
    }
    
highScoreNummer = sort(highScoreNummer);
      
     for (int i = 0; i < highScoreNummer.length; i++) {
     highScore[i] = "" + highScoreNummer[i];
      }
      
      
      highScore = reverse(highScore);
     highScore = shorten(highScore);
      
=======

  void setup()
  {
    highScore = loadStrings("highScore.txt");
    textAlign(CENTER);
    textSize(50);
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

>>>>>>> c71cd6807f373f5906043fc3941f32fe75daa588

    saveStrings("highScore.txt",highScore);
  }
  
<<<<<<< HEAD
  
 void draw()
  {
    
      
    
    text("Score: " + spawner.score, 150, 60);  
=======
  void draw()
  {
    text("Score: " + spawner.score, 150, 60);
>>>>>>> c71cd6807f373f5906043fc3941f32fe75daa588
  }
}

//if spawner.score > highscore[4], highscore[4] = spawner.score
