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
  float diff;
  
  Tip()
  {
    savedTime = millis();  
    totalTime = 3000;
    monster = loadImage("monster.png");
    monster2 = loadImage("monster2.png");
  }
  
  void update()
  {
    if(option == 0)
    { 
      diff = .1;
    }
    else if(option == 2);
    {
      diff = .3;
    }
    
    if(startS.go == true)
    {
      for(Player player:players)
      {
        if(player.pos.x < 0 && tipping == false && attack == false)//right tripping
          {
            temp = -1 * (player.pos.x / 250);
            i = (i + diff) + temp;
          }
          
          if(player.pos.x > 0 && tipping == false && attack == false)//Left tipping
          {
            temp =(player.pos.x / 250);
            i = (i - diff) - temp;
          }
          
          if( i < 140 || i > 220)
          {
            tipping = true;
            end.go = true;
            i = 180;
            player.pos.x = 0;
            savedTime = millis();
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
         i = i + .4;
         image(monster, -210, -55);
       }
       else if(side > 1 && attleft == true)
       {
         i = i - .4;
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
}
