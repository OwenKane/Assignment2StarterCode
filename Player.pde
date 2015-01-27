class Player
{
  PVector pos;
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int index;
  color colour;
  PImage pirate;
    
  Player()
  {
    pos = new PVector(0, 0);
    pirate = loadImage("pirate.png"); 
  }
  
  Player(int index, color colour, char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();
    this.index = index;
    this.colour = colour;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
  }
  
  Player(int index, color colour, XML xml)
  {
    this(index
        , colour
        , buttonNameToKey(xml, "up")
        , buttonNameToKey(xml, "down")
        , buttonNameToKey(xml, "left")
        , buttonNameToKey(xml, "right")
        , buttonNameToKey(xml, "start")
        , buttonNameToKey(xml, "button1")
        , buttonNameToKey(xml, "button2")
        );
  }
  
  void update()
  {
    if (checkKey(up))
    {
      pos.y -= 1;
    }
    if (checkKey(down))
    {
      pos.y += 1;
    }
    if (checkKey(left) && pos.x < 140)
    {
      if(move == true)
      {
        pos.x += 1;
      } 
      else
      {
        option -= 1;
      }
    }    
    if (checkKey(right) && pos.x > -150)
    {
      if(move == true)
      {   
        pos.x -= 1;
      }
      else
      {
        option += 1;
      }
    }
    if (checkKey(start))
    {
      
      if(instruct.go == true)
      {       
        instruct.go = false;
        option = 0;
      }
      
      if(instruct.go == false)
      {
        startS.restart();    
      }
      
      if(end.go == true)
      {
        points = 0;
        end.go = false;   
        tip.savedTime = millis(); 
        //startS.restart();    
        startS.go = false;        
      }
      
    }
    if (checkKey(button1))
    {      
      harpoon.left();       
    }
    if (checkKey(button2))
    {   
      harpoon.right();      
    }    
  }
  
  void display()
  {    
    stroke(colour);
    fill(colour);  
    scale(1.0, -1.0);
    image(pirate, pos.x, pos.y - 80);
  }  
}
