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
      textSize(32);
      
      if(option == 0)
      {
        fill(#d9da02);
      }
      else
      {
        fill(#ED7524);
      }
      rect(50, height / 2 - 80, 120, 80, 7);
      fill(0);
      text("Normal", 55, height / 2 - 30);
      
      if(option == 1)
      {
        fill(#d9da02);
      }
      else
      {
        fill(#ED7524);
      }
      rect(345, height / 2 - 80, 120, 80, 7);
      fill(0);
      textSize(19);
      text("Instructions", 350, height / 2 - 30);
      
      if(option == 2)
      {
        fill(#d9da02);
      }
      else
      {
        fill(#ED7524);
      }
      rect(620, height / 2 - 80, 120, 80, 7);
      fill(0);
      textSize(32);
      text("Hard", 645, height / 2 - 30);
      
    }
  }
  
  void mouseClicked()
  {
    go = true;
    move = true;
  }
  
}
