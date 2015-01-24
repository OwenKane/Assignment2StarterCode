class Start
{
  PImage screen;
  boolean go;
  
  Start()
  {
    screen = loadImage("splash.png");    
    go = false;
  }
  
  void display()
  { 
    if( go == false)
    {
      image(screen, 0, 0);
      tipping = false;
    }
  }
  
  void mouseClicked()
  {
    go = true;
  }
  
}
