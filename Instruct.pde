class Instruct extends StartS
{  
  Instruct()
  {
    screen = loadImage("ins.png");    
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
    option = 0;   
  }    
    
    
}
