class Harpoon
{
  PImage harpoonL;
  PImage harpoonR;
  float hx;
  float hy;
  boolean set;
  boolean fired;
  boolean left;
  boolean right;
  
  Harpoon()
  {
    harpoonL = loadImage("harpoon.png");
    harpoonR = loadImage("harpoon2.png");
    
  }
 
  void right()
  {
    if(fired == true)
    {
      for(Player player:players)
      {
        image(harpoonR, hx, hy);
        hx = hx + 2;
        println(hx);
      }
    }
  }
  
  
  void left()
  {
    if(fired == true)
    {
      for(Player player:players)
      {
        image(harpoonL, hx, hy);
        hx = hx - 2;
        println(hx);
      }
    } 
  }
  
}
