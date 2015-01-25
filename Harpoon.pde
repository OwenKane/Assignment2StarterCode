class Harpoon
{
  PImage harpoonL;
  PImage harpoonR;
  float hx;
  float hy;
  boolean set;
  boolean fired;

  
  Harpoon()
  {
    harpoonL = loadImage("harpoon.png");
    harpoonR = loadImage("harpoon2.png");    
  }
 
  void right()
  {
    if(fired == false)
    {
      for(Player player:players)
      {
        harpoon.hx = player.pos.x;
        harpoon.hy = player.pos.y - 60;
        harpoon.fired = true;
        harpoon.set = true;
        right = true;
      }    
    }
  }  
  
  void left()
  {
    for(Player player:players)
    {
      if(fired == false)
      {
        harpoon.hx = player.pos.x;
        harpoon.hy = player.pos.y - 60;
        harpoon.fired = true;
        harpoon.set = true;
        left = true;    
      }
    }
  }
  
  void disappear()
  {
    if( harpoon.hx > 130)
    {
      fired = false;
      left = false;
      if( tip.attleft == true )
      {
        tip.attleft = false;
        tip.attack = false;
        tip.passedTime = 5000;
      }
      
    }
    
    if( harpoon.hx < -155)
    {
      fired = false;
      right = false;
      if(tip.attright == true)
      {
        tip.attright = false;
        tip.attack = false;
        tip.passedTime = 5000;
      }
      
    }
  }
}

