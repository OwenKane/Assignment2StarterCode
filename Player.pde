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
      pos.x += 1;
    }    
    if (checkKey(right) && pos.x > -150)
    {
      pos.x -= 1;
    }
    if (checkKey(start))
    {
      println("Player " + index + " start");
    }
    if (checkKey(button1))
    {
      println("Player " + index + " button 1");
      harpoon.right();
    }
    if (checkKey(button2))
    {
      println("Player " + index + " butt2");
      harpoon.left();
    }    
  }
  
  void display()
  {    
    stroke(colour);
    fill(colour);  
    //rect(pos.x, pos.y, 20, 20);
    scale(1.0, -1.0);
    image(pirate, pos.x, pos.y - 80);
    //println("X is" + pos.x);
    //println("Y is" +pos.y);
  }  
}
