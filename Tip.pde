class Tip
{
  int savedTime;
  int totalTime;
  PImage monster;
  PImage monster2;
  float side;
  boolean wave;
  boolean wait;
  
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
      if(player.pos.x < 0 && tipping == false && wave == false)//right tripping
        {
          temp = -1 * (player.pos.x / 250);
          i = (i + .1) + temp;
        }
        
        if(player.pos.x > 0 && tipping == false && wave == false)//Left tipping
        {
          temp =(player.pos.x / 250);
          i = (i - .1) - temp;
        }
        
        if( i < 140 || i > 220)
        {
          tipping = true;
          screens.start = false;
          i = 180;
          player.pos.x = 0;
        }
     }
     
     int passedTime = millis() - savedTime;
   
     if (passedTime > totalTime) 
     {
       side = random(0, 2);
       savedTime = millis(); // Save the current time to restart the timer!
       if( wait == false)
       {
         wave = true;
         wait = true;
       }
       else if(wait == true)
       {
         wave = false;
         wait = false;
       }
       println("Wave is "+ wave);   
       println("Wait is "+ wait);   
     }  
        
     if(side < 1 && wave == true)
     {
       //i = i + .2;
       image(monster, -210, -55);
     }
     else if(side > 1 && wave == true)
     {
       //i = i - .2;
       image(monster2, 130, -55);
     }
  }
}
