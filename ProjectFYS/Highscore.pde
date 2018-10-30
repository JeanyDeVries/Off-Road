class Highscore{
  int finalscore;
  int[] highscore = new int[5];
  
  void setup(){
    
    textAlign(CENTER);
    textSize(50);

  }
  void draw(){
        text("Score: " + spawner.score, 150, 60);
        
  }
}
