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
      
      textSize(70);
      text("Score: "+ points, width/2 - 150, height / 2);
      
      tipping = false;
      move = false;
    }
  }
  
  void mouseClicked()
  {
    points = 0;
    go = false;   
    move = true;
    tip.savedTime = millis(); 
  }
  
}
