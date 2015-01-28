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
      fill(255,0,0);
      text("Score: "+ points, width/2 - 150, height / 2);
      
      for(Player player:players)
      {
        player.update();
      }

      tipping = false;
      move = false;
      
    }
  }  
}
