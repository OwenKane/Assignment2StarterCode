ArrayList<Player> players = new ArrayList<Player>();
boolean[] keys = new boolean[526];

Ship ship;
Screens screens;
Tip tip;
Harpoon harpoon;

int left;
int right;
float i = 180;
float w = 300;
float barrely = -40;
float barrelx = -100;
float h = 40;
boolean tipping;
float temp = 0;
float disttempy = 0;
float disttempx = 0;
PImage sea;
PImage sky;


void setup()
{
  size(800, 600);
  setUpPlayerControllers();
  
  ship = new Ship();
  screens = new Screens();
  tip = new Tip();
  harpoon = new Harpoon();
  
  sea = loadImage("sea1.png");
  sky = loadImage("sky2.png");
  
}

void draw()
{
  if(screens.start == false)
  {
    screens.display();
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
    }
    
    if(left == 1)
    {
      harpoon.hx = harpoon.hx - 2;
      image(harpoon.harpoonL, harpoon.hx, harpoon.hy);
    }
    left = 1;
    if(right == 1)
    {
      harpoon.hx = harpoon.hx + 2;
      image(harpoon.harpoonR, harpoon.hx, harpoon.hy);
    }
  
    translate(width/2, height/2);
    popMatrix();
    image(sea, 0, 345);
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
