class Timer
{
  int huidigeTijd;
  int interval;
  int timer = 2000;

// millis = tijd in milisec
  Timer(int interval)
  {
   
    huidigeTijd = millis();
    this.interval = interval;
  }

  boolean checkTime()
  {
    if (millis() - huidigeTijd > interval)
    {
      huidigeTijd = millis();
      return true;
    } 
    return false;
  }
}
