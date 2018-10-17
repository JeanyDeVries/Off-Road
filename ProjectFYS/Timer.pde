class Timer{
  int huidigeTijd;
  int interval;
 
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
