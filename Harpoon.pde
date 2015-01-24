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
      println("In the 1st if");
      if( tip.attleft == true )
      {
        tip.attleft = false;
        tip.attack = false;
        println("In the final if attleft is " + tip.attleft);
        tip.passedTime = 5000;
      }
      
    }
    
    if( harpoon.hx < -155)
    {
      fired = false;
      right = false;
      println("In the 1st if");
      if(tip.attright == true)
      {
        tip.attright = false;
        tip.attack = false;
        println("In the final if attright is " + tip.attright);
        tip.passedTime = 5000;
      }
      
    }
  }
}


















