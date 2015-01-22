class Harpoon
{
  PImage harpoonL;
  PImage harpoonR;
  float hx;
  float hy;
  
  Harpoon()
  {
    harpoonL = loadImage("harpoon.png");
    harpoonR = loadImage("harpoon2.png");
    
    for(Player player:players)
    {
      hx = player.pos.x;
      hy = hx = player.pos.y ;
    }
  }
 
  void right()
  {
    for(Player player:players)
    {
      image(harpoonR, hx, hy);
      hx = hx + 2;
    }
  }
  
  
  void left()
  {
    for(Player player:players)
    {
      image(harpoonL, hx, hy);
      hx = hx - 2;
    }
  }
  
}
