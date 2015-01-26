class End extends StartS
{  
  End()
  {
    screen = loadImage("end.png");    
    go = false;
  }
  
  void display()
  { 
    if( go == true)
    {
      image(screen, 0, 0);
      tipping = false;
      move = false;
    }
  }
  
  void mouseClicked()
  {
    go = false;   
  }
  
}
