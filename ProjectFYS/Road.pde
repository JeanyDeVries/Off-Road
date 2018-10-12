class Road
{
  float x, y, w, h;
  
  Road()
  {
    x = (width / 5) * 2;
    y = 0;
    w = width /5;
    h = height;
  }
  
  void Render()
  {
    stroke(0);
    fill(70);
    rect(x, y ,w ,h);
  }
}
