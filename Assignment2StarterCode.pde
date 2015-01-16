ArrayList<Player> players = new ArrayList<Player>();
boolean[] keys = new boolean[526];

Ship ship;
Screens screens;
float i = 180;
float w = 300;
float j = 0;
float h = 40;
boolean tip;
float temp = 0;
PImage sea;
PImage sky;

void setup()
{
  size(800, 600);
  setUpPlayerControllers();
  ship = new Ship();
  screens = new Screens();
  sea = loadImage("sea1.png");
  sky = loadImage("sky2.png");  
}

void draw()
{
  if(screens.start == false)
  {
    screens.display();
    tip = false;
  }
  else
  {  
    background(255);
    image(sky, 0, 0);
    
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(i));  
    fill(255);
    
    ship.display();
    
    rectMode(CORNER); 
    for(Player player:players)
    {
      player.update();
      player.display();
      player.pos.y = 20;
      
      if(player.pos.x < 0 && tip == false)//right tripping
      {
        temp = -1 * (player.pos.x / 250);
        i = (i + .1) + temp;
        //println("x is < 0" + player.pos.x);
      }
      
      if(player.pos.x > 0 && tip == false)//Left tipping
      {
        temp =(player.pos.x / 250);
        i = (i - .1) - temp;
        //println("x is > 0" + player.pos.x);
      }
      
      if( i < 140 || i > 220)
      {
        tip = true;
        screens.start = false;
        i = 180;
        player.pos.x = 0;
      }
      
      
      rect(width/2, j, 20, 20);  
      if(dist(player.pos.x, player.pos.y, width/2, j) < 20)
      {
        tip = true;
      }
      
      println( dist(player.pos.x, player.pos.y, width/2, j));
        
    }
    popMatrix();
    image(sea, 0, 345);
    
   
    rect(width/2, j, 20, 20);
    j++;
    
    
  }
}

void mouseClicked()
{
  screens.mouseClicked();
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
  //.. Others to follow
  return value.charAt(0);  
}

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);
  
  for(int i = 0 ; i < children.length ; i ++)  
  {
    XML playerXML = children[i];
    Player p = new Player(
            i
            , color(random(0, 255), random(0, 255), random(0, 255))
            , playerXML);
    int x = (i + 1) * gap;
    p.pos.x = 0;
    p.pos.y = 20;
   players.add(p);       
  }
}
