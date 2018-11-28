class Highscore{
  int finalscore;
  String[] highScore = new String[5];
   

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
      

    saveStrings("highScore.txt",highScore);
  }
  
  
 void draw()
  {
    
      
    
    text("Score: " + spawner.score, 150, 60);  
  }
}

//if spawner.score > highscore[4], highscore[4] = spawner.score
