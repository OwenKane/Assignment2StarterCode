class Tip
{
  int savedTime;
  int totalTime;
  PImage monster;
  PImage monster2;
  float side;
  boolean attack;
  boolean wait;
  boolean attright;
  boolean attleft;
  int passedTime;
  
  Tip()
  {
    savedTime = millis();  
    totalTime = 5000;
    monster = loadImage("monster.png");
    monster2 = loadImage("monster2.png");
  }
  
  void update()
  {
    for(Player player:players)
    {
      if(player.pos.x < 0 && tipping == false && attack == false)//right tripping
        {
          temp = -1 * (player.pos.x / 250);
          i = (i + .1) + temp;
        }
        
        if(player.pos.x > 0 && tipping == false && attack == false)//Left tipping
        {
          temp =(player.pos.x / 250);
          i = (i - .1) - temp;
        }
        
        if( i < 140 || i > 220)
        {
          tipping = true;
          end.go = true;
          i = 180;
          player.pos.x = 0;
        }
     }
     
     passedTime = millis() - savedTime;
   
     if (passedTime > totalTime) 
     {
       side = random(0, 2);
       savedTime = millis(); // Save the current time to restart the timer!
       if( wait == false)
       {
         attack = true;
         wait = true;
       }
       else if(wait == true)
       {
         attack = false;
         wait = false;
         attleft = false;
         attright = false;
       } 
     }  
            
     if(side < 1 && attright == true)
     {
       i = i + .3;
       image(monster, -210, -55);
     }
     else if(side > 1 && attleft == true)
     {
       i = i - .3;
       image(monster2, 130, -55);
     }
          
     if(side < 1 && attack == true)
     {
       attright = true;
     }
     else if(side > 1 && attack == true)
     {
       attleft = true;
     }
  }
}
