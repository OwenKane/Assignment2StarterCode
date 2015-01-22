class Screens
{
  PImage splash;
  boolean start;
  
  Screens()
  {
    splash = loadImage("splash.png");    
    start = false;
  }
  
  void display()
  { 
    if( start == false)
    {
      image(splash, 0, 0);
      tipping = false;
    }
  }
  
  void mouseClicked()
  {
    start = true;
    println("in mouse clicked");
    
  }
  
}
